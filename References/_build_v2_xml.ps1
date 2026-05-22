$ErrorActionPreference = 'Stop'
$repo = 'H:\My Asaf\LAW\ASAF FULKS LAW\BIP - Consensus Change Standards'
$srcDocx = Join-Path $repo 'Old\consensus_change_standards.docx'
$dstDocx = Join-Path $repo 'consensus_change_standards_v2.docx'

# ============================================================
# Encoding-safe Unicode constants (pure-ASCII source -> no encoding pitfalls)
# ============================================================
$apos  = [char]0x2019  # ' curly right single quote / apostrophe
$lsq   = [char]0x2018  # ' curly left single quote
$lq    = [char]0x201C  # " curly left double quote
$rq    = [char]0x201D  # " curly right double quote
$emdash= [char]0x2014  # -- em-dash
$ssign = [char]0x00A7  # section sign
$leq   = [char]0x2264  # less than or equal
$mult  = [char]0x00D7  # multiplication
$bull  = [char]0x00B7  # middle dot
$nbsp  = [char]0x00A0  # non-breaking space
$idia  = [char]0x00EF  # i with diaeresis (for "naive" -> "naive" with the dots)

# ============================================================
# Setup
# ============================================================
Write-Output "Copying source -> v2.docx"
Copy-Item -Force $srcDocx $dstDocx
Add-Type -AssemblyName System.IO.Compression.FileSystem
Add-Type -AssemblyName System.IO.Compression

Write-Output "Opening v2.docx ZIP, reading document.xml (UTF-8 explicit)"
# ZipArchiveMode: Read=0, Create=1, Update=2 — using integer to avoid type-load issue on PS 5.1
$zip = [System.IO.Compression.ZipFile]::Open($dstDocx, 2)
$entry = $zip.Entries | Where-Object { $_.FullName -eq 'word/document.xml' }
$readStream = $entry.Open()
$reader = New-Object System.IO.StreamReader($readStream, [System.Text.Encoding]::UTF8)
$xml = $reader.ReadToEnd()
$reader.Close()
$readStream.Close()

$script:xml = $xml
$script:log = @()

# ============================================================
# Helpers
# ============================================================
function Replace-XmlText {
    param([string]$old, [string]$new, [string]$label)
    if ($script:xml.Contains($old)) {
        $script:xml = $script:xml.Replace($old, $new)
        $script:log += "OK   $label"
    } else {
        $script:log += "MISS $label"
    }
}

function Xml-Escape {
    param([string]$text)
    return $text.Replace('&', '&amp;').Replace('<', '&lt;').Replace('>', '&gt;')
}

function Build-BodyPara {
    param([string]$text)
    $e = Xml-Escape $text
    return '<w:p><w:pPr><w:spacing w:after="0" w:line="360" w:lineRule="auto"/><w:ind w:firstLine="432"/><w:jc w:val="both"/></w:pPr><w:r><w:rPr><w:color w:val="333333"/></w:rPr><w:t xml:space="preserve">' + $e + '</w:t></w:r></w:p>'
}

function Build-BodyParaBoldPrefix {
    param([string]$boldPrefix, [string]$bodyText)
    $b = Xml-Escape $boldPrefix
    $t = Xml-Escape $bodyText
    return '<w:p><w:pPr><w:spacing w:after="0" w:line="360" w:lineRule="auto"/><w:ind w:firstLine="432"/><w:jc w:val="both"/></w:pPr><w:r><w:rPr><w:b/><w:bCs/><w:color w:val="333333"/></w:rPr><w:t xml:space="preserve">' + $b + '</w:t></w:r><w:r><w:rPr><w:color w:val="333333"/></w:rPr><w:t xml:space="preserve">' + $t + '</w:t></w:r></w:p>'
}

function Build-Heading2 {
    param([string]$text)
    $e = Xml-Escape $text
    # keepNext = heading stays with following paragraph (no stranding at page bottom)
    return '<w:p><w:pPr><w:pStyle w:val="Heading2"/><w:keepNext/></w:pPr><w:r><w:t xml:space="preserve">' + $e + '</w:t></w:r></w:p>'
}

function Insert-Before-Anchor {
    param([string]$anchorTextSubstring, [string]$newParasXml, [string]$label)
    $idx = $script:xml.IndexOf($anchorTextSubstring)
    if ($idx -lt 0) {
        $script:log += "MISS insert: $label  (anchor text not found)"
        return
    }
    # Walk backwards to find the <w:p> opening tag (handle both <w:p> and <w:p ...>)
    $pIdx1 = $script:xml.LastIndexOf('<w:p ', $idx)
    $pIdx2 = $script:xml.LastIndexOf('<w:p>', $idx)
    $pOpen = [Math]::Max($pIdx1, $pIdx2)
    if ($pOpen -lt 0) {
        $script:log += "MISS insert: $label  (<w:p> opening tag not found)"
        return
    }
    # Check whether the IMMEDIATELY preceding paragraph is a page-break paragraph.
    # If so, the page break belongs to the major section / anchor — keep it adjacent
    # to the anchor by inserting BEFORE the page-break paragraph (so our new content
    # goes before the page break, and page-break + anchor remain together).
    $insertPos = $pOpen
    $prevPClose = $script:xml.LastIndexOf('</w:p>', $pOpen)
    if ($prevPClose -ge 0) {
        $prevPIdx1 = $script:xml.LastIndexOf('<w:p ', $prevPClose)
        $prevPIdx2 = $script:xml.LastIndexOf('<w:p>', $prevPClose)
        $prevPOpen = [Math]::Max($prevPIdx1, $prevPIdx2)
        if ($prevPOpen -ge 0 -and $prevPOpen -lt $pOpen) {
            $prevParaContent = $script:xml.Substring($prevPOpen, $pOpen - $prevPOpen)
            if ($prevParaContent -match '<w:br\s+w:type="page"\s*/>') {
                # Preceding paragraph is a page break — insert before it so it stays with anchor
                $insertPos = $prevPOpen
                $script:log += "NOTE insert: $label  (insert positioned before page-break paragraph to preserve major-section break)"
            }
        }
    }
    $script:xml = $script:xml.Substring(0, $insertPos) + $newParasXml + $script:xml.Substring($insertPos)
    $script:log += "OK   insert: $label"
}

