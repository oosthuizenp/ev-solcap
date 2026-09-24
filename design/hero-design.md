# hero-design.md

## Section Classification
**Type**: Hero — Split Layout (Text + Image)  
**Purpose**: Brand-first impression. Establishes value proposition and drives a single CTA ("Get started.") into the bond/home loan service.

---

## Layout Structure

```
┌──────────────────────────┬──────────────────────────┐
│                          │                          │
│  [Eyebrow]               │                          │
│  [Hero Headline]         │    [Full-bleed photo]    │
│                          │                          │
│  [Body copy × 2 paras]   │       ○ Get started.     │
│                          │                          │
└──────────────────────────┴──────────────────────────┘
```

**Split**: ~50/50 two-column horizontal split.  
**Left panel**: text content on mint background, rounded corners on the card/panel.  
**Right panel**: full-bleed lifestyle photo, no padding, fills its column edge-to-edge.  
**Overall container**: rounded corners (≈16px), sits on a warm cream/off-white page background.  
**Max width**: ≈1200px, centred on page.

---

## Visual Identity

### Colour Palette
| Role | Value | Usage |
|------|-------|-------|
| Page background | `#f5f0e8` (warm cream/off-white) | Outer page bg |
| Left panel bg | `#bde3d3` (brand mint) | Text column fill |
| Hero headline | `#e05a1e` (burnt orange) | Large display text |
| Eyebrow text | `#2d5c45` (dark teal/forest green) | Small label above headline |
| Body copy | `#2d5c45` (dark teal/forest green) | Paragraph text |
| CTA circle bg | `#e05a1e` (burnt orange) | Round button fill |
| CTA circle text | `#ffffff` | Button label |

### Typography
- **Eyebrow**: Regular weight, ≈16px, dark teal, no caps, sits above headline
- **Hero headline**: Extra-bold/black weight, very large (≈72–80px desktop), burnt orange, left-aligned, multi-line
- **Body copy**: Regular weight, ≈17px mobile / 20px desktop, dark teal, left-aligned, comfortable line-height (1.618)
- **CTA label**: Bold, ≈20px, white, centred inside circle, multi-line ("Get / started.")

---

## Left Panel — Text Content

Stacked vertically, left-aligned, padded generously.

**Order (top to bottom):**
1. Eyebrow line: `"Secure the best bond deals."`
2. Hero headline: `"Own your dream."` — large, orange, bold
3. Spacer (≈40–48px gap between headline and body)
4. Body para 1: `"Take ownership of your future through property."`
5. Body para 2: `"We simplify the bond process and secure the best deals from the banks."`

**Padding**: ≈48px all sides on desktop.  
**Panel border-radius**: ≈16px (left panel is a rounded card; right image clips to its container shape).

---

## Right Panel — Lifestyle Photo

- Full-bleed image, no padding, fills the entire right column
- Image: lifestyle photo of a smiling woman, warm tones, aspirational/approachable
- Image is a placeholder — slot should accept any portrait-oriented lifestyle image
- `object-fit: cover`, `object-position: center top` to keep subject's face in frame
- Right panel has matching border-radius (≈16px) clipping the image corners

### CTA Circle Button
- Overlays the photo, positioned in the lower-centre of the image
- Shape: perfect circle, ≈160–180px diameter
- Background: burnt orange `#e05a1e`
- Text: `"Get started."` — bold white, centred, ≈20px, wraps to 2 lines
- Behaviour: primary CTA link/button — navigates to application or leadgen form
- `position: absolute` relative to the right panel, centred horizontally, vertically in lower half (≈55–65% from top)
- Hover: slight scale-up (1.05) + darker orange

---

## Responsive Breakpoints

| Breakpoint | Token | Range |
|------------|-------|-------|
| Small mobile | `sm` | 0 – 479px |
| Large mobile | `lm` | 480 – 767px |
| Tablet | `md` | 768 – 1199px |
| Desktop | `lg` | 1200px+ |

---

### Small Mobile (`0 – 479px`)

**Layout**: Single column — text panel stacked above image panel.

**Container**
- Border-radius: 12px
- Margin: 12px

**Left/text panel**
- Padding: 28px 20px
- Full width

**Eyebrow**
- Font-size: 13px

**Headline**
- Font-size: 40px
- Line-height: 1.1

**Body copy**
- Font-size: 15px
- Gap between paragraphs: 12px

**Right/image panel**
- Width: 100%
- Height: 280px fixed
- `object-fit: cover`, `object-position: center 20%`
- Border-radius: 0 0 12px 12px (bottom corners only — top is flush with text panel)

