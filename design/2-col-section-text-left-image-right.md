# 2-col-section-text-left-image-right.md

## Section Classification
**Type**: Two-Column Section - Text Left / Image Right  
**Variants**: Expert Guidance (text-left), Best Deals (text-right, image-left)

---

## Layout Structure

```
┌─────────────────────┬─────────────────────┐
│                     │                     │
│    [Heading]        │                     │
│    "Expert          │                     │
│    guidance from    │   [Circular Image]  │
│    start to         │                     │
│    finish."         │   ○ CTA Circle      │
│                     │                     │
│    [Body Copy]      │                     │
│                     │                     │
└─────────────────────┴─────────────────────┘
```

- **Columns**: 50/50 split (lg:grid-cols-2)
- **Gap**: gap-20 (80px)
- **Alignment**: items-center (vertically centered)
- **Image shape**: Circular (aspect-square, rounded-full)
- **Image border**: 16px white border + shadow-xl

---

## Visual Identity

### Colour Palette
| Role | Value | Usage |
|------|-------|-------|
| Heading text | `#F15A24` (mzansi-orange) | Section headline |
| Body text | `#4D1B36` (mzansi-text) | Paragraph text |
| CTA circle bg | `#F15A24` (mzansi-orange) | Floating action button |
| CTA circle text | `#ffffff` (white) | CTA label |
| Image border | `#ffffff` (white) | 16px border around circle |

### Typography
- **Heading**: `text-5xl` (42px), `font-extrabold`, `leading-tight`, `text-mzansi-orange`
- **Body**: 
  - Font family: `Poppins`, sans-serif
  - Style: normal
  - Weight: 400
  - Size: 18px
  - Line height: 28px
  - Color: `text-mzansi-text`, `max-w-sm`
- **CTA**: `text-base`, `font-bold`, `leading-tight`

---

## Spacing

| Element | Value |
|---------|-------|
| Section padding (y) | py-32 (128px) |
| Section padding (x) | px-6 (24px) |
| Grid gap | gap-20 (80px) |
| Heading → Body gap | mb-8 (32px) |
| Body bottom margin | mb-12 (48px) |
| Image circle | aspect-square, rounded-full |
| Image border | border-[16px] border-white |
| CTA circle | w-48 h-48 (192px) |

---

## Component: Floating CTA Circle

- **Shape**: Perfect circle, 48 (192px)
- **Position**: 
  - Expert (left): `absolute bottom-10 -left-10`
  - Best deals (right): `absolute bottom-10 -right-10`
- **Background**: mzansi-orange
- **Text**: White, centered, wraps to 2 lines
- **Hover**: step-circle scale transform

---

## Responsive Breakpoints

- Mobile: Single column (grid-cols-1), image above or below
- Desktop (lg): Two columns side-by-side

---

## Data Structure (sitetext.yml)

```yaml
expert:
  title: "Expert<br />guidance from<br />start to finish."
  body: "We guide you through every step of the bond process so you can move forward with confidence."
  cta_text: "WhatsApp us for expert advice."

2-col-image_left_text_right:
  title: "Access to the<br />best deals from<br />the banks."
  body: "We work with South Africa's leading banks to secure the most competitive home loan offers."
  cta_text: "Get<br />started."
```

---

## Implementation Notes

- Sections use `max-w-[1200px]` for consistency
- Both sections have same layout pattern but reversed on mobile (best-deals uses `order-1` / `order-2`)
- Image wrapped in circular container with white border and shadow
- CTA circle positioned absolutely relative to image container
- HTML template supports data-driven content from sitetext.yml