function Italicize-See-Before-Name {
    # Match "See <followingName>..." within a plain run.
    # Splits the run: prefix, italic "See ", suffix (starting with the name).
    param([string]$followingName)
    $escapedFollowing = [regex]::Escape($followingName)
    $pattern = '<w:r>(<w:rPr>((?:[^<]|<(?!/w:rPr>))*?)</w:rPr>)?<w:t([^>]*)>([^<]*?)See (' + $escapedFollowing + '[^<]*?)</w:t></w:r>'
    $hits = 0
    $sb = New-Object System.Text.StringBuilder
    $lastEnd = 0
    foreach ($m in [regex]::Matches($script:xml, $pattern)) {
        $rPrFull = $m.Groups[1].Value
        $rPrInner = $m.Groups[2].Value
        $tAttrs = $m.Groups[3].Value
        $preText = $m.Groups[4].Value
        $postTextWithName = $m.Groups[5].Value
        $italicRPr = '<w:rPr><w:i/><w:iCs/>' + $rPrInner + '</w:rPr>'
        [void]$sb.Append($script:xml.Substring($lastEnd, $m.Index - $lastEnd))
        [void]$sb.Append('<w:r>' + $rPrFull + '<w:t' + $tAttrs + '>' + $preText + '</w:t></w:r>')
        [void]$sb.Append('<w:r>' + $italicRPr + '<w:t xml:space="preserve">See </w:t></w:r>')
        [void]$sb.Append('<w:r>' + $rPrFull + '<w:t' + $tAttrs + '>' + $postTextWithName + '</w:t></w:r>')
        $lastEnd = $m.Index + $m.Length
        $hits++
    }
    [void]$sb.Append($script:xml.Substring($lastEnd))
    $script:xml = $sb.ToString()
    if ($hits -gt 0) {
        $script:log += "OK   italicize: See before '$followingName' ($hits)"
    } else {
        $script:log += "MISS italicize: See before '$followingName'"
    }
}

function Italicize-See-Before-Italic-Run {
    # Match a plain run whose text ends with "See " immediately followed by an italic run.
    # Splits the plain run: keeps prefix, adds italic "See " run, then chains into next italic run.
    $pattern = '<w:r>(<w:rPr>((?:[^<]|<(?!/w:rPr>))*?)</w:rPr>)?<w:t([^>]*)>([^<]*?)See\s+</w:t></w:r>(<w:r><w:rPr><w:i/>)'
    $hits = 0
    $sb = New-Object System.Text.StringBuilder
    $lastEnd = 0
    foreach ($m in [regex]::Matches($script:xml, $pattern)) {
        $rPrFull = $m.Groups[1].Value
        $rPrInner = $m.Groups[2].Value
        $tAttrs = $m.Groups[3].Value
        $preText = $m.Groups[4].Value
        $nextItalicOpen = $m.Groups[5].Value
        $italicRPr = '<w:rPr><w:i/><w:iCs/>' + $rPrInner + '</w:rPr>'
        [void]$sb.Append($script:xml.Substring($lastEnd, $m.Index - $lastEnd))
        [void]$sb.Append('<w:r>' + $rPrFull + '<w:t' + $tAttrs + '>' + $preText + '</w:t></w:r>')
        [void]$sb.Append('<w:r>' + $italicRPr + '<w:t xml:space="preserve">See </w:t></w:r>')
        [void]$sb.Append($nextItalicOpen)
        $lastEnd = $m.Index + $m.Length
        $hits++
    }
    [void]$sb.Append($script:xml.Substring($lastEnd))
    $script:xml = $sb.ToString()
    if ($hits -gt 0) {
        $script:log += "OK   italicize signal: See before italic ($hits)"
    } else {
        $script:log += "MISS italicize signal: See before italic"
    }
}

function Italicize-Phrase {
    param([string]$phrase, [string]$label)
    # XML-encode the phrase so '&' / '<' / '>' match the encoded form in document.xml
    $encodedPhrase = $phrase.Replace('&', '&amp;').Replace('<', '&lt;').Replace('>', '&gt;')
    # Match: <w:r>[optional rPr]<w:t [attrs]>PRE phrase POST</w:t></w:r>
    $escapedPhrase = [regex]::Escape($encodedPhrase)
    $pattern = '<w:r>(<w:rPr>((?:[^<]|<(?!/w:rPr>))*?)</w:rPr>)?<w:t([^>]*)>([^<]*?)' + $escapedPhrase + '([^<]*?)</w:t></w:r>'
    $totalHits = 0
    $maxPasses = 50  # safety against infinite loops
    do {
        $passHits = 0
        $sb = New-Object System.Text.StringBuilder
        $lastEnd = 0
        $anyChange = $false
        foreach ($m in [regex]::Matches($script:xml, $pattern)) {
            [void]$sb.Append($script:xml.Substring($lastEnd, $m.Index - $lastEnd))
            $rPrInner = $m.Groups[2].Value
            # Skip runs that are already italic (rPr contains <w:i/>) — prevents infinite re-italicization
            if ($rPrInner -match '<w:i\s*/>') {
                [void]$sb.Append($m.Value)
            } else {
                $rPrFull = $m.Groups[1].Value
                $tAttrs = $m.Groups[3].Value
                $preText = $m.Groups[4].Value
                $postText = $m.Groups[5].Value
                $italicRPr = '<w:rPr><w:i/><w:iCs/>' + $rPrInner + '</w:rPr>'
                [void]$sb.Append('<w:r>' + $rPrFull + '<w:t' + $tAttrs + '>' + $preText + '</w:t></w:r>')
                [void]$sb.Append('<w:r>' + $italicRPr + '<w:t' + $tAttrs + '>' + $encodedPhrase + '</w:t></w:r>')
                [void]$sb.Append('<w:r>' + $rPrFull + '<w:t' + $tAttrs + '>' + $postText + '</w:t></w:r>')
                $passHits++
                $anyChange = $true
            }
            $lastEnd = $m.Index + $m.Length
        }
        if ($anyChange) {
            [void]$sb.Append($script:xml.Substring($lastEnd))
            $script:xml = $sb.ToString()
            $totalHits += $passHits
        }
        $maxPasses--
    } while ($passHits -gt 0 -and $maxPasses -gt 0)
    if ($totalHits -gt 0) {
        $script:log += "OK   italicize: $label ($totalHits)"
    } else {
        $script:log += "MISS italicize: $label"
    }
}

# ============================================================
# EDIT 1 - Title page version
# ============================================================
Replace-XmlText `
    ("First Edition " + $emdash + " April 2026 (Revised May 2026)") `
    ("Second Edition " + $emdash + " May 2026") `
    "Edit 1a: Title page version line"

Replace-XmlText `
    ("April 2026 " + $bull + " Revised May 2026") `
    ("Second Edition " + $bull + " May 2026") `
    "Edit 1b: Footer publication line"

