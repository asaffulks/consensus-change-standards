# make_scorecard_pdf.py -> ../scorecard.pdf
# Standalone fillable (AcroForm) scorecard for the Consensus Change Readiness
# Checklist, 5th ed. (2026), section 5.1. Real checkbox/text widgets.
import fitz

PAGE_W, PAGE_H = 612, 792  # US Letter
ML, MR, MT = 50, 50, 46
SERIF, SERIF_B, SERIF_I = "tiro", "tibo", "tiit"

CRITERIA = [
    ("A. Proposal Quality", [
        (1, "Clear, empirically supported problem statement.", False),
        (2, "Complete technical specification; independently implementable.", False),
        (3, "Backward-compatibility analysis covering all affected tx types, scripts, use cases.", False),
        (4, "Fully specified activation mechanism (threshold, timeline, failure mode).", False),
        (5, 'Rollback procedure; self-executing sunset if labeled "temporary."', False),
    ]),
    ("B. Code Quality", [
        (6, ">= 3 expert reviewers from distinct organizations; prior collaboration disclosed.", False),
        (7, "Comprehensive unit, integration, and regression tests.", False),
        (8, "Signet/testnet deployment >= 3 months; deactivation tested if sunset included.", False),
        (9, "Fuzzing and adversarial testing performed.", False),
        (10, "Named human reviewer attests comprehension of consensus-critical code.", False),
    ]),
    ("C. Activation Safety", [
        (11, "Miner-signaling threshold (where used) >= 90%.", True),
        (12, "UASF (if used) has completed full review and broad economic-node support.", True),
        (13, "Chain-split risk assessment completed and published.", False),
        (14, "Replay protection, or documented rationale where soft fork cannot split absent defection.", False),
        (15, "Signaling only after the review floor elapses; enforcement >= 6 mo after final client.", False),
    ]),
    ("D. Community Process", [
        (16, "Minimum review period for risk category (12 / 24 months; Sec. 3.7 hard-fork floors).", False),
        (17, "Public discussion across diverse stakeholders.", False),
        (18, "Major exchanges and infrastructure providers consulted.", False),
        (19, "Chain-split contingency plan published by proposal author.", True),
        (20, "Structured evaluation against a published readiness standard, published or answered by proponents.", True),
    ]),
]

doc = fitz.open()
page = doc.new_page(width=PAGE_W, height=PAGE_H)
y = MT

page.insert_text((ML, y), "Consensus Change Readiness Checklist", fontname=SERIF_B, fontsize=15)
y += 16
page.insert_text((ML, y),
                 "Fulks, Consensus Change Standards (5th ed. 2026), Sec. 5.1  |  CC BY 4.0",
                 fontname=SERIF_I, fontsize=8.5, color=(0.25, 0.25, 0.25))
y += 18

def text_field(name, label, x, w, yy):
    page.insert_text((x, yy + 9), label, fontname=SERIF, fontsize=9)
    lw = fitz.get_text_length(label, fontname=SERIF, fontsize=9)
    wd = fitz.Widget()
    wd.field_name = name
    wd.field_type = fitz.PDF_WIDGET_TYPE_TEXT
    wd.rect = fitz.Rect(x + lw + 4, yy - 2, x + w, yy + 12)
    wd.border_width = 0.5
    wd.border_color = (0.55, 0.55, 0.55)
    wd.text_fontsize = 9
    page.add_widget(wd)

text_field("proposal", "Proposal:", ML, 250, y)
text_field("evaluator", "Evaluator:", ML + 262, 200, y)
text_field("date", "Date:", ML + 474, 512 - ML, y)
y += 22

note = ("Mark each criterion Met or Not met. N/A is permitted ONLY for criteria 11-12 (structural: no such "
        "mechanism in the deployment) and 19-20 (temporal: proposal predates any published readiness standard); "
        "N/A criteria drop from both numerator and denominator (Sec. 5.2). Emergency hard forks (Sec. 3.7, "
        "subtype 4b) are evaluated under the 4b standards, not scored here.")
rect = fitz.Rect(ML, y, PAGE_W - MR, y + 40)
page.insert_textbox(rect, note, fontname=SERIF_I, fontsize=8, color=(0.2, 0.2, 0.2))
y += 46

# column headers
cx_met, cx_not, cx_na = 478, 512, 546
page.insert_text((cx_met - 4, y), "Met", fontname=SERIF_B, fontsize=8.5)
page.insert_text((cx_not - 4, y), "Not", fontname=SERIF_B, fontsize=8.5)
page.insert_text((cx_na - 4, y), "N/A", fontname=SERIF_B, fontsize=8.5)
y += 6

def checkbox(name, x, yy):
    wd = fitz.Widget()
    wd.field_name = name
    wd.field_type = fitz.PDF_WIDGET_TYPE_CHECKBOX
    wd.rect = fitz.Rect(x, yy, x + 11, yy + 11)
    wd.border_width = 0.75
    wd.border_color = (0.3, 0.3, 0.3)
    page.add_widget(wd)

ROW = 21.5
for header, rows in CRITERIA:
    y += 6
    page.insert_text((ML, y + 9), header, fontname=SERIF_I, fontsize=9.5)
    y += 14
    for num, text, na_ok in rows:
        page.insert_text((ML + 2, y + 9), str(num), fontname=SERIF, fontsize=9)
        page.insert_text((ML + 20, y + 9), text, fontname=SERIF, fontsize=9)
        checkbox(f"c{num}_met", cx_met, y)
        checkbox(f"c{num}_not", cx_not, y)
        if na_ok:
            checkbox(f"c{num}_na", cx_na, y)
        else:
            page.insert_text((cx_na + 2, y + 9), "-", fontname=SERIF, fontsize=9,
                             color=(0.6, 0.6, 0.6))
        y += ROW

y += 8
page.draw_line(fitz.Point(ML, y), fitz.Point(PAGE_W - MR, y), color=(0.4, 0.4, 0.4), width=0.6)
y += 14
page.insert_text((ML, y + 9), "Total:", fontname=SERIF_B, fontsize=10)
text_field("total_met", "criteria met:", ML + 40, 160, y)
text_field("total_applicable", "of applicable:", ML + 220, 160, y)
y += 24
page.insert_text((ML, y + 9),
                 "Classification (Sec. 5.2):  100% = Green;  75-99% = Yellow;  50-74% = Orange;  < 50% = Red.",
                 fontname=SERIF, fontsize=9)
y += 16
page.insert_text((ML, y + 9),
                 "Publish the scoring with its evidentiary basis (Sec. 5.3); cite the edition evaluated against (App. B.4).",
                 fontname=SERIF_I, fontsize=8.5, color=(0.25, 0.25, 0.25))

doc.set_metadata({"title": "Consensus Change Readiness Checklist (5th ed.)",
                  "author": "Asaf Fulks"})
doc.save("../scorecard.pdf")
print("scorecard.pdf written, fields:", len(list(page.widgets())))
