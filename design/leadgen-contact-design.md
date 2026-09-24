# leadgen-contact-design.md

## Section Classification
**Type**: Leadgen-Contact  
**Purpose**: Convert visitors into mortgage/home loan prospects via a trust-building process strip + lightweight contact form.

---

## Layout Structure

```
┌─────────────────────────────────────────────────────┐
│                  [Headline]                          │
│                                                      │
│   ○ Step 1   ○ Step 2   ○ Step 3   ○ Step 4         │
│         [decorative arch behind circles]             │
│                                                      │
│              [CTA Link: "Apply here."]               │
│              [Subtext]                               │
│                                                      │
│  [Name] [Surname] [Email] [Cell] [SUBMIT]            │
└─────────────────────────────────────────────────────┘
```

**Flow**: vertical stack, centred alignment throughout.  
**Max width**: ~1200px, horizontally padded.  
**Background**: full-bleed section with a soft mint/sage colour.

---

## Visual Identity

### Colour Palette
| Role | Value | Usage |
|------|-------|-------|
| Section background | `#bde3d3` (brand mint) | Full section bg |
| Arch fill | `#bde3d3` (brand mint) | Decorative arch shape |
| Step circles | `#5c1f3c` (deep plum/burgundy) | Circle fills |
| Step text | `#ffffff` | Labels inside circles |
| Headline | `#3d1028` (dark maroon) | H1, CTA link |
| Body text | `#3d1028` | Subtext paragraph |
| Submit button | `#e05a1e` (burnt orange) | CTA button bg |
| Submit text | `#ffffff` | Button label |
| Input border | `#e05a1e` | Form field borders |
| Input label | `#e05a1e` | Placeholder/label text |

### Typography
- **Headline**: Bold, rounded sans-serif. Large (≈48px desktop). Dark maroon. Centred.
- **Step labels**: "Step N" in bold white, description below in regular white. Both centred inside circle.
- **CTA link ("Apply here.")**: Bold, large (≈40px), underlined, dark maroon. Acts as a hyperlink.
- **Subtext**: Regular weight, ≈18px, dark maroon, centred, max-width constrained.
- **Form placeholders/labels**: Small caps or uppercase tracking, orange, lightweight.
- **Submit button**: Uppercase, bold, white on orange.

---

## Decorative Arch

A large semi-circle/arch shape sits behind the step circles, spanning most of the section width. It is:
- Slightly darker than the section background
- Used purely for visual framing — not a container
- Implemented as an absolutely positioned SVG or CSS `border-radius` shape
- Centred horizontally, bottom-aligned to roughly the midpoint of the section

---

## Step Circles Component

- **Count**: 4 circles, evenly spaced in a horizontal row
- **Shape**: Perfect circles, large (≈160–180px diameter desktop)
- **Fill**: Deep plum `#5c1f3c`
- **Content** (centred, white):
  - Line 1: `Step N` — bold, ≈14px
  - Line 2–3: Short description — regular, ≈13px, wraps within circle
- **No connectors/arrows** between steps — spacing implies sequence
- **Responsive**: Stack 2×2 on tablet, single column on mobile

| Circle | Label | Description |
|--------|-------|-------------|
| Step 1 | Submit your application. | |
| Step 2 | We negotiate with the banks. | |
| Step 3 | Choose the best offer. | |
| Step 4 | Move into your dream home! | |

---

## CTA Link

- Text: **"Apply here."** (including the period)
- Style: Bold, large, underlined, dark maroon
- Behaviour: Hyperlink to full application page/flow
- Sits above the subtext paragraph, below the step circles

---

## Subtext

> "or fill out the form below and we'll get in touch to assist you in securing the best deal from the banks."

- Centred, regular weight, dark maroon
- Max-width ≈ 700px to keep line length readable
- Acts as a soft secondary CTA bridging the link and form

---

## Lead Capture Form

A single-row inline form. No card wrapper — floats directly on the section background.

### Fields (left to right)
1. **Name** — text input
2. **Surname** — text input
3. **Email** — email input
4. **Cell** — tel input
5. **Submit** — button

### Field Styling
- Height: ≈48px
- Background: transparent or white
- Border: `1.5px solid #e05a1e` (orange)
- Border-radius: minimal (≈4px) — nearly square
- Placeholder/label: uppercase, orange, small tracking
- No floating labels — placeholder text only
- Equal width distribution across the row (flex or grid)

### Submit Button
- Background: `#e05a1e` (burnt orange)
- Text: `SUBMIT` — white, bold, uppercase
- Height matches inputs
- No border-radius or minimal (matches inputs)
- Hover: slightly darker orange

### Responsive
- On mobile/tablet: stack fields vertically, button full-width below

---

## Responsive Breakpoints

Four breakpoints govern layout behaviour. All values are `min-width` (mobile-first).