# ============================================================
# EDIT 2 - Insert §1.0 before §1.1
# ============================================================
$content10 =
    (Build-Heading2 "1.0 How to Read This Paper") +
    (Build-BodyPara ("The framework proposed here is not an attempt to centralize authority over Bitcoin consensus. It is an attempt to give Bitcoin" + $apos + "s existing decentralized governance process a shared vocabulary for evaluating proposals.")) +
    (Build-BodyPara ("The framework evaluates the ecosystem behavior surrounding a consensus-change proposal " + $emdash + " the activation clients built around it, the review process applied to its code, the support evidence assembled in its favor, and the operational coordination preceding any deployment. It does not evaluate, and cannot evaluate, the editorial status of any BIP document. A BIP is a proposal; this framework asks which proposals merit activation, not which proposals merit filing.")) +
    (Build-BodyPara ("Readers concerned with the question of authority itself " + $emdash + " who decides? what makes one threshold " + $lq + "wrong" + $rq + " and another " + $lq + "right" + $rq + "? " + $emdash + " are encouraged to read " + $ssign + "6.2 and " + $ssign + "6.4 before " + $ssign + "3. The framework is a tool, not a rule; if that distinction does not hold for a given reader, the standards that follow will read as something they are not.")) +
    (Build-BodyPara ("Different sections serve different audiences. Protocol developers will find " + $ssign + "3 and " + $ssign + "5 most directly applicable. Businesses, exchanges, and custodians will find " + $ssign + "3.5 and " + $ssign + "4 most operationally relevant. Node operators and users will find " + $ssign + "6 most useful for evaluating what the framework asks of them and what it does not."))
Insert-Before-Anchor "1.1 The Absence of Standards" $content10 "Edit 2: §1.0 How to Read This Paper"

# ============================================================
# EDIT 3 - Append §1.2 forward-reference paragraphs before §1.3
# ============================================================
$content12fwd =
    (Build-BodyPara ("The " + $lq + "BIP-110" + $rq + " addressed throughout this paper refers to the activation attempt " + $emdash + " the RDTS client, the surrounding ecosystem campaign, and the operational coordination assembled around the proposal " + $emdash + " not to the BIP-110 document filed in the BIPs repository. A BIP is a proposal; the framework" + $apos + "s evaluative scope is the ecosystem behavior that would convert a proposal into network state.")) +
    (Build-BodyPara ("The question of how any single threshold could be " + $lq + "set" + $rq + " in a network with no central authority is foundational and is addressed in " + $ssign + "6.2 and " + $ssign + "6.4. The short answer: it cannot, in any binding sense. BIP-110" + $apos + "s proponents proposed 55%; whether the network adopted it was determined by tens of thousands of independent operator decisions, which collectively yielded " + $leq + "0.15% signaling (peak observed share of blocks signaling readiness during the activation window)."))
Insert-Before-Anchor "1.3 The Stakes" $content12fwd "Edit 3: §1.2 forward references"

# ============================================================
# EDIT 4 - Insert §1.4 Relation to Prior Work before SECTION 2
# ============================================================
$content14 =
    (Build-Heading2 "1.4 Relation to Prior Work") +
    (Build-BodyPara ("The framework proposed in this paper builds on, and is intended to be read alongside, the most developed prior analysis of Bitcoin" + $apos + "s consensus-change dynamics: Ren Crypto Fish, Steve Lee & Lyn Alden, Analyzing Bitcoin Consensus: Risks in Protocol Upgrades (Nov. 2024) [hereinafter BCAP]. BCAP categorizes participants in consensus changes into six stakeholder groups " + $emdash + " Economic Nodes, Investors, Media Influencers, Miners, Protocol Developers, and Users/Application Developers " + $emdash + " and analyzes how the relative power of each group fluctuates across the phases of a proposal" + $apos + "s lifecycle. It introduces a " + $lq + "State of Mind" + $rq + " framework distinguishing degrees of stakeholder engagement, develops a detailed scenario analysis of consensus changes deployed through alternative clients, and concludes with thirteen evaluation questions and twelve indicators stakeholders may use to assess proposals in real time. BCAP" + $apos + "s draft was reviewed by a substantial cross-section of Bitcoin" + $apos + "s protocol-development and analytical community.")) +
    (Build-BodyPara ("BCAP and the present framework address the same problem from different vantages. BCAP is descriptive: it explains how Bitcoin consensus emerges from the iterated interactions of stakeholders with shifting powers and divergent incentives. This paper is normative: it proposes the minimum standards a proposal should meet before stakeholders rationally engage with its activation. The two works converge on several substantive points. Both treat sub-overwhelming Economic Node adoption as the central failure mode in contested soft-fork scenarios " + $emdash + " BCAP through its bounty-claim and chain-split risk analysis (" + $ssign + "3.5.2), this paper through its activation-threshold standards (" + $ssign + "3.4) and chain-split risk-assessment requirement (" + $ssign + "3.5). Both treat miner signaling as a necessary but insufficient indicator of community consensus. Both reject na" + $idia + "ve majoritarianism as a consensus-determination heuristic. And both identify Economic-Node coordination as the operative remedy when an activation proceeds without genuine consensus: BCAP describes that coordination descriptively, as the mechanism by which markets re-equilibrate after a contested split; this paper prescribes it normatively, as the recommended response to a proposal classified as Red under " + $ssign + "5.2.")) +
    (Build-BodyPara ("This paper extends BCAP" + $apos + "s analytical framework in four respects. First, it operationalizes qualitative recommendations into numerical floors: minimum activation thresholds (90% MASF, with sub-80% presumptively dangerous and sub-60% reckless); minimum review periods tied to risk category (twelve months for moderate-risk soft forks, twenty-four months for high-risk soft forks, thirty-six for hard forks); and minimum testnet deployment duration (three months). Second, it quantifies the relationship between activation threshold and chain-split exposure: " + $ssign + "3.4 models post-activation hashrate as a Bernoulli process and derives concrete reorganization probabilities " + $emdash + " approximately thirty percent at E = 0.55 over a six-block horizon, falling to roughly 2" + $mult + "10" + [char]0x207B + [char]0x2078 + " at E = 0.95. This quantification is consistent with BCAP" + $apos + "s qualitative conclusion that low and high Economic Node adoption produce categorically different risk profiles, but supplies the order-of-magnitude estimates that the qualitative analysis leaves open. Third, it develops a legal-liability framework " + $emdash + " negligence (with explicit attention to the economic-loss rule and the available routes around it), tortious interference, fiduciary duty, mining-pool contract obligations, and regulatory consequences. BCAP does not address legal exposure; this paper offers it as a distinct analytical layer whose conclusions are relevant to every stakeholder group BCAP identifies. Fourth, it consolidates the foregoing into a binary twenty-point scoring rubric with classification bands (" + $ssign + "5), enabling structured evaluation in place of free-form weighing of considerations.")) +
    (Build-BodyPara ("Several elements of BCAP the present paper does not duplicate. The stakeholder taxonomy and the power-over-time analysis (BCAP " + $ssign + $ssign + "3.2, 3.3.2), the State of Mind framework (BCAP " + $ssign + "3.1), the investor-segment analysis distinguishing self-custodying holders from institutional, corporate-treasury, and exchange-traded-fund segments (BCAP " + $ssign + "3.2.2), and the alternative-client adoption-pathway analysis (BCAP " + $ssign + "3.5.1) all remain the more developed treatments of their respective subjects. This paper refers readers to BCAP for those questions. The two frameworks are intended to function together: BCAP supplies the theory of how stakeholders shape consensus; this paper supplies the standards by which stakeholders may judge whether a particular proposal is ready for that process to begin.")) +
    (Build-BodyPara ("The minimum-review-period floors proposed in " + $ssign + "3.2 are anchored in empirical observation rather than aesthetic preference. Jameson Lopp" + $apos + "s longitudinal analysis of Bitcoin Core node-software adoption documents median upgrade times measured in months " + $emdash + " historically on the order of forty weeks for routine releases, with recent versions trending longer still. See Jameson Lopp, When Do Bitcoin Node Operators Upgrade?, blog.lopp.net/when-do-bitcoin-node-operators-upgrade/. A twelve-month minimum review period for a moderate-risk soft fork accommodates a single such upgrade cycle plus a meaningful interval for review; a twenty-four-month minimum for a high-risk soft fork accommodates two. The review-period floors proposed in this framework are thus not arbitrary durations but the durations the network" + $apos + "s own observed upgrade dynamics require for activation signaling to begin from a position of broad enforcement readiness rather than speculative anticipation.")) +
    (Build-BodyPara ("The legal analysis in Section 4 engages a smaller but distinct body of prior work. Angela Walch" + $apos + "s argument that core protocol developers exercise discretionary authority over property interests sufficient to trigger fiduciary obligations is the central academic contribution to the question and is engaged directly in the fiduciary-duty analysis below. The Tulip Trading litigation (Tulip Trading Ltd v van der Laan [2023] EWCA Civ 83) is the most developed common-law treatment and frames the standard against which a developer" + $apos + "s conduct would be evaluated. The other legal questions raised by chain splits " + $emdash + " contract interpretation of " + $lq + "Bitcoin," + $rq + " tax cost-basis allocation under IRS Revenue Ruling 2019-24, exchange custodial obligations during a fork " + $emdash + " have received episodic treatment but no consolidated analysis. The legal-analysis section of this paper is offered as a starting point, not a final synthesis.")) +
    (Build-BodyPara ("This paper occupies the operational and legal layer of an emerging body of work on Bitcoin governance. It is most useful when read alongside BCAP, not in place of it."))
