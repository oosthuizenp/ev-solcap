$(function () {
    // Smooth scrolling for navigation links
    $('a.js-scroll-trigger[href*="#"]:not([href="#"])').on("click", function () {
        if (location.pathname.replace(/^\//, "") == this.pathname.replace(/^\//, "") && location.hostname == this.hostname) {
            var a = $(this.hash);
            if ((a = a.length ? a : $("[name=" + this.hash.slice(1) + "]")).length) return $("html, body").animate({
                scrollTop: a.offset().top - 54
            }, 1000, "easeInOutExpo"), false;
        }
    });

    // Collapse navbar when link is clicked
    $(".js-scroll-trigger").on("click", function () {
        $(".navbar-collapse").collapse("hide");
    });

    // Activate scrollspy
    $("body").scrollspy({
        target: "#mainNav",
        offset: 56
    });

    // Navbar shrink on scroll and hide when moving down
    var lastScrollTop = 0;
    $(window).on("scroll", function () {
        var currentScrollTop = $(window).scrollTop();

        if (currentScrollTop > 80) {
            $("#mainNav").addClass("navbar-shrink");
        } else {
            $("#mainNav").removeClass("navbar-shrink");
        }

        if (currentScrollTop > lastScrollTop && currentScrollTop > 120) {
            $("#mainNav").addClass("nav-hidden");
        } else {
            $("#mainNav").removeClass("nav-hidden");
        }

        lastScrollTop = currentScrollTop;
    });

    // Back to Top Button Logic
    var backToTop = $("#back-to-top"),
        progressCircle = $(".progress-ring__circle"),
        radius = progressCircle.attr("r"),
        circumference = 2 * Math.PI * radius;

    progressCircle.css({
        strokeDasharray: circumference,
        strokeDashoffset: circumference
    });

    function updateProgress() {
        var scrollTop = $(window).scrollTop(),
            docHeight = $(document).height() - $(window).height(),
            progress = scrollTop / docHeight,
            dashOffset = circumference * (1 - progress);

        progressCircle.css("stroke-dashoffset", dashOffset);
    }

    function toggleBackToTop() {
        if ($(window).scrollTop() > $(document).height() * 0.3) {
            backToTop.fadeIn();
        } else {
            backToTop.fadeOut();
        }
    }

    $(window).on("scroll", function () {
        toggleBackToTop();
        updateProgress();
    });

    backToTop.on("click", function () {
        $("html, body").animate({ scrollTop: 0 }, 800, "easeInOutExpo");
    });

    // Keep the mobile calculator carousel anchored to the first card by default.
    function resetCalculatorScroll() {
        if (window.matchMedia("(max-width: 768px)").matches) {
            $(".calculators-grid").each(function () {
                this.scrollLeft = 0;
            });
        }
    }

    // Fix footer position on short pages
    function fixPageShort() {
        if (window.innerHeight > document.body.offsetHeight) {
            var footer = document.getElementById("footer");
            if (footer) {
                footer.style.position = "fixed";
                footer.style.bottom = "0";
                footer.style.left = "0";
                footer.style.right = "0";
                footer.style.width = "100%";
            }
        }
    }
    $(window).on("load resize", function () {
        fixPageShort();
        resetCalculatorScroll();
    });
    resetCalculatorScroll();

});
