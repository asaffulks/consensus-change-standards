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

ax.annotate(pts[0][2], xy=(pts[0][0], pts[0][1]), xytext=(0.565, 0.55), fontsize=8)
ax.annotate(pts[1][2], xy=(pts[1][0], pts[1][1]), xytext=(0.69, 2.2e-3), fontsize=8)
ax.annotate(pts[2][2], xy=(pts[2][0], pts[2][1]), xytext=(0.835, 1.5e-5), fontsize=8)
ax.annotate(pts[3][2], xy=(pts[3][0], pts[3][1]), xytext=(0.875, 1.1e-8), fontsize=8)

for xc, lab in [(0.55, "reckless"), (0.70, "presumptively\ndangerous"), (0.945, "safe")]:
    ax.text(xc, 2.0, lab, ha="center", fontsize=7.5, color="#444444")

ax.set_xlim(0.50, 1.0)
ax.set_ylim(1e-9, 4)
ax.set_xlabel("Enforcing hashrate share at activation (E)")
ax.set_ylabel("P(non-enforcing chain leads by six\nblocks during activation)")
ax.grid(axis="y", which="major", color="#cccccc", lw=0.4)
for s in ["top", "right"]:
    ax.spines[s].set_visible(False)

fig.tight_layout()
fig.savefig("fig-3-1-cliff.pdf")
fig.savefig("fig-3-1-cliff.png", dpi=200)
print("fig 3.1 done")
