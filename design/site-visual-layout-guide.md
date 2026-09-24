# Site Visual Layout Guide

This document is the visual blueprint for the Mzansi Bonds website. It is written so another coding agent can reconstruct the site look and feel without guessing about layout, spacing, hierarchy, or copy strategy.

## 1. Core design intent

The site is a clean, warm, premium financial brand with:

- a soft cream/off-white page background
- deep plum text for readability and authority
- burnt orange as the primary CTA and highlight colour
- mint/teal panels for supportive sections and emphasis
- generous white space and rounded corners across cards and panels
- a strong, editorial homepage structure with central copy and clear conversion paths

The site should feel trustworthy, aspirational, and easy to understand for home buyers and finance seekers.

---

## 2. Visual system

### Brand colours

| Token | Hex | Used for |
|---|---|---|
| `mzansi-cream` | `#FDF9EB` | Page background |
| `mzansi-orange` | `#F15A24` | CTA buttons, headings, accent elements |
| `mzansi-teal` | `#BDE3D3` | Sections and soft highlight blocks |
| `mzansi-purple` | `#4D1B36` | Main text, nav, strong headings |
| `mzansi-text` | `#4D1B36` | Default body copy |
| Pink accent | `#FCD8E8` | Promotional cards / highlight panels |
| Form fill | `#FFF9E5` | Inputs and form backgrounds |

### Typography

- Font family: `Outfit` (Google Fonts)
- Headings: bold / extra-bold, large and confident
- Body copy: regular, highly legible, generous line height
- Buttons and labels: uppercase or tracking-wide for emphasis

Recommended hierarchy:

- Hero headline: very large, bold, orange, stacked by line breaks
- Section headings: large, dark purple, bold
- Card headings: medium-large, strong weight
- Body text: base to large size, low opacity or deep plum depending on context

### Shape language

- Rounded corners are a major design feature
- Standard card radius: `rounded-[20px]`
- Larger promotional blocks may use softer rounded shapes, but keep rhythm consistent
- Circular elements are used for CTAs, badges, and decorative emphasis
- Thin white borders and soft shadows on imagery help it feel premium and polished

### Spacing rules

- Keep broad vertical rhythm between sections
- Default horizontal page padding: `px-6`
- Use container max widths around `max-w-7xl` for main layout
- Use generous gaps between text blocks and cards; do not crowd content

---

## 3. Homepage structure

The current homepage flow is a clean conversion sequence, in this order:

1. Navigation
2. Hero
3. Next-step CTA / reassurance section
4. Services / offering grid
5. Client trust row
6. Experience / value section
7. Editorial text block
8. About summary
9. FAQ
10. Calculators
11. Secondary calculator / lead-gen strip

This structure keeps the page focused on trust, clarity, and action rather than social proof-heavy sections.

### High-level homepage layout

```text
[nav: fixed, translucent, dark logo, gold CTA]
[hero: navy left panel + image right]
[next-steps: full-width soft card with SVG pattern]
[services: 3-column offering layout]
[clients: trust row]
[experience/value sections]
[textblock / about / faq]
[calculator blocks]
[footer]
```

---

## 4. Section-by-section visual layout

### 4.1 Navigation

- Fixed top navigation, clean and minimal
- Left: dark logo on transparent overlay background
- Right: nav links and a gold CTA button labeled “Contact us”
- Container max width: 1100px
- Background sits translucent over the hero and scrolls away smoothly on downward scroll
- No separate contact strip sits above the nav at the moment

Visual rules:

- text color: deep plum / dark charcoal
- hover state: soft gold accent
- CTA: gold background, white text, rounded-full
- nav stays lightweight so the hero headline remains dominant

### 4.2 Hero section

The hero is the brand-defining section.

Layout:

- large two-column grid on desktop
- left side: navy panel with white headline and white supporting text
- right side: large lifestyle image or property/aspirational photography
- no floating blob or circular CTA over the image

Recommended structure:

```html
<section class="hero-container">
  <nav>...</nav>
  <div class="hero-grid">
    <div class="hero-copy-panel">headline + body copy</div>
    <div class="hero-image-panel">image only</div>
  </div>
</section>
```

Key styles:

- left panel background: #233863
- headline: white, oversized, left-aligned, strong line height
- body text: soft white, readable and spacious
- image: full-bleed, `object-fit: cover`
- no circular CTA overlay in the hero image

Mobile behavior:

- stack vertically
- text above image
- keep imagery clean and uncluttered without extra overlays

### 4.3 Next-step CTA section

This section sits immediately after the hero and acts as a reassuring, conversion-focused moment.

Layout:

- full-width soft blue/neutral background
- central glass-like card with a subtle pattern overlay
- centered headline, paragraph, and CTA
- max width: 1110px