Insert-Before-Anchor "SECTION 2: HISTORICAL PRECEDENT" $content14 "Edit 4: §1.4 Relation to Prior Work"

# ============================================================
# EDIT 5 - Replace §3.1.E body text (bold prefix preserved)
# ============================================================
$oldEBody = " A defined procedure for deactivating the change if it produces unintended consequences. For proposals described as " + $lq + "temporary," + $rq + " this must include a self-executing sunset mechanism that does not require further community coordination to trigger."
$newEBody = " For proposals self-described as " + $lq + "temporary," + $rq + " a self-executing sunset mechanism is required (see " + $ssign + "3.6). For other soft-fork proposals, no rollback procedure is required, but the proposal should not affirmatively obstruct future reversal " + $emdash + " the consensus rules should remain technically reversible via standard soft-fork or hard-fork mechanisms."
Replace-XmlText $oldEBody $newEBody "Edit 5: §3.1.E body text"

# ============================================================
# EDIT 6 - Replace §3.3.A (bold prefix change + body text replacement)
# ============================================================
Replace-XmlText `
    "A. Independent review." `
    "A. Diverse independent review." `
    "Edit 6a: §3.3.A bold prefix label"

$oldABody = " The reference implementation must be reviewed by a minimum of three developers who are not affiliated with the proposal" + $apos + "s authors. Reviewers should have demonstrated competence in Bitcoin protocol development, as evidenced by prior contributions to Bitcoin Core, Bitcoin Knots, or another consensus-compatible implementation."
$newABody = " The reference implementation must be reviewed by a minimum of three developers whose primary organizational affiliations differ from each other and from the proposal" + $apos + "s authors. " + $lq + "Organizational affiliation" + $rq + " for this purpose means current or recent (past 24 months) employer or material funding source. Reviewers must publicly disclose any prior collaboration with the proposal" + $apos + "s authors " + $emdash + " co-authorship on prior BIPs or papers, joint employment, or shared funding. Disclosure does not disqualify; it makes the relationship legible. The standard is diverse independent perspectives, not pristine isolation, which is unachievable in a small developer community and weaponizable when claimed. Reviewers should have demonstrated competence in Bitcoin protocol development, as evidenced by prior contributions to Bitcoin Core, Bitcoin Knots, or another consensus-compatible implementation."
Replace-XmlText $oldABody $newABody "Edit 6b: §3.3.A body text"

# ============================================================
# EDIT 7 - Replace §3.3.E (bold prefix change + body text replacement)
# ============================================================
Replace-XmlText `
    "E. No AI-generated code without disclosure and review." `
    "E. Reviewer comprehension." `
    "Edit 7a: §3.3.E bold prefix label"

$oldEEBody = " The use of AI coding assistants in developing activation clients is not inherently problematic, but it must be disclosed and the resulting code must receive heightened scrutiny. AI-generated code in consensus-critical software is analogous to AI-generated legal filings " + $emdash + " the tool can accelerate production, but the professional remains responsible for the output" + $apos + "s correctness."
$newEEBody = " Every change to consensus-critical code must be reviewed by at least one named human reviewer who publicly attests that they understand the change and can defend its correctness against technical challenge. This requirement applies regardless of the code" + $apos + "s origin " + $emdash + " whether authored by humans, generated by AI tools, or adapted from prior proposals. AI-generated code in consensus-critical software is analogous to AI-generated legal filings: the tool can accelerate production, but the professional remains responsible for the output" + $apos + "s correctness. The framework does not attempt to police the origin of code, which is undetectable on inspection; it requires the comprehension of code by named accountable reviewers, which is testable in any review forum. Authors and reviewers are welcomed to disclose AI involvement voluntarily as a matter of transparency, but the load-bearing requirement is reviewer comprehension, not origin disclosure."
Replace-XmlText $oldEEBody $newEEBody "Edit 7b: §3.3.E body text"

# ============================================================
# EDIT 8 - Append BCAP cross-ref to "The 55% Problem"
# ============================================================
$append34 = " This conclusion is consistent with the qualitative analysis in BCAP " + $ssign + "3.5.2, which identifies a low percentage of Economic Node enforcement as producing the highest risk of chain split and which describes the mechanism " + $emdash + " sub-overwhelming enforcement permitting unupgraded blocks to extend the chain " + $emdash + " by which that risk is realized."
Replace-XmlText `
    "The stakes have changed. The standards must change with them." `
    ("The stakes have changed. The standards must change with them." + $append34) `
    "Edit 8: §3.4 BCAP cross-ref"

# ============================================================
# EDIT 9 - Update §3.4 BIP-148 framing
# ============================================================
Replace-XmlText `
    "BIP-148 transferred activation authority from miners to economic nodes. Its credible threat is widely credited with motivating the miner capitulation that produced BIP-91." `
    ("BIP-148 transferred activation authority from miners to economic nodes. BIP-148 worked because overwhelming community support produced miner capitulation; the mechanism" + $apos + "s credible threat is widely credited with motivating the capitulation that produced BIP-91. UASF without that prior support yields the BIP-110 outcome.") `
    "Edit 9: §3.4 BIP-148 framing"

