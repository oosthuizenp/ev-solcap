# Contact Page — Coding Agent Briefing
 
## File Type
Use `.jsx` (React) or `.html` (plain HTML/CSS) — **not** `.mf`.
 
---
 
## Site Colours
 
| Token | Hex | Usage |
|---|---|---|
| `--dark-green` | `#1a4a3a` | Footer, Submit button |
| `--orange` | `#e8522a` | Logo, CTA buttons, asterisks |
| `--light-bg` | `#f0ede6` | Page background (cream/beige) |
| `--input-bg` | `#d6e8e0` | Form field fill (light mint) |
| `--text-dark` | `#2c2c2c` | Headings |
| `--text-body` | `#4a4a4a` | Paragraph text |
| `--card-purple` | `#5c2d4a` | "Get in touch" card background |
| `--card-text` | `#ffffff` | Text on purple card |
| `--border-radius` | `8px` | All inputs, buttons, cards |
 
---
 
## Page Structure
> Ignore nav (logo + hamburger) and footer.
 
```
┌─────────────────────────────┐
│   SECTION 1: HERO FORM      │
│   background = lg2.jpeg     │
├─────────────────────────────┤
│   SECTION 2: GET IN TOUCH   │
│   purple card + photo       │
└─────────────────────────────┘
```
 
---
 
## Section 1 — Hero Form Area
 
### Background
- File: `assets/img/sections/lg2.jpeg`
- Style: cover, centered, no-repeat
- Overlay: semi-transparent cream `rgba(240, 237, 230, 0.85)` so text stays readable
```css
.contact-hero {
  background-image: url('/assets/img/sections/lg2.jpeg');
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  position: relative;
}
.contact-hero::before {
  content: '';
  position: absolute;
  inset: 0;
  background: rgba(240, 237, 230, 0.85);
}
```
 
### Heading Block (centered)
- `<h1>` — **"Let's get you started"** — bold, dark green, large
- Subtext paragraph below — small body text, centered, `max-width: 600px`
 
---
 
### Form Fields
 
| Field | Type | Width |
|---|---|---|
| First Name * | text input | half |
| Last Name * | text input | half |
| Email Address * | email input | half |
| Phone Number * | tel input | half |
| Message | textarea | full width |
| Submit | button | auto (left aligned) |
 
**Desktop** — 2 columns side by side:
```
| First Name *      | Last Name *       |
| Email Address *   | Phone Number *    |
| Message (full width, textarea)        |
| [Submit]                              |
```
 
**Mobile** — 1 column stacked:
```
First Name *
Last Name *
Email Address *
Phone Number *
Message
[Submit]
```
 
### Field Styles
```css
input, textarea {
  background: var(--input-bg);
  border: none;
  border-radius: 8px;
  padding: 12px 16px;
  width: 100%;
  font-size: 0.95rem;
  color: var(--text-dark);
}
input::placeholder,
textarea::placeholder {
  color: #7aaa96;
}
textarea {
  min-height: 120px;
  resize: vertical;
}
```
 
### Submit Button
```css
.btn-submit {
  background: var(--dark-green);
  color: white;
  padding: 12px 32px;
  border: none;
  border-radius: 8px;
  font-weight: 600;
  cursor: pointer;
}
```
- Left aligned on both desktop and mobile
- NOT full width
 
---
 
## Section 2 — Get in Touch Card
 
### Desktop Layout — 2 columns inside dark purple card
```
┌────────────────────────────────────────────┐
│  LEFT COL (text)     │  RIGHT COL (photo)  │
│  "Get in touch"      │  Woman with headset │
│  Body paragraph      │  smiling — image    │
│  [Call me back]      │  fills right half   │
│  [Email us]          │                     │
└────────────────────────────────────────────┘
```
 
### Mobile Layout — photo becomes background, text overlays
```
┌──────────────────────┐
│ (photo as bg, dimmed)│
│ "Get in touch"       │
│  body text           │
│ [Call me back]       │
│ [Email us]           │
└──────────────────────┘
```
 
### Card Styles
```css
.get-in-touch-card {
  background: var(--card-purple);
  border-radius: 16px;
  overflow: hidden;
  display: grid;
  grid-template-columns: 1fr 1fr;
  color: white;
}
 
@media (max-width: 768px) {
  .get-in-touch-card {
    grid-template-columns: 1fr;
    position: relative;
  }
  .card-photo {
    position: absolute;
    inset: 0;
    opacity: 0.3;
    object-fit: cover;
  }
}
```
 
### CTA Buttons on Card
```css
.btn-call {
  background: transparent;
  border: 2px solid white;
  color: white;
  border-radius: 24px;
  padding: 10px 20px;
}
.btn-email {
  background: var(--orange);
  border: none;
  color: white;
  border-radius: 24px;
  padding: 10px 20px;
}
```
 
---
 
## Adaptive / Responsive Rules
 
| Element | Desktop | Mobile |
|---|---|---|
| Form fields | 2 columns | 1 column stacked |
| Get in touch card | 2 col (text + photo) | 1 col (photo as bg overlay) |
| H1 heading | ~48px | ~32px |
| Section padding | `60px 80px` | `32px 20px` |
 
```css
@media (max-width: 768px) {
  .form-grid   { grid-template-columns: 1fr; }
  .card-grid   { grid-template-columns: 1fr; }
  h1           { font-size: 2rem; }
  .section-pad { padding: 32px 20px; }
}
```
 
---
 
## Notes
- Background image path: `assets/img/sections/lg2.jpeg`
- All fields marked with `*` are required
- No nav or footer included in this component
- One breakpoint at `768px` handles all adaptive behaviour