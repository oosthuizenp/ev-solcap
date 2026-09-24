# Breakpoints

## Responsive & Adaptive Design Guidelines

A simple, modern, mobile-first responsive system used throughout this project.
The goal is to build layouts that adapt naturally to available space while keeping the CSS predictable, maintainable, and easy to extend.

---

## Design Philosophy

This project follows a **responsive-first** approach with **selective adaptive behaviour**.
Layouts should be fluid by default and only introduce breakpoint-specific changes when the user experience genuinely benefits.

### Principles

- Mobile-first
- Design for content, not devices
- Prefer fluid layouts over fixed layouts
- Keep breakpoints to a minimum
- Keep components self-contained
- Responsive by default, adaptive only when necessary

---

## Breakpoints

The project uses four global layout breakpoints.

| Name | Width | Typical devices |
| --- | --- | --- |
| Mobile | 0–559px | Phones |
| Large Mobile | 560–767px | Large phones |
| Tablet | 768–1199px | Tablets, small laptops |
| Desktop | 1200px+ | Laptops and desktops |

---

## SCSS Variables

```scss
$bp-sm: 560px;
$bp-md: 768px;
$bp-lg: 1200px;
```

---

## Media Queries

Always use **min-width** media queries.

```scss
@media (min-width: $bp-sm) {
  // styles
}

@media (min-width: $bp-md) {
  // styles
}

@media (min-width: $bp-lg) {
  // styles
}
```

Never use `max-width` unless solving a very specific edge case.

---

## Responsive Design

Responsive design is the default behaviour.
Layouts should naturally scale and reflow without requiring extra media queries.
Prefer using:

- CSS Grid
- Flexbox
- Relative units (`rem`, `%`, `vw`)
- `clamp()`
- `minmax()`
- `auto-fit`
- `auto-fill`
- Flexible images
- Natural wrapping

Example:

```scss
.hero__title {
  font-size: clamp(2.5rem, 5vw, 5rem);
}

.card-grid {
  display: grid;
  gap: 2rem;
  grid-template-columns: repeat(auto-fit, minmax(18rem, 1fr));
}
```

Responsive behaviour should solve most layout problems before introducing a breakpoint.

---

## Adaptive Design

Adaptive design deliberately changes the layout at a breakpoint.
Use adaptive behaviour only when a fluid layout no longer provides a good experience.

Examples include:

- Mobile navigation
- Hero stacking
- Sidebar repositioning
- Card count changes
- Carousel behaviour
- Form layout changes
- Content reordering
- Hiding decorative imagery

Example:

```scss
.hero {
  display: grid;
  grid-template-columns: 1fr;
  gap: 2rem;
}

@media (min-width: $bp-md) {
  .hero {
    grid-template-columns: 1.1fr 0.9fr;
    align-items: center;
  }
}
```

Adaptive changes should improve usability, not simply create another version of the page.

---

## Choosing Between Responsive and Adaptive

Before adding a breakpoint, ask:

1. Can Flexbox solve this?
2. Can Grid solve this?
3. Can wrapping solve this?
4. Can `auto-fit` or `minmax()` solve this?
5. Can `clamp()` solve this?
6. Is the component actually broken?
7. Would changing the layout improve usability?

Only if the answer is **yes** should an adaptive breakpoint be introduced.

---

## Component-Level Adaptation

Components own their responsive behaviour.
Avoid creating global layout rules that affect every component.

### Good

```scss
.team-card {
  display: grid;
  gap: 1rem;

  @media (min-width: $bp-md) {
    grid-template-columns: 10rem 1fr;
  }
}
```

### Not recommended

```scss
@media (min-width: $bp-md) {
  .card {}
  .hero {}
  .gallery {}
}
```

Each component should only respond at the breakpoints it actually requires.

---

## Layout Behaviour

### Mobile (0–559px)

- Single-column layouts
- Vertical stacking
- Mobile navigation
- Large touch targets
- Comfortable spacing
- Minimal visual clutter

### Large Mobile (560–767px)

- Increase whitespace
- Wider cards
- Optional two-column layouts
- Larger typography where appropriate

### Tablet (768–1199px)

- Multi-column layouts
- Side-by-side content
- Expanded navigation
- Larger imagery
- Increased spacing

### Desktop (1200px+)

- Maximum container width
- Full navigation
- Richer layouts
- More whitespace
- Strong visual hierarchy

---

## Container

```scss
$container-width: 1200px;
```

Recommended container:

```scss
.container {
  width: min(calc(100% - 2rem), $container-width);
  margin-inline: auto;
}
```

---

## Spacing

Spacing should scale naturally.

| Breakpoint | Horizontal padding |
| --- | ---: |
| Mobile | 1rem |
| Large Mobile | 1.5rem |
| Tablet | 2rem |
| Desktop | 2.5rem |

Increase spacing gradually and avoid large jumps.

---

## Typography

Typography should be fluid wherever possible.

Example:

```scss
h1 {
  font-size: clamp(2.5rem, 5vw, 5rem);
}

h2 {
  font-size: clamp(2rem, 3vw, 3.5rem);
}

p {
  font-size: 1rem;
}
```

Recommendations:

- Base font size: **16px**
- Keep body text consistent
- Scale headings with `clamp()`
- Avoid multiple typography breakpoints

---

## Images

Images should always be responsive.

```scss
img {
  display: block;
  max-width: 100%;
  height: auto;
}
```

Decorative imagery may be hidden or repositioned on smaller screens if it improves readability.

---

## Grid Recommendations

Prefer auto-fitting grids.

```scss
display: grid;
grid-template-columns: repeat(auto-fit, minmax(18rem, 1fr));
```

Avoid manually changing the number of columns unless necessary.

---

## Flexbox Recommendations

Use Flexbox for:

- Navigation
- Buttons
- Cards
- Toolbars
- Alignment
- Small layouts

Use Grid for:

- Sections
- Galleries
- Feature layouts
- Card collections
- Complex page layouts

---

## CSS Architecture

Every component should:

- Be independent
- Own its breakpoints
- Avoid global overrides
- Avoid unnecessary nesting
- Be reusable

Follow BEM naming.

Example:

```scss
.hero {}
.hero__content {}
.hero__image {}
.hero--large {}
```

---

## Best Practices

- Mobile first
- Responsive by default
- Adaptive only when necessary
- Use `min-width`
- Prefer fluid sizing
- Use `clamp()`
- Use Grid and Flexbox
- Keep components independent
- Test between breakpoints
- Let content determine layout

---

## Avoid

- Device-specific CSS
- Pixel-perfect layouts
- Excessive breakpoints
- Deep selector nesting
- Layouts built around screen sizes
- Fixed widths where fluid sizing works
- Duplicating layouts for desktop and mobile

---

## Development Order

When building a new component:

1. Build the mobile layout.
2. Make it fluid using Grid or Flexbox.
3. Add responsive sizing with `clamp()` where appropriate.
4. Test across viewport widths.
5. Introduce adaptive changes only if the layout breaks.
6. Stop adding breakpoints once the experience is comfortable.

---

## Summary

```text
0 ─────────────────────────────────────────────────────────────►

Mobile         0–559px
Large Mobile   560–767px
Tablet         768–1199px
Desktop        1200px+
```

### Design hierarchy

1. Mobile first
2. Fluid responsive layout
3. Flexible components
4. Adaptive layout changes (only when necessary)

A component should be as fluid as possible, as adaptive as necessary, and never more complex than required.
This four-breakpoint system is intentionally minimal. It provides excellent coverage for modern devices while keeping stylesheets clean, predictable, and easy to maintain.

