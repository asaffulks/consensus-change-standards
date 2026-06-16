# fig_5_1_scorecard.py  ->  fig-5-1-scorecard.pdf / .png
# Figure 5.1: the worked-example verdict at a glance.
# Three proposals plotted on a "% of applicable criteria met" axis whose four
# zones reuse Sec 5.2's band cut-points (Red <50, Orange 50-74, Yellow 75-99,
# Green 100) -- the same banded visual language as Fig 3.1. A category grid
# below shows the A/B/C/D breakdown for the two table-scored proposals.
# Data is taken verbatim from Sec 5.1 (5 criteria per category) and Sec 5.4:
#   Taproot   17/17 applicable = 100%  Green   (PQ 5/5, CQ 5/5, AS 4/4, CP 3/3;
#                                                crit 12 structural, 19+20 temporal -> n/a)
#   BIP-110    3/20             =  15%  Red     (PQ 3/5 [crit 2,4,5], CQ/AS/CP 0/5)
#   SegWit2x  ~5/17 applicable  ~= 29%  Red     (hard fork; scored in prose, hedged)
# Outcome rides on the band WORD + the m/n cell text + color, so the figure
# survives grayscale printing and red-green colorblindness (no glyph dependence).
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle

plt.rcParams.update({
    "font.family": "serif",
    "font.serif": ["Palatino Linotype", "Book Antiqua", "TeX Gyre Pagella", "DejaVu Serif"],
    "font.size": 9,
})

# Sec 5.2 band palette (matches fig_3_1 zone fills)
RED, ORANGE, YELLOW, GREEN = "#d9534f", "#e8a33d", "#e6d96a", "#7bb37b"
INK, EDGE = "#222222", "#555555"
BAND_ALPHA = 0.16

fig = plt.figure(figsize=(6.4, 4.4))
gs = fig.add_gridspec(2, 1, height_ratios=[1.05, 1.0], hspace=0.6)
ax = fig.add_subplot(gs[0])
axg = fig.add_subplot(gs[1])

# ---- TOP: banded "% of applicable criteria met" bars -------------------------
for x0, x1, c in [(0, 50, RED), (50, 75, ORANGE), (75, 100, YELLOW)]:
    ax.axvspan(x0, x1, color=c, alpha=BAND_ALPHA, lw=0)
ax.axvspan(99.4, 100, color=GREEN, alpha=0.45, lw=0)          # Green is the 100% line
for xc, lab in [(25, "RED"), (62.5, "ORANGE"), (87, "YELLOW"), (100, "GREEN")]:
    ax.text(xc, 3.66, lab, ha="center", va="bottom", fontsize=7.2, color="#666666")

# name, percent, fraction label, band color
rows = [
    ("Taproot",  100.0, "17 / 17 applicable", GREEN),
    ("SegWit2x",  29.4, "~5 / 17 applicable", RED),
    ("BIP-110",   15.0, "3 / 20",             RED),
]
ypos = [3, 2, 1]
ax.set_xlim(0, 100); ax.set_ylim(0.4, 3.95)
for (name, pct, frac, col), y in zip(rows, ypos):
    ax.barh(y, pct, height=0.54, color=col, alpha=0.85, edgecolor=EDGE, lw=0.8, zorder=3)
    ax.text(-1.5, y, name, ha="right", va="center", fontsize=9.5, fontweight="bold", color=INK)
    band = "GREEN" if pct >= 100 else ("YELLOW" if pct >= 75 else ("ORANGE" if pct >= 50 else "RED"))
    txt = "%s    %s" % (frac, band)
    if pct < 55:
        ax.text(pct + 1.5, y, txt, ha="left", va="center", fontsize=8.4, color=INK, zorder=4)
    else:
        ax.text(pct - 1.5, y, txt, ha="right", va="center", fontsize=8.4, color="white",
                fontweight="bold", zorder=4)
ax.set_yticks([])
ax.set_xticks([0, 50, 75, 100])
ax.set_xticklabels(["0%", "50%", "75%", "100%"], fontsize=8)
ax.set_xlabel("Share of applicable criteria met  (band thresholds, §" "5.2)", fontsize=8.5)
for s in ["top", "right", "left"]:
    ax.spines[s].set_visible(False)
ax.tick_params(axis="y", length=0)
ax.set_title("Readiness score at a glance", fontsize=10.5, fontweight="bold", color=INK, pad=18)

# ---- BOTTOM: A/B/C/D category grid (table-scored proposals) ------------------
cats = ["Proposal\nQuality", "Code\nQuality", "Activation\nSafety", "Community\nProcess"]
grid = {
    "Taproot": [(5, 5), (5, 5), (4, 4), (3, 3)],   # 17/17  (crit 12, 19, 20 n/a)
    "BIP-110": [(3, 5), (0, 5), (0, 5), (0, 5)],    # 3/20
}
gnames = list(grid.keys())
axg.set_xlim(-0.02, 4); axg.set_ylim(0, len(gnames) + 0.35)
axg.set_title("By criteria group  (SegWit2x is scored in prose, ~5/17 Red — not shown here)",
              fontsize=7.8, color="#555555", pad=14)

def cell_color(m, n):
    f = m / n
    if f >= 0.999:
        return GREEN
    if f <= 0.001:
        return RED
    return ORANGE

for r, gname in enumerate(gnames):
    yb = len(gnames) - 1 - r
    axg.text(-0.06, yb + 0.5, gname, ha="right", va="center", fontsize=8.8,
             fontweight="bold", color=INK)
    for c, (m, n) in enumerate(grid[gname]):
        col = cell_color(m, n)
        axg.add_patch(Rectangle((c + 0.06, yb + 0.10), 0.88, 0.80,
                                facecolor=col, alpha=0.80, edgecolor=EDGE, lw=0.7))
        axg.text(c + 0.5, yb + 0.5, "%d/%d" % (m, n), ha="center", va="center",
                 fontsize=9.2, color=INK)
for c, cat in enumerate(cats):
    axg.text(c + 0.5, len(gnames) + 0.06, cat, ha="center", va="bottom", fontsize=7.8, color="#444444")
axg.set_xticks([]); axg.set_yticks([])
for s in axg.spines.values():
    s.set_visible(False)

fig.tight_layout()
fig.savefig("fig-5-1-scorecard.pdf", bbox_inches="tight")
fig.savefig("fig-5-1-scorecard.png", dpi=200, bbox_inches="tight")
print("fig 5.1 scorecard done")
