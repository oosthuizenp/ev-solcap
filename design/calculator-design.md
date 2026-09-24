# Calculator Page — Coding Agent Briefing

## Important Notes
- Use the **current site design system** — colours, fonts, border-radius, button styles all match the rest of the site
- **Ignore nav and footer** — they are separate components
- The **calculator itself is an `<iframe>`** — do NOT code the calculator logic, just drop the iframe in its container
- Page background is **white** (`#ffffff`) for the calculator section
- Must be **fully adaptive** — one breakpoint at `768px`

---

## Site Colours (match existing site)

| Token | Hex | Usage |
|---|---|---|
| `--dark-green` | `#1a4a3a` | Headings, Calculate button |
| `--orange` | `#e8522a` | CTA buttons, card accents |
| `--light-bg` | `#f0ede6` | Page cream sections |
| `--input-bg` | `#d6e8e0` | Form field fills (mint green) |
| `--result-bg` | `#c8e0d8` | Results panel (slightly deeper mint) |
| `--text-dark` | `#2c2c2c` | Body headings |
| `--text-body` | `#4a4a4a` | Paragraph text |
| `--card-purple` | `#5c2d4a` | "Speak to an expert" card |
| `--border-radius` | `8px` | Inputs, buttons, cards |

---

## Page Structure (no nav, no footer)

```
┌─────────────────────────────┐
│   SECTION 1: HERO BANNER    │
│   Photo + heading overlay   │
├─────────────────────────────┤
│   SECTION 2: CALCULATOR     │
│   White background          │
│   Heading + subtext         │
│   IFRAME (no coding needed) │
│   CTA button below          │
├─────────────────────────────┤
│   SECTION 3: CARDS          │
│   "We're here for you"      │
│   2 x cards side by side    │
└─────────────────────────────┘
```

---

## Section 1 — Hero Banner

### Content
- Full-width photo of a happy family (photo asset from site)
- Heading overlaid bottom-left: **"Apply for a bond today!"**
  - Large, bold, dark green
  - Two lines, left aligned

### Desktop
- Image takes full width, fixed height ~280px
- Heading sits bottom-left over image, large (~48px)

### Mobile
- Image still full width, height ~220px
- Heading smaller (~32px), still bottom-left

```css
.hero-banner {
  position: relative;
  width: 100%;
  height: 280px;
  overflow: hidden;
}
.hero-banner img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: center top;
}
.hero-heading {
  position: absolute;
  bottom: 24px;
  left: 32px;
  color: var(--dark-green);
  font-size: 3rem;
  font-weight: 800;
  line-height: 1.1;
}

@media (max-width: 768px) {
  .hero-banner { height: 220px; }
  .hero-heading { font-size: 2rem; left: 16px; bottom: 16px; }
}
```

---

## Section 2 — Bond Repayment Calculator

> **The calculator is an `<iframe>`. Do NOT build the calculator. Just embed it.**

### Background: `#ffffff` (white)

### Heading Block (centered)
- `<h2>` — **"Bond Repayment Calculator"** — bold, dark green
- Subtext below — small, centered, `max-width: 560px`, body colour

### Calculator iframe Container

**Desktop** — 2 columns side by side:
```
┌─────────────────────────────────────────────┐
│  LEFT COL (iframe)        │  RIGHT COL       │
│  - Purchase Price input   │  Results panel:  │
│  - Years to repay         │  "Your monthly   │
│  - Interest rate          │   repayments"    │
│  - Deposit                │   R 0            │
│  - [Calculate] button     │  "Total amount   │
│                           │   repayable"     │
│                           │   R 0            │
│                           │  T&C note        │
└─────────────────────────────────────────────┘
```

**Mobile** — stacked vertically:
```
iframe (inputs at top)
Results panel below
```

### iframe Embed
```html
<!-- Drop the calculator iframe here — no custom logic needed -->
<div class="calculator-wrapper">
  <iframe
    src="YOUR_CALCULATOR_IFRAME_URL"
    width="100%"
    height="420"
    frameborder="0"
    title="Bond Repayment Calculator"
  ></iframe>
</div>
```

