# Jekyll Indexing Checkup Guide

Use this document as a general health check for Jekyll sites when Google Search Console reports indexing issues, or before deploying URL/SEO changes.

Common Search Console reasons this helps investigate:

- `Alternate page with proper canonical tag`
- `Page with redirect`
- `Crawled - currently not indexed`
- `URL is not on Google`
- Sitemap URLs discovered but not indexed

The goal is simple: every indexable page should have one preferred URL, one self-referential canonical, internal links that use the preferred URL, and a sitemap entry that matches.

## 1. Choose The Preferred URL Shape

Pick one official version of the site URL and use it everywhere.

Decide these three things:

- Protocol: usually `https`
- Host: either apex, like `https://example.com`, or `www`, like `https://www.example.com`
- Path style: usually clean trailing-slash URLs, like `/contact/`, for Jekyll sites

Avoid mixing these unless the redirects and canonicals are deliberate:

```text
http://example.com/
http://www.example.com/
https://www.example.com/
https://example.com/page.html
https://example.com/page
https://example.com/page/
```

For most Jekyll sites, prefer:

```text
https://example.com/page/
```

Then make all templates, links, robots, and sitemaps agree.

## 2. Confirm The Live Host

Before changing Jekyll files, check what the live site actually does.

Test these in a browser or with a redirect checker:

```text
https://example.com/
https://www.example.com/
http://example.com/
http://www.example.com/
```

Only one should be the final indexable destination. The others should redirect to it.

Example finding from this site:

```text
https://www.solomoncapital.co.za/
```

redirected to:

```text
https://solomoncapital.co.za/
```

That means the apex domain is the preferred host, so Jekyll config, canonicals, robots, and sitemap should use:

```text
https://solomoncapital.co.za
```

## 3. Check Jekyll Config

In `_config.yml`, `url` must match the final live origin.

Good:

```yml
url: https://example.com
baseurl: ""
```

Bad if the live site redirects to apex:

```yml
url: https://www.example.com
```

Bad if the site is not served from a subfolder:

```yml
url: https://example.com/some-folder
baseurl: /some-folder
```

Use `baseurl` only when the site is intentionally served from a path prefix.

## 4. Use One Canonical Helper In The Head

Check `_includes/head.html`.

Prefer computing the canonical once, then reusing it for canonical, Open Graph, and Twitter URL tags.

```liquid
{% assign canonical_url = page.url | replace:'index.html','' | absolute_url %}
{% assign social_image_url = '/social_916x509.jpg' | absolute_url %}

<meta property="og:url" content="{{ canonical_url }}">
<meta property="twitter:url" content="{{ canonical_url }}">
<meta property="og:image" content="{{ social_image_url }}">
<meta property="twitter:image" content="{{ social_image_url }}">
<link rel="canonical" href="{{ canonical_url }}">
```

This avoids subtle drift where canonical points to one URL and social tags point to another.

## 5. Normalize Clean URLs

If the site links to:

```text
/privacy-statement/
```

but Jekyll generates:

```text
/privacy-statement.html
```

choose one style. For clean trailing-slash URLs, add explicit permalinks to indexable pages:

```md
---
layout: page
title: Privacy Statement
description: Review how personal information is processed and protected.
permalink: /privacy-statement/
---
```

Then update all internal links to match:

```text
/privacy-statement/
```

Watch for links in:

- `_data/*.yml`
- `_includes/*.html`
- Markdown page content
- Navigation and footer templates

## 6. Check Robots And Sitemap

`robots.txt` should point to the preferred sitemap URL.

Good:

```text
User-agent: *
Allow: /
Sitemap: https://example.com/sitemap.xml
Host: example.com
```

`sitemap.xml` should include only indexable preferred URLs.

Good:

```xml
<loc>https://example.com/</loc>
<loc>https://example.com/contact/</loc>
<loc>https://example.com/privacy-statement/</loc>
```

Avoid sitemap entries for alternate hosts or non-preferred paths:

```xml
<loc>https://www.example.com/contact/</loc>
<loc>https://example.com/contact.html</loc>
<loc>http://example.com/contact/</loc>
```

Do not include `404.html`, admin pages, draft pages, or intentionally `noindex` pages in the sitemap.

## 7. Build And Inspect Generated Output

Always verify the generated `_site` output, not only the source templates.

Run:

```powershell
bundle exec jekyll build --trace
```