Content pattern:

- headline: plain-English, reassuring, easy to read
- body: simple language for the home buyer / everyday consumer
- CTA: a strong button linking to the contact page

Style rules:

- card uses a soft white translucent background with rounded corners
- pattern overlay uses a subtle SVG dot/grid accent
- button uses the gold brand CTA colour
- keeps the page feeling premium and calm rather than overly busy

### 4.4 Services section

This is the offering grid that explains what the business helps with.

Layout:

- 3-column card grid on large screens
- each card includes a short title, description, and click-through CTA
- text remains deep plum on neutral backgrounds
- clean spacing and clear hierarchy

Visual rules:

- product/service language should stay straightforward and understandable
- cards should feel polished but not overly decorative
- the section supports the conversion path without competing with the hero

### 4.5 Client trust / proof row

This is a simple trust section designed to reassure without becoming visually heavy.

Layout:

- horizontal list or muted logo tiles
- quiet presentation, generally neutral in colour
- minimal noise and lower visual weight than the hero or CTA blocks

### 4.6 Experience / narrative sections

These sections use editorial copy and supportive blocks to explain value in plain language.

Visual rules:

- calm spacing
- dark plum text on light backgrounds
- strong but readable headings
- keep the tone confident, helpful, and not overly corporate

### 4.7 FAQ and calculators

These lower-page sections are functional and conversion-oriented.

Rules:

- maintain the same overall palette and spacing rhythm
- use direct, user-centered language
- keep calculator panels visually clean and easy to scan

### Temporary status: team section hidden

The team section is currently hidden from the homepage while the site is being simplified around the trust-and-conversion flow.

This is intentional and should be treated as a temporary layout decision rather than a permanent structure.

---

## 5. Copy centralization rule

All site copy must be stored in `_data/sitetext.yml` and referenced by the templates and includes.

This is a hard requirement for maintainability and consistency.

### Why this matters

- content can be edited without touching layout HTML
- visual structure remains stable during copy changes
- agents can update content without breaking component styling
- the site keeps a single source of truth for text and campaign updates

### Required pattern

Use values from `site.data.sitetext` inside layout includes, for example:

```yaml
hero:
  headline: "Own Your Dream"
  body1: "Take ownership of your future through property."
  button: "Get Started"

intro:
  title: "Secure the best bond deals."
  body: "Mzansi Bonds empowers..."
```

Then in HTML:

```liquid
<h1>{{ site.data.sitetext.hero.headline }}</h1>
<p>{{ site.data.sitetext.hero.body1 }}</p>
```

### Do not do this

- do not hardcode marketing copy directly into component templates
- do not duplicate headline text across several files
- do not let visual styles determine wording in separate places

The visual structure should remain stable while the content changes in one YAML file.

---

## 6. Styling principles for future implementation

### Keep layouts simple and consistent

- one main column grid system
- moderate spacing
- consistent card radii
- predictable section ordering

### Preserve the brand tone

- warm but premium
- encouraging and reassuring
- not overly corporate or cold

### Keep copy central, design durable

- build structure around data-driven content
- style components using tokens, not hard-coded inconsistent values
- reuse the same colour palette and spacing system across sections

### Prefer component reuse

The homepage should be assembled from reusable building blocks rather than custom one-off layouts.

Examples:

- hero block
- intro block
- two-column text/image block
- logo strip
- promotional card grid

---

## 7. Implementation checklist for a coding agent

When recreating or updating this site visually, confirm all of the following:

1. Page background uses a warm cream/off-white tone.
2. Typography uses the Outfit font family and strong heading hierarchy.
3. Primary brand accents are orange, deep plum, and mint/teal.
4. Navigation sits cleanly at the top and maintains brand contrast.
5. Hero uses a split layout with text + image and floating orange CTA.
6. Copy is pulled from `_data/sitetext.yml`, not embedded in page templates.
7. All main sections maintain generous spacing and soft rounded corners.
8. Buttons and links use high contrast and clear conversion emphasis.
9. Sections alternate image/text blocks while keeping the same visual language.
10. Content ordering follows the homepage narrative: brand → value → trust → conversion.

---

## 8. Visual reference summary

The site should look like:

- premium financial services landing page
- aspirational but trustworthy
- warm and approachable
- structured and conversion-focused
- minimal clutter, generous whitespace, strong CTAs

It should never feel overly busy, dark, or generic. The layout should feel polished, editorial, and easy to scan.

---

## 9. Production note

When implementing a new section, first define the content in `_data/sitetext.yml`, then build the structure in the corresponding include or layout file, and finally apply the styling tokens from this document.

That keeps the visual system stable and the copy centralized, which is the core design principle of this project.