# ============================================================
# EDIT 10 - Update §3.4 LOT discussion
# ============================================================
Replace-XmlText `
    "LOT=true converts a deployment into an effective UASF if miners do not cooperate; LOT=false makes it a clean Speedy Trial-style timeout. The LOT debate of early 2021" `
    "LOT=true converts a deployment into an effective UASF if miners do not cooperate; LOT=false makes it a clean Speedy Trial-style timeout. LOT=true is unreliable in a first attempt and disfavored even on repeat attempts. The LOT debate of early 2021" `
    "Edit 10: §3.4 LOT skepticism"

# ============================================================
# EDIT 11 - Insert BCAP cross-ref paragraph at start of §3.5 (before "A. Hashrate distribution analysis")
# ============================================================
$content35 = Build-BodyPara ("The chain-split mechanisms this assessment must address are developed in detail in BCAP " + $ssign + "3.5.2, including the bounty-claim scenario in which assets locked into scripts using newly proposed rules generate incentives for miners to mine an unupgraded block that voids the new-rule protection. Proposals that introduce new opcodes or new spending paths through OP_SUCCESS substitution warrant particular attention to that risk. The risk-assessment requirements that follow are the documentary correlates of that mechanism " + $emdash + " questions a proponent must answer in writing before the community can rationally evaluate exposure.")
Insert-Before-Anchor "Every consensus change proposal should include a formal chain split risk assessment" $content35 "Edit 11: §3.5 BCAP opening paragraph (now before the colon-list intro)"

# ============================================================
# EDIT 12 - Replace §3.5.C body (bold prefix preserved)
# ============================================================
$oldCBody = " If a chain split occurs, does the proposal include replay protection to prevent transactions from being valid on both chains? If not, what is the expected impact on users who are unaware of the split?"
$newCBody = " If the proposal would require explicit replay protection to prevent transactions from being valid on both chains in the event of a split, the proposal has crossed into hard-fork territory under Category 4 (see " + $ssign + "3.7 on hard-fork subtypes) " + $emdash + " reassess the classification before continuing the chain-split risk assessment. If the proposal is a soft fork that cannot produce a chain split absent miner defection, document the rationale for the absence of replay protection and address the expected impact on users in the residual miner-defection scenario."
Replace-XmlText $oldCBody $newCBody "Edit 12: §3.5.C replay protection reframe"

# ============================================================
# EDIT 13 - Append Category 4 diagnostic framing
# ============================================================
$appendCat4 = " The necessity of replay protection is itself the diagnostic of hard-fork status. A proposal whose safe deployment requires the ecosystem to modify its transaction format to prevent cross-chain replay has, by that requirement, made the case for its hard-fork classification " + $emdash + " and should be evaluated against the standards of this category rather than treated as a soft fork with a safety net bolted on. The standards that follow in " + $ssign + "3.7 distinguish between scheduled and emergency hard forks, which have opposite governance properties despite sharing this category."
Replace-XmlText `
    ("the absence of a written standard has historically left proponents free to define their own.") `
    ("the absence of a written standard has historically left proponents free to define their own." + $appendCat4) `
    "Edit 13: Category 4 diagnostic framing"

# ============================================================
# EDIT 14 - Insert §3.7 Hard Fork Subtypes before SECTION 4
# ============================================================
$content37 =
    (Build-Heading2 "3.7 Hard Fork Subtypes: Scheduled vs. Emergency") +
    (Build-BodyPara ("Category 4 (Hard Forks) is treated by the framework" + $apos + "s general standards as a single category requiring the highest scrutiny. In practice, hard forks fall into two extremes with opposite governance properties, and a single set of standards cannot accommodate both. The framework therefore distinguishes them: subtype 4a, the scheduled hard fork, and subtype 4b, the emergency hard fork. Each carries its own standards. The Category 4 text gestures at the emergency case by example (" + $lq + "a critical security vulnerability discovered in the deployed protocol" + $rq + ") but, applied uniformly, would impose a thirty-six-month review period on a vulnerability that cannot wait three years. The subtype distinction resolves that tension.")) +
    (Build-BodyParaBoldPrefix "4a " ($emdash + " Scheduled Hard Fork. A scheduled hard fork has a deployment horizon measured in years from initial proposal to activation. The defining property is that time is the principal asset: organic node-upgrade cycles can do most of the coordination work if the deployment window is long enough. Empirical analysis of historical node-upgrade rates (see " + $ssign + "1.4) suggests that windows of approximately five years or longer produce near-universal upgrade in the absence of active opposition. A scheduled hard fork that takes advantage of this property can be deployed with substantially less coordination burden than an accelerated hard fork attempt, because the upgrade arrives organically through routine maintenance cycles.")) +
    (Build-BodyPara "The standards for subtype 4a follow Category 4 generally, with refinements:") +
    (Build-BodyParaBoldPrefix "A. Minimum review period:" (" five years from publication of a complete technical specification and reference implementation. This is longer than Category 3" + $apos + "s twenty-four-month floor; the additional review window reflects the deployment horizon" + $apos + "s premium on getting the change right the first time.")) +
    (Build-BodyParaBoldPrefix "B. Broad consensus required prior to code freeze," " not merely prior to activation. The deployment window operates only as designed if the code shipped at the start of the window is the code that will be enforced at the end.") +
    (Build-BodyParaBoldPrefix "C. Explicit deployment timeline" " published in advance with each milestone identified: specification freeze, code freeze, infrastructure-test deployment, and mainnet activation block height.") +
    (Build-BodyParaBoldPrefix "D. Replay protection" (" may be unnecessary if the upgrade window genuinely absorbs the change " + $emdash + " that is, if the organic upgrade rate at the activation height is sufficient that no meaningful minority continues to enforce the prior rules. Replay protection becomes necessary only if the active-coordination component re-enters as a fallback.")) +
    (Build-BodyParaBoldPrefix "4b " ($emdash + " Emergency Hard Fork. An emergency hard fork is triggered by a critical vulnerability or imminent failure mode in the deployed protocol that cannot wait for a multi-year deployment window. Examples include the 2013 chain split that produced BIP-50, an inflation bug analogous to CVE-2018-17144 for which the soft-fork mitigation path is unavailable, or a cryptographic primitive becoming compromised in a way that affects existing UTXOs. The defining property is that time is the principal enemy: the alternative to a fast hard fork is running broken software.")) +
    (Build-BodyPara ("The standards for subtype 4b are not lenient versions of Category 4" + $apos + "s standards. They are different standards, calibrated to a different problem. Imposing the scheduled-HF standards on an emergency case would be actively dangerous; imposing the emergency standards on a scheduled case would be reckless. The 4b standards are:")) +
    (Build-BodyParaBoldPrefix "A. Documented evidence of the trigger." (" The proposal must identify the specific failure mode, the timeline within which the failure becomes operational, and the technical basis for the timeline. " + $lq + "Critical vulnerability" + $rq + " without published technical detail is not sufficient.")) +
    (Build-BodyParaBoldPrefix "B. Compressed expert-led review." (" The review timeline is calibrated to the threat. The standards of " + $ssign + "3.3 (Code Audit Requirements) apply " + $emdash + " at least three reviewers from distinct organizational affiliations, named human comprehension attestation, testnet deployment " + $emdash + " and the required duration is the minimum that allows these standards to be satisfied, typically weeks to months depending on the threat" + $apos + "s timeline.")) +
    (Build-BodyParaBoldPrefix "C. Near-unanimous infrastructure coordination" " at the activation moment. Major exchanges, custodians, payment processors, and mining pools must commit to the activation timeline together. Soft commitments are insufficient; the coordination must be sufficient that a chain split does not produce a viable competing chain.") +
    (Build-BodyParaBoldPrefix "D. Replay protection" (" where a meaningful minority will continue running the prior rules. In emergency-HF cases, the choice not to upgrade is itself often a principled position " + $emdash + " an operator who disagrees that the trigger justifies the fork " + $emdash + " and the prior-rules chain may persist with non-trivial economic activity. Replay protection in this scenario is not a category error; it is necessary user protection.")) +
    (Build-BodyParaBoldPrefix "E. Transparent post-hoc disclosure" (" of the decision process. The compressed timeline necessarily limits the breadth of pre-deployment consultation. The legitimacy of an emergency hard fork is established afterward by publishing what was decided, by whom, on what evidence, and with what dissents " + $emdash + " making the process accountable in retrospect even where it could not be open in real time.")) +
    (Build-BodyPara ("The framework does not anticipate emergency hard forks being common. Bitcoin" + $apos + "s deployed protocol is exceptionally well-reviewed, and the post-2009 record contains no inflation-bug-level emergencies that required this path. BIP-50 itself was resolved by a coordinated downgrade, not a hard fork. The recognition of subtype 4b is the framework" + $apos + "s acknowledgment that some governance needs are inverted under emergency conditions " + $emdash + " not that emergency conditions suspend governance. The standards above exist to make the emergency case legible and challengeable, in the same way that the scheduled-HF standards make the planned case legible and challengeable."))