```css
.calculator-section {
  background: #ffffff;
  padding: 60px 80px;
  text-align: center;
}
.calculator-wrapper {
  max-width: 860px;
  margin: 0 auto;
  border-radius: 12px;
  overflow: hidden;
}

@media (max-width: 768px) {
  .calculator-section { padding: 32px 16px; }
  .calculator-wrapper iframe { height: 560px; }
}
```

### CTA Button (below iframe, centered)
- Text: **"Get pre-qualified now."**
- Style: orange pill button, full orange fill, white text, large

```css
.btn-prequalify {
  background: var(--orange);
  color: white;
  padding: 14px 36px;
  border: none;
  border-radius: 32px;
  font-size: 1.1rem;
  font-weight: 600;
  margin-top: 32px;
  cursor: pointer;
  display: inline-block;
}
```

---

## Section 3 — "We're Here For You" Cards

### Heading (centered)
- `<h2>` — **"We're here for you, what do you need?"**
- Bold, dark green, centered, two lines

### Cards Layout

**Desktop** — 2 cards side by side, equal width:
```
┌──────────────────┐  ┌──────────────────┐
│  Card 1          │  │  Card 2          │
│  Purple bg       │  │  Orange bg       │
│  Photo left half │  │  Photo left half │
│  "Speak to an    │  │  "Home Loans"    │
│   expert"        │  │  Pre-approval    │
│  [Call me back]  │  │  [Apply now!]    │
└──────────────────┘  └──────────────────┘
```

**Mobile** — 2 cards stacked vertically, full width:
```
┌──────────────────────┐
│  Card 1 (purple)     │
│  photo left, text right│
└──────────────────────┘
┌──────────────────────┐
│  Card 2 (orange)     │
│  photo left, text right│
└──────────────────────┘
```

### Card Styles
```css
.cards-section {
  background: var(--light-bg);
  padding: 60px 80px;
}
.cards-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 24px;
  max-width: 900px;
  margin: 0 auto;
}
.card {
  display: grid;
  grid-template-columns: 1fr 1fr;
  border-radius: 12px;
  overflow: hidden;
  min-height: 200px;
}
.card-photo {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
.card-content {
  padding: 24px 20px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  color: white;
}
.card--purple { background: var(--card-purple); }
.card--orange { background: var(--orange); }

@media (max-width: 768px) {
  .cards-section  { padding: 32px 16px; }
  .cards-grid     { grid-template-columns: 1fr; }
}
```

### Card Button Styles
```css
/* Card 1 — Call me back */
.btn-call-back {
  background: var(--orange);
  color: white;
  border: none;
  border-radius: 24px;
  padding: 8px 18px;
  font-weight: 600;
  cursor: pointer;
}

/* Card 2 — Apply now */
.btn-apply {
  background: white;
  color: var(--dark-green);
  border: none;
  border-radius: 24px;
  padding: 8px 18px;
  font-weight: 600;
  cursor: pointer;
}
```

---

## Adaptive / Responsive Summary

| Element | Desktop | Mobile |
|---|---|---|
| Hero heading | `3rem`, bottom-left | `2rem`, bottom-left |
| Hero image height | `280px` | `220px` |
| Calculator section padding | `60px 80px` | `32px 16px` |
| Calculator iframe height | `420px` | `560px` (taller for stacked fields) |
| Cards grid | 2 columns | 1 column stacked |
| Card inner layout | photo + text side by side | photo + text side by side (kept) |

```css
/* Single breakpoint handles everything */
@media (max-width: 768px) {
  .hero-banner      { height: 220px; }
  .hero-heading     { font-size: 2rem; }
  .calculator-section { padding: 32px 16px; }
  .cards-section    { padding: 32px 16px; }
  .cards-grid       { grid-template-columns: 1fr; }
}
```

---

## Checklist for Agent

- [ ] Hero banner with family photo + heading overlay
- [ ] Calculator section — white background, heading, subtext, iframe embed only
- [ ] "Get pre-qualified now" orange pill CTA below iframe
- [ ] Two-card grid section with purple and orange cards
- [ ] All sections adaptive at `768px` breakpoint
- [ ] Use site colour tokens throughout
- [ ] No nav, no footer
- [ ] No calculator logic — iframe only