| Breakpoint | Token | Range |
|------------|-------|-------|
| Small mobile | `sm` | 0 – 479px |
| Large mobile | `lm` | 480 – 767px |
| Tablet | `md` | 768 – 1199px |
| Desktop | `lg` | 1200px+ |

---

### Small Mobile (`0 – 479px`)

**Section**
- Padding: 40px 16px
- Max-width: 100%

**Headline**
- Font-size: 28px
- Line-height: 1.25

**CTA link ("Apply here.")**
- Font-size: 28px

**Subtext**
- Font-size: 15px
- Max-width: 100%

**Decorative arch**
- Hidden (`display: none`) — too wide to render meaningfully at this width

**Step circles**
- Layout: single column, centred
- Diameter: 140px
- Gap between circles: 16px
- Step label font-size: 12px, description font-size: 11px

```
○ Step 1
○ Step 2
○ Step 3
○ Step 4
```

**Form**
- Layout: single column, full width
- Each field: full width, height 48px
- Gap between fields: 10px
- Submit button: full width, height 52px

```
[Name          ]
[Surname       ]
[Email         ]
[Cell          ]
[    SUBMIT    ]
```

---

### Large Mobile (`480px – 767px`)

**Section**
- Padding: 48px 24px

**Headline**
- Font-size: 34px

**CTA link**
- Font-size: 32px

**Subtext**
- Font-size: 16px
- Max-width: 420px

**Decorative arch**
- Visible, but scaled to 90% width, shallower height (≈60% of desktop height)

**Step circles**
- Layout: 2×2 grid, centred
- Diameter: 140px
- Gap: 20px

```
○ Step 1   ○ Step 2
○ Step 3   ○ Step 4
```

**Form**
- Layout: 2-column grid for text fields, submit spans full width below
- Field height: 48px
- Gap: 10px

```
[Name     ] [Surname  ]
[Email    ] [Cell     ]
[      SUBMIT         ]
```

---

### Tablet (`768px – 1199px`)

**Section**
- Padding: 60px 40px

**Headline**
- Font-size: 40px

**CTA link**
- Font-size: 36px

**Subtext**
- Font-size: 17px
- Max-width: 580px

**Decorative arch**
- Fully visible, spans ≈80% of section width

**Step circles**
- Layout: 2×2 grid OR single row of 4 shrunken circles (prefer 2×2 if circles would be smaller than 120px in a row)
- Diameter: 140–150px
- Gap: 24px

```
○ Step 1   ○ Step 2   ○ Step 3   ○ Step 4   ← if space allows
```
or
```
○ Step 1   ○ Step 2
○ Step 3   ○ Step 4
```

**Form**
- Layout: single row, all 4 fields + button
- Fields flex-grow equally; button fixed at ≈120px wide
- Field height: 48px

```
[Name][Surname][Email][Cell][SUBMIT]
```

---

### Desktop (`1200px+`)

**Section**
- Padding: 72px 80px
- Max-width: 1200px, centred

**Headline**
- Font-size: 48px

**CTA link**
- Font-size: 40px

**Subtext**
- Font-size: 18px
- Max-width: 700px

**Decorative arch**
- Full size, spans ≈75% of section width, centred

**Step circles**
- Layout: single horizontal row of 4
- Diameter: 160–180px
- Gap: 32px

```
○ Step 1   ○ Step 2   ○ Step 3   ○ Step 4
```

**Form**
- Single row, all fields inline
- Fields flex-grow equally; Submit button fixed ≈130px
- Field height: 48px
- Gap between fields: 12px

```
[Name  ][Surname][Email     ][Cell  ][SUBMIT]
```

---

## Spacing & Rhythm

| Element | sm (0–479px) | lm (480–767px) | md (768–1199px) | lg (1200px+) |
|---------|-------------|----------------|-----------------|--------------|
| Section padding top/bottom | 40px | 48px | 60px | 72px |
| Section padding left/right | 16px | 24px | 40px | 80px |
| Headline to circles | 24px | 28px | 32px | 32px |
| Circles to CTA link | 32px | 40px | 48px | 48px |
| CTA link to subtext | 10px | 12px | 12px | 12px |
| Subtext to form | 24px | 28px | 32px | 32px |
| Between form fields | 10px | 10px | 12px | 12px |
| Between step circles | 16px | 20px | 24px | 32px |

---

## Implementation Notes

- The arch is decorative only — use an SVG `<ellipse>` or CSS pseudo-element, `position: absolute`, `z-index: 0`; circles sit at `z-index: 1`.
- Section is `position: relative` to contain the arch.
- No box shadows, gradients, or image assets required — purely flat colour.
- The form should include basic client-side validation (required fields, email format) before submit.
- "Apply here." link destination should be configurable via a prop/variable.
- Accessibility: each input needs an `aria-label` since placeholders substitute for visible labels.