Insert-Before-Anchor "SECTION 4: LEGAL ANALYSIS" $content37 "Edit 14: §3.7 HF Subtypes"

# ============================================================
# EDIT 15 - Insert §4.0 Purpose of the Legal Analysis before §4.1
# ============================================================
$content40 =
    (Build-Heading2 "4.0 Purpose of the Legal Analysis") +
    (Build-BodyPara ("This section analyzes the legal-risk landscape that already exists, whether developers acknowledge it or not. It is not an invitation to litigation. It is a map of the terrain " + $emdash + " drawn so that participants, including developers, can navigate it with informed caution rather than unknowing exposure.")) +
    (Build-BodyPara ("A developer who follows the standards proposed in Section 3 has a strong defense against every theory analyzed below. The legal analysis is best read in that light: as a description of what good-faith developers can demonstrate they have met, not as a catalog of theories under which they might be pursued. Section 3 is the safety standard; Section 4 is the case for why following the standard is itself the most effective protection against the liability theories that already exist in tort and contract law.")) +
    (Build-BodyPara ("This section serves the network as a whole by making the legal landscape legible to every stakeholder " + $emdash + " operators, exchanges, custodians, and developers " + $emdash + " who must navigate it without specialized training. Litigation against developers acting in good faith would harm the protocol and the community; the framework" + $apos + "s purpose is to make such litigation less likely by establishing a documented standard of care that good-faith developers can demonstrably satisfy."))
Insert-Before-Anchor "4.1 Negligence" $content40 "Edit 15: §4.0 Purpose of Legal Analysis"

# ============================================================
# EDIT 16 - Replace §5.1 criterion 6
# ============================================================
Replace-XmlText `
    "Has the reference implementation been reviewed by at least three independent developers with demonstrated Bitcoin protocol expertise?" `
    ("Has the reference implementation been reviewed by at least three developers with demonstrated Bitcoin protocol expertise, drawn from distinct organizational affiliations, with any prior collaboration with the proposal" + $apos + "s authors publicly disclosed?") `
    "Edit 16: §5.1 criterion 6"

# ============================================================
# EDIT 17 - Replace §5.1 criterion 10
# ============================================================
Replace-XmlText `
    "If AI coding tools were used, has this been disclosed and has the code received heightened review?" `
    "Has every change to consensus-critical code been attested as understood by at least one named human reviewer who can defend its correctness?" `
    "Edit 17: §5.1 criterion 10"

# ============================================================
# EDIT 18 - Insert §5.3 On the Measurability before SECTION 6
# ============================================================
$content53 =
    (Build-Heading2 "5.3 On the Measurability of the Criteria") +
    (Build-BodyPara ("Several criteria in " + $ssign + "5.1 " + $emdash + " particularly those concerning broad community support, sustained opposition, and adequate review " + $emdash + " are not amenable to mechanical measurement. There is no canonical metric for " + $lq + "broad support among economic nodes" + $rq + " or " + $lq + "sustained public objection" + $rq + " or " + $lq + "discussion in a diverse cross-section of the community." + $rq + " Reasonable evaluators can score the same proposal differently.")) +
    (Build-BodyPara ("This is intentional. The framework" + $apos + "s authority is its defensibility, not its precision. A score arrived at by counting blocks or polling exchanges would be precise but easily gamed; a score arrived at by transparent evaluation against published criteria, where reviewers must justify their scoring choices, is defensible against challenge in a way that algorithmic scoring cannot be. The fuzzy criteria force the conversation onto the right ground: what counts as evidence of broad support? What counts as sustained opposition? Who has objected, and have those objections been addressed? Those questions are themselves what the framework is asking the community to think about systematically.")) +
    (Build-BodyPara ("For the fuzziest criteria, the following heuristics are illustrative anchors " + $emdash + " not algorithmic rules. A proposal that satisfies the spirit of the criterion may not satisfy the literal heuristic and vice versa; the heuristic is a starting point for evaluators, not a substitute for evaluation.")) +
    (Build-BodyPara ($lq + "Broad support among economic nodes" + $rq + " (criterion 18) is reasonably evidenced by explicit public statements supporting the proposal from at least three of the top five exchanges by Bitcoin trading volume, plus comparable statements from at least two custodians serving institutional clients. Statements specifically endorsing the consensus change " + $emdash + " not merely acknowledging it " + $emdash + " count; silence does not count as support.")) +
    (Build-BodyPara ($lq + "Sustained opposition" + $rq + " (a factor in " + $ssign + "3.4 threshold selection) is reasonably evidenced by at least two prior public objections from independent stakeholders that have not been substantively addressed in subsequent proposal updates. " + $lq + "Independent" + $rq + " for this purpose follows the diverse-affiliation standard of " + $ssign + "3.3.A: objectors should not all share the same employer or material funding source.")) +
    (Build-BodyPara ($lq + "Adequate community discussion" + $rq + " (criterion 17) is reasonably evidenced by archived discussion in at least two distinct venues over the full minimum review period for the proposal" + $apos + "s risk category " + $emdash + " typically the bitcoin-dev mailing list plus at least one of: a public forum thread, a recorded video discussion, or a working group with published minutes.")) +
    (Build-BodyPara ("These heuristics are illustrative because the framework" + $apos + "s binary scoring is meant to be defensible against challenge, not bright-line. A reviewer who scores a criterion " + $lq + "met" + $rq + " using a different evidentiary basis than the heuristic above can defend that scoring by publishing the basis. A reviewer who scores a criterion " + $lq + "not met" + $rq + " can do the same. What the framework asks is not algorithmic agreement; it is that scoring choices be legible and challengeable. That is what makes the resulting evaluation defensible in any forum " + $emdash + " technical, commercial, or legal " + $emdash + " where the proposal" + $apos + "s readiness must be assessed."))