**CTA circle**
- Diameter: 120px
- Font-size: 16px
- Position: centred horizontally, vertically centred in image panel

```
┌─────────────────────┐
│ Eyebrow             │
│ Hero headline       │
│                     │
│ Body copy para 1    │
│ Body copy para 2    │
└─────────────────────┘
┌─────────────────────┐
│                     │
│    ○ Get started.   │
│   [lifestyle photo] │
│                     │
└─────────────────────┘
```

---

### Large Mobile (`480px – 767px`)

**Layout**: Single column, same as sm but with more breathing room.

**Container**
- Margin: 16px

**Left/text panel**
- Padding: 36px 28px

**Eyebrow**
- Font-size: 14px

**Headline**
- Font-size: 48px

**Body copy**
- Font-size: 16px

**Right/image panel**
- Height: 340px fixed
- Full width

**CTA circle**
- Diameter: 140px
- Font-size: 18px

```
┌───────────────────────────┐
│ Eyebrow                   │
│ Hero headline             │
│                           │
│ Body copy                 │
└───────────────────────────┘
┌───────────────────────────┐
│                           │
│      ○ Get started.       │
│      [lifestyle photo]    │
│                           │
└───────────────────────────┘
```

---

### Tablet (`768px – 1199px`)

**Layout**: Two columns side-by-side. Left ≈45%, right ≈55%.

**Container**
- Border-radius: 16px
- Margin: 24px

**Left/text panel**
- Padding: 40px 36px
- Vertically centred content

**Eyebrow**
- Font-size: 15px

**Headline**
- Font-size: 52–60px

**Body copy**
- Font-size: 16px

**Right/image panel**
- Fills column height entirely
- `object-fit: cover`
- Border-radius: 0 16px 16px 0 (right corners only)

**CTA circle**
- Diameter: 150px
- Font-size: 18px
- Position: lower-centre of image, ≈60% from top, centred horizontally

```
┌────────────────┬─────────────────────┐
│ Eyebrow        │                     │
│ Hero headline  │  [lifestyle photo]  │
│                │                     │
│ Body copy      │   ○ Get started.    │
│                │                     │
└────────────────┴─────────────────────┘
```

---

### Desktop (`1200px+`)

**Layout**: Two columns, 50/50 split.

**Container**
- Max-width: 1200px
- Border-radius: 16px
- Margin: 0 auto
- Outer page padding: 40px

**Left/text panel**
- Padding: 48px 48px
- Vertically centred

**Eyebrow**
- Font-size: 16px

**Headline**
- Font-size: 72–80px
- Line-height: 1.05

**Body copy**
- Font-size: 17–18px
- Gap between paragraphs: 16px

**Right/image panel**
- Fills full column, no padding
- Border-radius: 0 16px 16px 0

**CTA circle**
- Diameter: 170px
- Font-size: 20px
- Position: `bottom: 15%`, `left: 50%`, `transform: translateX(-50%)`

```
┌──────────────────────┬──────────────────────┐
│                      │                      │
│ Eyebrow              │   [lifestyle photo]  │
│ Own your             │                      │
│ dream.               │                      │
│                      │    ○ Get started.    │
│ Body copy para 1     │                      │
│ Body copy para 2     │                      │
│                      │                      │
└──────────────────────┴──────────────────────┘
```

---

## Spacing & Rhythm

| Element | sm | lm | md | lg |
|---------|----|----|----|----|
| Container margin | 12px | 16px | 24px | 40px auto |
| Text panel padding (all) | 28px 20px | 36px 28px | 40px 36px | 48px 48px |
| Eyebrow → headline gap | 8px | 10px | 12px | 12px |
| Headline → body gap | 32px | 36px | 40px | 48px |
| Between body paragraphs | 12px | 12px | 14px | 16px |
| Image panel height (stacked) | 280px | 340px | full | full |
| CTA circle diameter | 120px | 140px | 150px | 170px |

---

## Implementation Notes

- The overall card/container is `display: flex`, `flex-direction: row` on md+, `column` on sm/lm.
- Right panel is `position: relative` to contain the absolutely positioned CTA circle.
- Image should be supplied as a slot/prop — do not hardcode. Accept `src` and `alt` attributes.
- CTA circle `href` should be configurable (links to form, modal, or new page).
- On sm/lm, image panel border-radius should only round the bottom corners to stay flush below the text panel.
- On md+, image panel border-radius should only round the right corners to stay flush against the text panel.
- No box shadows on the card — the contrast between the cream page bg and the mint panel provides sufficient separation.
- Ensure CTA circle meets contrast ratio (white on orange `#e05a1e` passes AA for large text).
