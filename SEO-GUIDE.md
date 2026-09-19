# SEO Guide for Static Sites like This

## 1. Metadata and Titles
- Use a unique `title` and `description` for every page.
- Keep titles around 50–60 characters and include the main keyword near the front.
- Keep meta descriptions around 120–160 characters and make them actionable.
- Do not use `meta name="title"`; only use `<title>` and `meta name="description"`.
- Prefer a page title pattern like `Page Name | Site Name`.

## 2. Canonical and URL Best Practices
- Set `site.url` in config to the absolute site origin (e.g. `https://www.example.com`).
- Use `site.baseurl` only for path prefixes if the site is served from a subdirectory.
- Generate canonical URLs in templates with absolute values: `{{ site.url }}{{ page.url | replace:'index.html','' }}`.
- Ensure `og:url` and `twitter:url` also use absolute URLs.

## 3. Social and Open Graph Meta Tags
- Always provide:
  - `og:title`
  - `og:description`
  - `og:url`
  - `og:image`
  - `twitter:card`
  - `twitter:title`
  - `twitter:description`
  - `twitter:image`
- Use the same descriptive copy as your page SEO metadata.
- Use absolute image URLs for social previews.

## 4. Structured Data
- Add JSON-LD for key entities like LocalBusiness, FinancialService, or Organization.
- Keep schema simple and accurate.
- Example fields:
  - `@type`
  - `name`
  - `url`
  - `logo`
  - `telephone`
  - `email`
  - `address`
  - `description`

## 5. Page Content and Heading Structure
- Each page should have one clear `h1`.
- Use `h2` / `h3` semantically to organize sections.
- Avoid duplicate or generic headings across pages.
- Make sure the `h1` reflects the page’s main topic.

## 6. Accessibility and Images
- Every image should have a meaningful `alt` attribute.
- Decorative images can use empty `alt=""`, but content images should describe the image.
- For logos, use a concise brand name instead of full marketing copy.
- Check that all `img` tags include `loading="lazy"` when appropriate.

## 7. Technical SEO Files
- Add `robots.txt` so crawlers can discover your sitemap.
- Add `sitemap.xml` with all indexable pages.
- Include `Host:` and `Sitemap:` directives in `robots.txt`.
- If you need localized content, add `hreflang` tags.

## 8. Performance and Mobile SEO
- Use responsive design and `viewport` metadata.
- Minimize render-blocking CSS and JavaScript.
- Serve images at appropriate sizes and use compressed formats.
- Use `rel="preconnect"` only for essential third-party origins.

## 9. Future Agent Guidance
- When coding agents for SEO tasks, have them:
  1. Check templates for page-specific `title`, `description`, `og:*`, and `twitter:*`.
  2. Verify `site.url` is absolute and `site.baseurl` is consistent.
  3. Generate canonical links with absolute URLs.
  4. Add `robots` and `sitemap` support if missing.
  5. Validate `alt` attributes on all image tags.
  6. Validate the HTML `lang` attribute and document structure.
  7. Apply schema markup to the global head.

## 10. Quick Checklist for Future Edits
- [ ] Page has unique `title`
- [ ] Page has unique `meta description`
- [ ] `og:title` and `og:description` match page metadata
- [ ] Absolute `canonical` URL is present
- [ ] Social preview image URL is absolute
- [ ] `robots.txt` and `sitemap.xml` exist
- [ ] All content images have descriptive `alt`
- [ ] Page uses one `h1`
- [ ] HTML includes `lang="en"` or appropriate language code
- [ ] JSON-LD schema is present for the brand or business
