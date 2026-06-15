# fig_2_1_timeline.py  ->  fig-2-1-timeline.pdf / .png
# Figure 2.1: review-duration lifecycles of five Bitcoin consensus changes, 2012-2026.
# One lane per proposal on a shared time axis. Each bar runs from first proposal to
# activation (or cancellation), drawn to scale, so the bar LENGTH is the review period
# -- the comparison the caption draws. Bar COLOR encodes outcome, reusing Fig 3.1's
# risk-band palette (green = clean activation, amber = activated but forked, red =
# canceled / pending) so the two figures and the Sec 5.2 scorecard share one
# Red<->Green safety semantic. End-cap glyph (dot / x / hollow) repeats the outcome in
# shape, so the figure survives grayscale printing and red-green colorblindness.
import matplotlib.pyplot as plt

plt.rcParams.update({
    "font.family": "serif",
    "font.serif": ["Palatino Linotype", "Book Antiqua", "TeX Gyre Pagella", "DejaVu Serif"],
    "font.size": 9,
})

# Fig 3.1 band palette
GREEN, AMBER, RED = "#7bb37b", "#e8a33d", "#d9534f"

# name, start(yr), end(yr), duration label, outcome label, end-glyph, pending_end, color
LANES = [
    ("P2SH",     2012.00, 2012.30, "~3 months", "forked, then flag-day rescue", "dot",  None,   AMBER),
    ("SegWit",   2015.92, 2017.65, "20 months", "activated (95%)",              "dot",  None,   GREEN),
    ("SegWit2x", 2017.38, 2017.87, "~6 months", "canceled",                     "x",    None,   RED),
    ("Taproot",  2018.04, 2021.87, "~4 years",  "activated (90%)",              "dot",  None,   GREEN),
    ("BIP-110",  2025.82, 2025.94, "6 weeks",   "pending, <1% signaling",       "open", 2026.70, RED),
]

EDGE = "#555555"
INK = "#222222"
y_positions = list(range(len(LANES), 0, -1))   # P2SH on top

fig, ax = plt.subplots(figsize=(6.1, 2.75))

for (name, x0, x1, dur, outcome, glyph, pend, color), y in zip(LANES, y_positions):
    # the review-duration bar (length == review period, to scale; color == outcome)
    ax.barh(y, x1 - x0, left=x0, height=0.46, color=color, alpha=0.80,
            edgecolor=EDGE, lw=0.8, zorder=2)
    # BIP-110: dashed extension to the pending forced-activation window + hollow marker
    if pend is not None:
        ax.plot([x1, pend], [y, y], color=INK, lw=0.9, ls=(0, (3, 2)), zorder=2)
        ax.plot(pend, y, "o", mfc="white", mec=INK, ms=6, zorder=3)
    # outcome end-cap glyph (dark, so it reads on any bar color and in grayscale)
    if glyph == "dot":
        ax.plot(x1, y, "o", color=INK, ms=5, zorder=3)
    elif glyph == "x":
        ax.plot(x1, y, "x", color=INK, ms=6, mew=1.4, zorder=3)
    # annotation: review duration + outcome
    label = "%s  —  %s" % (dur, outcome)
    if name == "BIP-110":
        ax.text(x0 - 0.45, y, label, ha="right", va="center", fontsize=7.6, color=INK)
    else:
        xr = (pend if pend is not None else x1) + 0.28
        ax.text(xr, y, label, ha="left", va="center", fontsize=7.6, color=INK)

ax.set_xlim(2011.4, 2027.6)
ax.set_ylim(0.35, len(LANES) + 0.85)
ax.set_xticks(range(2012, 2027, 2))
ax.set_yticks(y_positions)
ax.set_yticklabels([l[0] for l in LANES], fontsize=8.6)
ax.tick_params(axis="x", labelsize=8)
ax.tick_params(axis="y", length=0)
for s in ["top", "right", "left"]:
    ax.spines[s].set_visible(False)
ax.spines["bottom"].set_position(("data", 0.5))
ax.set_axisbelow(True)
ax.grid(axis="x", color="#ececec", lw=0.6, zorder=0)

fig.tight_layout()
fig.savefig("fig-2-1-timeline.pdf")
fig.savefig("fig-2-1-timeline.png", dpi=200)
print("fig 2.1 colored done")