Insert-Before-Anchor "SECTION 6: OBJECTIONS AND RESPONSES" $content53 "Edit 18: §5.3 Measurability"

# ============================================================
# EDIT 19 - Append BCAP cross-ref to §6.1
# ============================================================
$append61 = " The descriptive thesis of BCAP " + $emdash + " that Bitcoin consensus emerges from the iterated, multi-party interactions of stakeholders with shifting powers and incentives " + $emdash + " is correct and is not contested by this framework. The framework" + $apos + "s claim is narrower and consistent with it: that minimum standards, publicly available and applied consistently, make the iterated process safer and more efficient by giving every stakeholder a shared vocabulary for declining engagement with proposals that are not ready."
$old61 = "It proposes minimum standards for evaluating proposals within Bitcoin" + $apos + "s existing decentralized governance structure."
$new61 = $old61 + $append61
Replace-XmlText $old61 $new61 "Edit 19: Section 6.1 BCAP cross-ref"

# ============================================================
# EDIT 20 - Insert §6.6 dialectic before SECTION 7
# ============================================================
$content66 =
    (Build-Heading2 ("6.6 " + $lq + "If the standards are not enforceable, what does the framework add?" + $rq)) +
    (Build-BodyPara ("This objection has two forms. The strong form: a benign proposal would already meet the framework" + $apos + "s criteria, and an ill-considered proposal will be resisted by the same stakeholders for the same reasons whether the framework exists or not " + $emdash + " so the framework adds nothing operational. The weak form: the framework may legitimize rule-lawyering " + $emdash + " proposals that satisfy the criteria in form but not in spirit.")) +
    (Build-BodyPara ("The strong form misreads where the framework" + $apos + "s value sits. The value is not in creating coordinated resistance to ill-considered proposals " + $emdash + " that coordination exists, however imperfectly, in the form of Bitcoin" + $apos + "s distributed governance. BIP-110" + $apos + "s failure to attract more than 0.15% of signaling demonstrates the existing coordination" + $apos + "s capacity. The framework" + $apos + "s value is in lowering the coordination cost of principled refusal. Without the framework, every individual stakeholder objection requires custom argumentation: an exchange operator who refuses to recognize a chain must justify the refusal from first principles, against the rhetorical pressure of proponents who can frame the refusal as arbitrary. With the framework, " + $lq + "this proposal fails criteria 1, 8, 11, and 14" + $rq + " is a complete justification: cheap to invoke, costly to rebut. Distributed enforcement works " + $emdash + " BIP-110" + $apos + "s failure is the existence proof " + $emdash + " but it works at a cost. The framework lowers that cost without claiming authority it does not have.")) +
    (Build-BodyPara ("This matters most at the margins, where stakeholders are uncertain whether their objection rises to the level of public dissent. A single skeptical infrastructure operator, holding the framework" + $apos + "s criteria, can invoke it without first organizing a coalition. The framework converts what would otherwise be a coordination problem " + $emdash + " every stakeholder waiting to see whether others will refuse " + $emdash + " into a documentation problem: anyone can point to the criteria and say here is the standard; here is the gap. The credibility of the resulting refusal does not depend on the refuser" + $apos + "s individual standing but on the criteria" + $apos + "s defensibility.")) +
    (Build-BodyPara ("The weak form " + $emdash + " that the framework legitimizes rule-lawyering " + $emdash + " assumes that a proposal which games the letter of the criteria thereby earns approval. It does not. Binary criteria and classification bands leave judgment intact; partial gaming is itself progress (a rule-lawyered proposal is at least better documented than an ad-hoc one); the framework can be revised adversarially as bad-faith actors expose loopholes; and " + $ssign + "5.2" + $apos + "s Red classification remains available for proposals that satisfy the letter but fail the spirit " + $emdash + " which is itself observable evidence in the scoring record.")) +
    (Build-BodyPara ("A more honest statement of the weak form is: any standard can be gamed. That is true of every standard humans have ever written. It is not a reason to write none; it is a reason to write standards that produce useful documentation of the gaming when it happens. This framework does that. BIP-110, evaluated against the framework, would score 3/20 " + $emdash + " a documented Red. That documentation, available to any stakeholder, makes a future rule-lawyered variant easier to evaluate against than the original, not harder. The framework" + $apos + "s effect is therefore cumulative: each evaluation makes the next one more efficient, because the prior scoring is in the record."))
Insert-Before-Anchor "SECTION 7: CONCLUSION" $content66 "Edit 20: §6.6 Dialectic"

# ============================================================
# EDIT 21 - Insert italic caption under §2.5 table (before "The pattern is clear")
# ============================================================
$captionText = "Note: percentages in the Outcome column for stalled or failed proposals reflect the peak observed share of blocks signaling readiness for the proposal during its activation window. BIP-110" + $apos + "s 55% lock-in threshold was never approached."
$captionXml = '<w:p><w:pPr><w:jc w:val="both"/></w:pPr><w:r><w:rPr><w:i/><w:iCs/><w:color w:val="333333"/></w:rPr><w:t xml:space="preserve">' + $captionText + '</w:t></w:r></w:p>'
Insert-Before-Anchor "The pattern is clear" $captionXml "Edit 21: Section 2.5 italic caption"

# ============================================================
# EDIT 22 - Insert References "Industry and Academic Analysis" before "Software Releases"
# ============================================================
$contentRefs =
    (Build-Heading2 "Industry and Academic Analysis") +
    (Build-BodyPara "Crypto Fish, Ren, Steve Lee, and Lyn Alden. Analyzing Bitcoin Consensus: Risks in Protocol Upgrades. November 2024. github.com/bitcoin-cap/bcap; also available at bitcoinnews.ch/wp-content/uploads/2024/11/bcap_v1.0.pdf.") +
    (Build-BodyPara "Lopp, Jameson. When Do Bitcoin Node Operators Upgrade? blog.lopp.net/when-do-bitcoin-node-operators-upgrade/.")
