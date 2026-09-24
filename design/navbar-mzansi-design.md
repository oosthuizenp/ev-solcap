# Navbar Mzansi Design

This file captures the navbar direction for the homepage and should be used as the visual target for future refinements.

## Goal

The homepage navbar should feel premium, light, and transparent, with a strong conversion-focused CTA while keeping the layout clean and editorial.

## Layout

- full-width, fixed top nav
- content sits inside a centered max width container of 1100px
- left aligned brand/logo block
- right side: navigation links plus a filled gold CTA button labeled “Contact us”
- navbar sits directly over the hero and is intentionally clean, without a separate top contact strip
- no extra header band above the nav

## Visual system

- background: transparent/translucent warm off-white, approximately rgba(247, 243, 238, 0.38)
- border: very light plum/transparent divider only
- logo: dark text version on transparent background using the asset
  - assets/img/logo/bg-rem-dark-text.png
- nav links: deep plum text with subtle hover state
- CTA: gold fill, white text, rounded pill, soft shadow
- page background remains a calmer, less yellow neutral than the earlier cream treatment

## Behavior

- initial state: highly transparent and lightweight
- scroll state: slight background fill and subtle shadow, but still airy
- scroll down: navbar slides upward and disappears to keep focus on content
- scroll up: navbar reappears smoothly
- the contact strip is intentionally hidden for now to preserve the clean Mzansi aesthetic

## Updated implementation notes

- the top contact-strip include was removed from the page and home layouts
- the navbar is fixed and overlay-style rather than occupying a separate stacked bar
- the body background was softened to reduce the yellow cast
- the support panel colour was shifted back to a cooler blue instead of mint-green
- the primary CTA buttons were reverted to the original gold tone

## Structure

```html
<nav class="navbar" id="mainNav">
  <div class="container">
    <a class="navbar-brand" href="/">
      <img src="/assets/img/logo/bg-rem-dark-text.png" alt="Brand logo" />
    </a>

    <div class="navbar-collapse">
      <ul class="navbar-nav">
        <li><a class="nav-link" href="#">Home</a></li>
        <li><a class="nav-link" href="#">About</a></li>
        <li><a class="nav-link" href="#">Calculators</a></li>
        <li><a class="nav-link" href="#">Blog</a></li>
      </ul>
      <a class="nav-cta" href="/contact/">Contact us</a>
    </div>
  </div>
</nav>
```

## Styling notes

- max width: 1100px
- left-aligned logo remains dark on transparent nav
- CTA uses the golden/orange brand value, rounded-full
- keep the nav unobtrusive so the hero can dominate the initial screen
- maintain clean spacing and no heavy border on the default state
