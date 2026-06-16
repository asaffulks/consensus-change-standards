# fig_3_1_cliff.py  ->  fig-3-1-cliff.pdf / .png
# Figure 3.1: P(E) = ((1-E)/E)^6 on a log scale, with historical thresholds marked.
import numpy as np
import matplotlib.pyplot as plt

plt.rcParams.update({
    "font.family": "serif",
    "font.serif": ["Palatino Linotype", "Book Antiqua", "TeX Gyre Pagella", "DejaVu Serif"],
    "font.size": 9,
})

E = np.linspace(0.501, 0.99, 600)
P = ((1 - E) / E) ** 6

fig, ax = plt.subplots(figsize=(6.1, 3.4))

# Risk-tier bands per section 3.4: <0.60 reckless, 0.60-0.80 presumptively dangerous,
# 0.80-0.90 (unlabeled margin), >=0.90 safe.
for x0, x1, c in [(0.50, 0.60, "#d9534f"), (0.60, 0.80, "#e8a33d"),
                  (0.80, 0.90, "#e6d96a"), (0.90, 1.00, "#7bb37b")]:
    ax.axvspan(x0, x1, color=c, alpha=0.13, lw=0)

ax.semilogy(E, P, color="black", lw=1.6)

pts = [
    (0.55, (0.45 / 0.55) ** 6, "P2SH 2012 · BIP-110 2025–26"),
    (0.80, (0.20 / 0.80) ** 6, "BIP-91 / SegWit2x NYA"),
    (0.90, (0.10 / 0.90) ** 6, "Taproot"),
    (0.95, (0.05 / 0.95) ** 6, "SegWit (BIP-9)"),
]
for x, y, lab in pts:
    ax.plot(x, y, "o", color="black", ms=4.5)

# Each label sits in clear space OFF the curve, with a thin leader line to its
# marker so the correspondence is unambiguous and no text is crossed by the curve.
# P2SH sits in the open sky above the curve; the rest sit below the curve,
# right-aligned so each label ends just left of (and points up-right to) its dot.
lead = dict(arrowstyle="-", color="#666666", lw=0.6, shrinkA=2, shrinkB=4)

ax.annotate(pts[0][2], xy=(pts[0][0], pts[0][1]), xytext=(0.575, 0.60),
            fontsize=8, ha="left", va="center", arrowprops=lead)
ax.annotate(pts[1][2], xy=(pts[1][0], pts[1][1]), xytext=(0.78, 4.5e-5),
            fontsize=8, ha="right", va="center", arrowprops=lead)
ax.annotate(pts[2][2], xy=(pts[2][0], pts[2][1]), xytext=(0.88, 3.5e-7),
            fontsize=8, ha="right", va="center", arrowprops=lead)
ax.annotate(pts[3][2], xy=(pts[3][0], pts[3][1]), xytext=(0.935, 5.5e-9),
            fontsize=8, ha="right", va="center", arrowprops=lead)

# band labels as a single-line header row just above the plot box
htrans = ax.get_xaxis_transform()  # x in data coords, y in axes-fraction
for xc, lab in [(0.55, "reckless"), (0.70, "presumptively dangerous"), (0.945, "safe")]:
    ax.text(xc, 1.03, lab, transform=htrans, ha="center", va="bottom",
            fontsize=7.5, color="#444444", clip_on=False)

ax.set_xlim(0.50, 1.0)
ax.set_ylim(1e-9, 4)
ax.set_xlabel("Enforcing hashrate share at activation (E)")
ax.set_ylabel("Probability of a six-block reorg\nduring activation")
ax.grid(axis="y", which="major", color="#cccccc", lw=0.4)
for s in ["top", "right"]:
    ax.spines[s].set_visible(False)

fig.tight_layout(rect=[0, 0, 1, 0.92])  # reserve a top strip for the band header
fig.savefig("fig-3-1-cliff.pdf")
fig.savefig("fig-3-1-cliff.png", dpi=200)
print("fig 3.1 done")
