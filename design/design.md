# Mzansi Bonds — Design System

## Brand Identity

**Brand name:** Mzansi Bonds  
**Tagline:** Own your dream.  
**Mission:** Empowering South Africans to take ownership of their future through property — simplifying the bond process and securing the best deals from the banks.

---

## Colour Palette

| Token | Hex | Usage |
|---|---|---|
| `mzansi-orange` | `#F15A24` | Primary CTA, headings, accents, floating buttons |
| `mzansi-cream` | `#FDF9EB` | Page background |
| `mzansi-teal` | `#bde3d3` | Section backgrounds (hero card, steps section) |
| `mzansi-purple` | `#4D1B36` | Body text, nav text, empowerment heading, step circles, newsletter card |
| `mzansi-text` | `#4D1B36` | Alias for `mzansi-purple` — all body copy |
| `mzansi-sage` | `#bde3d3` | Bank logo placeholder tiles |
| Pink accent | `#FCD8E8` | Calculator card background |
| Form input | `#FFF9E5` | Lead form / newsletter input fields |

---

## Typography

**Font family:** [Outfit](https://fonts.google.com/specimen/Outfit) (Google Fonts)  
**Weights used:** 400 (regular), 600 (semibold), 700 (bold), 800 (extrabold)

| Role | Size / Weight |
|---|---|
| Brand logo | `text-3xl` / extrabold |
| Hero headline | `text-7xl–text-8xl` / extrabold |
| Section headings | `text-4xl–text-5xl` / extrabold |
| Card headings | `text-2xl` / bold–extrabold |
| Body copy | `text-base–text-lg` / regular |
| Labels / buttons | `text-xs–text-sm` / bold–extrabold, `uppercase tracking-widest` |
| Nav links | `text-sm` / semibold, `uppercase tracking-wider` |

---

## Spacing & Layout

- **Max content width:** `max-w-7xl` (1280px), `max-w-6xl` for bank logos and cards, `max-w-4xl` / `max-w-3xl` for centred text sections.
- **Section vertical padding:** `py-24` to `py-32` — generous breathing room between sections.
- **Page horizontal padding:** `px-6` consistently.
- **Grid system:** Tailwind CSS v3, single column on mobile → two or four columns on desktop (`lg:grid-cols-2`, `md:grid-cols-4`).

---

## Shape Language

- **Large rounded corners:** `rounded-[20px]` on all cards, panels, nav, and hero elements (site standard). `rounded-[80px]` on the steps section is deprecated — use `rounded-[20px]`.
- **Circles:** Heavily used — profile images clipped to `rounded-full`, step indicators (`w-[221px] h-[221px] rounded-full`), floating CTA buttons (various sizes), background decorative circle in empowerment section (`w-[600px] h-[600px]`).
- **Image borders:** Circle images have a thick white border — `border-[16px] border-white shadow-xl`.
- **Floating buttons:** Orange circles overlaid on images at `absolute bottom-X right/left-X` — signature interactive motif.

---

## Component Patterns

### Navigation (`nav.html`)
- Horizontal, space-between layout with logo left and links right.
- Links: `uppercase tracking-wider` in `mzansi-purple`, hover to `mzansi-orange`.
- CTA: filled orange pill — `bg-mzansi-orange text-white px-6 py-2.5 rounded-full`.

### Hero (`hero.html`)
- Two-column grid: left = teal card with headline + body; right = full-bleed image.
- Headline in `mzansi-orange`, `text-7xl–8xl`, extrabold.
- Floating circular CTA ("Get started.") overlaid bottom-right of image.

### Intro Text (`intro-text.html`)
- Centered, `max-w-3xl`, `py-24`.
- Orange uppercase heading + muted body copy at 80% opacity.

### Steps (`steps.html`)
- Teal-tinted section with `rounded-[80px]` and `mx-4 md:mx-10`.
- Four purple circles in a row, each ~221px diameter.
- Lead capture form below: 5-column grid (4 inputs + submit button), small uppercase labels.

### Expert Guidance & Best Deals (`expert-guidance.html`, `best-deals.html`)
- Alternating two-column layouts (text + circular image).
- Orange heading, purple body text.
- WhatsApp / "Get started" floating orange circle on image.

### Bank Logos (`bank-logos.html`)
- 2 → 4 column grid of sage-coloured placeholder tiles, `h-24 rounded`.

### Empowerment (`empowerment.html`)
- Centred text section, purple heading.
- Large decorative orange circle (`600px`, `opacity-90`) behind white body quote.

### Multi-Cards (`multi-cards.html`)
- Layout: 3-column grid (`md:grid-cols-3`), `gap-8`, `max-w-6xl`
- Card height: `h-[600px]` each
- Corner radius: `rounded-[40px]`
- Vertical padding: `py-10` internal, `pb-40` section

| Card | Background | Border/Outline | Content |
|------|------------|----------------|---------|
| **Newsletter** (left) | `bg-mzansi-purple` (#4D1B36) | none | Label "Monthly Advice.", heading, email input + button, circular portrait at bottom |
| **Brand Image** (center) | none (full-bleed image) | `border-[10px] border-white` (on portrait) | Hero image with large `ṁ` monogram overlay centered |
| **Calculators** (right) | `bg-[#FCD8E8]` (pink) | none | Circular portrait top, "Find out." button, label + heading at bottom |

---

## Interaction & Motion

- **Hover scale on circles:** `.step-circle { transition: transform 0.3s ease; } :hover { transform: scale(1.05); }` — applies to step indicators and floating CTA buttons.
- **Nav link hover:** colour transition to `mzansi-orange`.
- **CTA button hover:** `hover:scale-105 transition-transform` (hero) / `hover:opacity-90` (nav pill).

---

## Page Structure (Home)

```
nav
hero           ← full-width, 2-col grid
intro-text     ← centred, narrow
steps          ← teal rounded section + lead form   [#get-started]
expert-guidance ← 2-col, text left + circle image right  [#advice]
best-deals     ← 2-col, circle image left + text right
bank-logos     ← 4-col logo grid
empowerment    ← centred + large orange decorative circle
multi-cards    ← 3-col tall card grid
```

---

## Technology Stack

- **CSS framework:** Tailwind CSS v3 (CDN) with custom theme extension
- **Base stylesheet:** Bootstrap SCSS (compiled via webpack) — layout utilities and legacy components
- **Typography:** Google Fonts — Outfit
- **Site generator:** Jekyll
- **Hosting:** Render

---

## Viewport Breakpoints

### Standardized Viewport Ranges

| Range | Device Type | Typical Sizes |
|-------|-------------|---------------|
| 0px - 575px | Mobile | 360x800px, 375x812px (iOS) |
| 576px - 768px | Tablets (Portrait) | 768px |
| 769px - 1024px | Tablets (Landscape) / Laptops | 1024px |
| 1025px - 1440px | Desktop | 1280px – 1440px |
| > 1440px | Large Desktop / 4K | 1440px – 1920px (content contained) |

### Tailwind Breakpoint Mapping

| Tailwind Class | Breakpoint | Device Type |
|----------------|------------|-------------|
| (no prefix) | 0px - 575px | Mobile |
| `md:` | 576px - 768px | Tablet Portrait |
| `lg:` | 769px - 1024px | Tablet Landscape / Laptop |
| `xl:` | 1025px - 1440px | Desktop |
| `2xl:` | > 1440px | Large Desktop |

### Component-Specific Breakpoints

#### Step Circles
- Desktop (> 1024px): 221px × 221px
- Tablet (720px - 1024px): 155px × 155px (30% reduction)
- Mobile (< 720px): 221px × 221px (full size)

#### Floating Action Circles
- "Get started" (best-deals.html): 48 (desktop), 32 (mobile)
- "WhatsApp us" (expert-guidance.html): 48 (desktop), 40 (mobile)

#### Form Fields
- Name/Surname: Combined single input (no line break)
- Font size: 1.25rem (text-sm at default)
- Line height: 1.25 (golden ratio)
- Letter spacing: 0.1em (widest)
