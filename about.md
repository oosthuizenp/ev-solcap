---
layout: page
title: About Solomon Capital
description: Learn about Solomon Capital, a Durban-based bond origination team helping home buyers and homeowners compare lender options, understand affordability and make informed decisions.
background: gray
permalink: /about/
---

<section class="bg-light page-section py-5" id="about">
  <div class="container-custom">
    <div class="row">
      <div class="col-lg-12 text-center">
        <h1 class="section-heading">{{ site.data.sitetext.about.title | default: "About Us" }}</h1>
      </div>
    </div>
    
    <div class="row">
      <div class="col-lg-12">
        <div class="about-content text-center">
          <div class="large text-muted">{{ site.data.sitetext.about.text2 | markdownify }}</div>
          <div class="accent-text">
            {{ site.data.sitetext.about.text3 | markdownify }}
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