Insert-Before-Anchor "Software Releases" $contentRefs "Edit 22: References Industry and Academic"

# ============================================================
# EDIT 23 - Italicize case names + book titles (Bluebook legal-style)
# ============================================================
# Case names (italicized per Bluebook Rule 2.1(a) — applies to case names in text)
Italicize-Phrase "Aas v. Superior Court" "Aas v. Superior Court (case)"
Italicize-Phrase "Robinson Helicopter Co. v. Dana Corp." "Robinson Helicopter v. Dana (case)"
Italicize-Phrase "Biakanja v. Irving" "Biakanja v. Irving (case)"
Italicize-Phrase "Della Penna v. Toyota Motor Sales, U.S.A., Inc." "Della Penna v. Toyota (case)"
Italicize-Phrase "Korea Supply Co. v. Lockheed Martin Corp." "Korea Supply v. Lockheed Martin (case)"
Italicize-Phrase "Pacific Gas & Electric Co. v. Bear Stearns & Co." "Pacific Gas v. Bear Stearns (case)"
Italicize-Phrase "Tulip Trading Ltd v van der Laan" "Tulip Trading v van der Laan (case)"
# Paper / book / internet-source titles (Bluebook Rule 15 for books, Rule 16 for periodicals, Rule 18 for internet sources)
Italicize-Phrase "Analyzing Bitcoin Consensus: Risks in Protocol Upgrades" "BCAP paper title"
Italicize-Phrase "Regulating Blockchain: Techno-Social and Legal Challenges" "Regulating Blockchain (book title)"
Italicize-Phrase "When Do Bitcoin Node Operators Upgrade?" "Lopp blog post title"
# Italicize "BCAP" abbreviation throughout (Bluebook: shortened form retains italics of full title)
Italicize-Phrase "BCAP" "BCAP abbreviation"

# Citation signal "See" before italic case names (Bluebook Rule 1.2)
Italicize-See-Before-Italic-Run
# Citation signal "See" before non-italic name (Lopp blog author in §1.4 — title is italic but name "Jameson Lopp" is plain)
Italicize-See-Before-Name "Jameson Lopp"

# ============================================================
# Professional legal-document formatting:
# - Single line spacing (240)
# - First-line indent 0.3" (432 twips) on body paragraphs
# - Tight paragraph after-spacing (0)
# Headings keep their existing before/after spacing (no w:line attribute on heading pPr).
# ============================================================
# 1) Normalize all explicit line spacing to single (240)
$lineCount = ([regex]::Matches($script:xml, 'w:line="\d+"')).Count
$script:xml = [regex]::Replace($script:xml, 'w:line="\d+"', 'w:line="360"')
# 2) Zero out paragraph-after spacing on body paragraphs (w:after values >= 120 indicate body-text gap that conflicts with indented style)
$afterCount = ([regex]::Matches($script:xml, 'w:after="(?:1[2-9][0-9]|[2-9][0-9]{2,}|[1-9][0-9]{3,})"')).Count
$script:xml = [regex]::Replace($script:xml, 'w:after="(?:1[2-9][0-9]|[2-9][0-9]{2,}|[1-9][0-9]{3,})"', 'w:after="0"')
# 3) Add first-line indent to body paragraphs that end pPr with justification (don't touch hanging-indent reference paragraphs)
$indentBefore = ([regex]::Matches($script:xml, '<w:jc w:val="both"/></w:pPr>')).Count
$script:xml = [regex]::Replace($script:xml, '<w:jc w:val="both"/></w:pPr>', '<w:ind w:firstLine="432"/><w:jc w:val="both"/></w:pPr>')
$script:log += ("OK   line-spacing normalized to single (240) in " + $lineCount + " spacing elements")
$script:log += ("OK   paragraph after-spacing tightened to 0 in " + $afterCount + " paragraphs")
$script:log += ("OK   first-line indent (432 twips = 0.3in) added to " + $indentBefore + " justified body paragraphs")

# 4) Add <w:keepNext/> to ALL Heading2 paragraphs (v1 ones lacked it, causing orphan headings at page bottom)
$h2BeforeCount = ([regex]::Matches($script:xml, '<w:pPr><w:pStyle w:val="Heading2"/></w:pPr>')).Count
$script:xml = $script:xml.Replace('<w:pPr><w:pStyle w:val="Heading2"/></w:pPr>', '<w:pPr><w:pStyle w:val="Heading2"/><w:keepNext/></w:pPr>')
$script:log += ("OK   keepNext added to " + $h2BeforeCount + " existing Heading2 paragraphs (prevents orphan headings at page bottom)")

# 5) Title-page disclaimer paragraphs picked up body formatting (indent + 1.5 line spacing) from #1-#3
# because they have <w:jc w:val="both"/>. Restore them to fine-print: no indent, 9pt font, single line, light gray.
$disclaimerProbes = @(
    'This document does not constitute legal advice',
    'Bitcoin is an experimental technology. This document does not recommend'
)
$disclaimerFixCount = 0
foreach ($probe in $disclaimerProbes) {
    $oldPattern = '<w:pPr><w:spacing w:after="0" w:line="360" w:lineRule="auto"/><w:ind w:firstLine="432"/><w:jc w:val="both"/></w:pPr><w:r><w:rPr><w:color w:val="333333"/></w:rPr><w:t>' + $probe
    $newPattern = '<w:pPr><w:spacing w:after="120" w:line="240" w:lineRule="auto"/><w:jc w:val="both"/></w:pPr><w:r><w:rPr><w:color w:val="555555"/><w:sz w:val="18"/><w:szCs w:val="18"/></w:rPr><w:t>' + $probe
    if ($script:xml.Contains($oldPattern)) {
        $script:xml = $script:xml.Replace($oldPattern, $newPattern)
        $disclaimerFixCount++
    }
}
$script:log += ("OK   restored " + $disclaimerFixCount + " title-page disclaimer paragraphs to fine-print (9pt, no indent, single-line, gray)")

# ============================================================
# Write modified XML back to ZIP entry
# ============================================================
Write-Output "Writing modified document.xml back to ZIP"
$entry.Delete()
$newEntry = $zip.CreateEntry('word/document.xml', 0)
$writeStream = $newEntry.Open()
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
$writer = New-Object System.IO.StreamWriter($writeStream, $utf8NoBom)
$writer.Write($script:xml)
$writer.Close()
$writeStream.Close()
$zip.Dispose()

Write-Output ""
Write-Output "===== EDIT LOG ====="
$script:log | ForEach-Object { Write-Output $_ }
Write-Output ""
Write-Output ("===== OUTPUT =====")
Write-Output ("v2.docx: " + $dstDocx)
Write-Output ("v2.docx size: " + (Get-Item $dstDocx).Length + " bytes")
