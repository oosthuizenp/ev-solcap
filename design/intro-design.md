# intro-design.md

## Section Classification
**Type**: Intro / Text Block  
**Purpose**: Value proposition reinforcement after hero. Establishes brand mission and positioning.

---

## Layout Structure

```
┌─────────────────────────────────────┐
│           [Heading]                 │
│         "Secure the best            │
│          bond deals."                │
│                                     │
│           [Body Copy]               │
│     (max-width: 700px centered)     │
└─────────────────────────────────────┘
```

- **Alignment**: Centered
- **Container max-width**: 1200px
- **Paragraph max-width**: 700px (centered)
- **Vertical padding**: py-24 (96px)

---

## Visual Identity

### Colour Palette
| Role | Value | Usage |
|------|-------|-------|
| Heading text | `#F15A24` (mzansi-orange) | Uppercase heading |
| Body text | `#4D1B36` (mzansi-text) | Body copy at 80% opacity |

### Typography
- **Heading**: `text-5xl` (42px), `font-extrabold`, `uppercase`, `tracking-wide`
- **Body**: `text-xl` (20px), `leading-relaxed` (1.625), `text-mzansi-text/80`

---

## Spacing

| Element | Value |
|---------|-------|
| Section padding (y) | py-24 (96px) |
| Section padding (x) | px-6 (24px) |
| Heading → Body gap | mb-8 (32px) |
| Paragraph max-width | 700px |

---

## Responsive

- Mobile: Same structure, padding reduces slightly
- Desktop: Full 700px paragraph width

---

## Data Structure (sitetext.yml)

```yaml
intro:
  title: "Secure the best<br />bond deals."
  body: "Mzansi Bonds empowers the people of South Africa to take ownership of their future through property. As a champion for everyday South Africans, we simplify the bond process, unlock the best deals from the banks, and guide people on the journey to home ownership."
```

---

## Implementation Notes

- Heading uses `<br />` for line break after "best"
- Body paragraph has `mx-auto` to center within 700px max-width
- Opacity `text-mzansi-text/80` creates subtle, sophisticated look