Useful checks:

```powershell
Select-String -Path _site\index.html,_site\contact\index.html -Pattern 'canonical|og:url|twitter:url'
Get-Content _site\robots.txt
Get-Content _site\sitemap.xml
rg -n 'www\.example|example\.com/[^\s<]*\.html' _site
rg -n 'noindex' _site
```

Expected results:

- Indexable pages have `meta name="robots" content="index, follow"`.
- Indexable pages have self-referential canonical URLs.
- Canonicals, `og:url`, and `twitter:url` use the same preferred URL.
- The sitemap uses the preferred host and preferred path style.
- `404.html` may be `noindex, follow` and may keep a `.html` URL, but it should not be in the sitemap.

## 8. Interpret Common Search Console Reasons

### Alternate Page With Proper Canonical Tag

Google found a duplicate URL and chose another canonical.

Usually fine:

```text
https://www.example.com/page/
```

canonicalizes or redirects to:

```text
https://example.com/page/
```

Bad:

```text
https://example.com/page/
```

is the preferred URL, but its canonical points to:

```text
https://www.example.com/page/
```

Fix:

- Make preferred pages self-canonical.
- Redirect alternate hosts and path formats to the preferred URL.
- Update internal links and sitemap entries to preferred URLs.

### Page With Redirect

Google found a URL that redirects.

Usually fine:

```text
http://www.example.com/
```

redirects to:

```text
https://example.com/
```

Fix only if the preferred URL redirects unexpectedly or redirects to the wrong page.

### Crawled - Currently Not Indexed

Google crawled the page but has not indexed it.

Common causes:

- Thin content
- Duplicate content
- Mostly iframe content
- Low internal linking
- Recently discovered page
- Weak page title or meta description

Fix:

- Add unique, useful page content outside iframes.
- Make sure the page has one clear `h1`.
- Add internal links to the page.
- Ensure the canonical points to itself.
- Request indexing after deploy.

## 9. Per-Page Checklist

Use this for every important URL:

```text
[ ] Does the preferred URL load?
[ ] Does it return the final HTTPS URL?
[ ] Does it use the preferred apex/www host?
[ ] Does it use the preferred clean URL or .html style?
[ ] Does the canonical point to the final preferred URL?
[ ] Do og:url and twitter:url match the canonical?
[ ] Do internal links point to this preferred URL?
[ ] Is the page in the sitemap?
[ ] Is the page not blocked by robots or noindex?
[ ] Does the page have unique title and meta description?
[ ] Does the page have one clear h1?
[ ] Did Search Console last crawl it after deployment?
[ ] Did you run Test Live URL?
[ ] Did you request indexing?
```

## 10. Site-Wide Checkup Checklist

Run this before deploying indexing fixes:

```text
[ ] _config.yml site.url matches the live final host.
[ ] _config.yml baseurl is correct for the deployment path.
[ ] CNAME matches the preferred custom domain.
[ ] robots.txt Sitemap uses the preferred host.
[ ] robots.txt Host matches the preferred host, if used.
[ ] sitemap.xml includes only indexable preferred URLs.
[ ] sitemap.xml does not include .html URLs if clean URLs are preferred.
[ ] Indexable pages have explicit permalinks if clean URLs are preferred.
[ ] Navigation, footer, and data-file links use the preferred URL style.
[ ] Canonical, og:url, and twitter:url are generated from one canonical helper.
[ ] Social preview image URLs are absolute.
[ ] 404 page is noindex and not in the sitemap.
[ ] Jekyll build completes successfully.
[ ] Generated _site output was inspected.
```

## 11. Search Console After Deploy

Do this only after the fix is deployed.

1. Open **URL Inspection**.
2. Inspect the preferred URL, not an alternate URL.
3. Click **Test Live URL**.
4. Confirm Google says the page can be indexed.
5. Click **Request Indexing**.
6. Go back to the issue report.
7. Click **Validate Fix**.

If Search Console still shows old canonical data, check the last crawl date. If Google last crawled before the deployment, the report is stale.

## 12. What Not To Worry About

These are usually not problems:

- `http` URLs excluded because they redirect to `https`
- `www` URLs excluded because they redirect to non-`www`
- `.html` URLs excluded because clean URLs are canonical
- Old URLs appearing in reports for a while after a fix
- `404.html` being `noindex`

The important thing is that the final preferred URL is indexable and has a self-referential canonical.
