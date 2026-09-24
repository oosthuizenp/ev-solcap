# 3-Col-Engagement Section Design

This document locks in the finalized structural layout and aesthetic positioning for the `_includes/3-col-engagement.html` section.

## Finalized HTML Structure

```html
<section class="max-w-4xl mx-auto text-center px-6 mt-24 mb-20">
  <h2 class="text-5xl font-extrabold text-mzansi-purple mb-12 translate-y-[90px]">{{ site.data.sitetext.engagement.heading }}</h2>
  <div class="relative py-16">
    <div class="absolute inset-0 flex items-center justify-center -z-10">
      <!-- Massive Orange Circle Background -->
      <div class="w-[600px] h-[600px] bg-mzansi-orange rounded-full opacity-90 translate-y-[50px]"></div>
    </div>
    <p class="text-3xl text-white font-semibold max-w-md mx-auto relative z-10 translate-y-[50px]">{{ site.data.sitetext.engagement.copy }}</p>
  </div>
</section>
```

## Relatives vs Hardcoded Dimensions

We used a **hybrid approach** on this page to guarantee it stays perfectly responsive while maintaining exact pixel-perfect visual alignments:

### 1. Relative Classes (Used for Structural Flow)
The overarching footprint of the section is entirely dictated by responsive relative classes. 
- `max-w-4xl`, `w-full`, `max-w-md`: These define dynamic bounds ensuring the elements flexibly shrink down on mobile devices.
- `mx-auto`, `inset-0`: General responsive centering properties.
- `mt-24`, `mb-20`, `py-16`: Standard Tailwind relative spacing scale margins/padding meant to provide document flow clearance.

### 2. Hardcoded Pixels (Used strictly for Aesthetic Positioning)
We relied on strict arbitrary JIT values to forcefully tweak elements without breaking the overall document flow calculated by the layout engine above.
- **Circle Dimensions**: `w-[600px] h-[600px]`. This physically enforces a perfectly round circle rather than warping based on content width.
- **Visual Adjustments (Transforms)**: `translate-y-[90px]` and `translate-y-[50px]`. These offset elements *after* they are structurally rendered, giving pixel-perfect spacing and overlapping effects without destroying the flow physics for other relative elements around them.
