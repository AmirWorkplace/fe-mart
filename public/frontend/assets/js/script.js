$(document).ready(function () {
    var d = $(this);

    /*----------------------------------------*/
    /*  Carousel Function
    /*----------------------------------------*/
    function carousel() {
        $(".carousel").not(".slick-initialized").each(function () {
            var $this = $(this);

            var slidesPerViewXs = $this.data("xs-items");
            var slidesPerViewSm = $this.data("sm-items");
            var slidesPerViewMd = $this.data("md-items");
            var slidesPerViewLg = $this.data("lg-items");
            var slidesPerViewXl = $this.data("xl-items");
            var slidesPerView = $this.data("items");

            var slidesCenterMode = $this.data("center");
            var slidesArrows = $this.data("arrows");
            var slidesDots = $this.data("dots");
            var slidesRows = $this.data("rows");
            var slidesAutoplay = $this.data("autoplay");
            var slidesFade = $this.data("fade");
            var asNavFor = $this.data("nav-for");
            var infinite = $this.data("infinite");
            var focusOnSelect = $this.data("focus-select");
            var adaptiveHeight = $this.data("auto-height");
            var centerPadding = $this.data("center-padding");


            var vertical = $this.data("vertical");
            var verticalXs = $this.data("vertical-xs");
            var verticalSm = $this.data("vertical-sm");
            var verticalMd = $this.data("vertical-md");
            var verticalLg = $this.data("vertical-lg");
            var verticalXl = $this.data("vertical-xl");

            var timeout = $this.data("timeout");
            timeout = !timeout ? 3000 : timeout;

            var rows = $this.data("rows");
            rows = !rows ? 1 : rows;

            var slidescroll = $this.data("slidescroll");
            slidescroll = !slidescroll ? 1 : slidescroll;

            slidesPerView = !slidesPerView ? 1 : slidesPerView;
            slidesPerViewXl = !slidesPerViewXl ? slidesPerView : slidesPerViewXl;
            slidesPerViewLg = !slidesPerViewLg ? slidesPerViewXl : slidesPerViewLg;
            slidesPerViewMd = !slidesPerViewMd ? slidesPerViewLg : slidesPerViewMd;
            slidesPerViewSm = !slidesPerViewSm ? slidesPerViewMd : slidesPerViewSm;
            slidesPerViewXs = !slidesPerViewXs ? slidesPerViewSm : slidesPerViewXs;


            vertical = !vertical ? false : vertical;
            verticalXl = (typeof verticalXl == 'undefined') ? vertical : verticalXl;
            verticalLg = (typeof verticalLg == 'undefined') ? verticalXl : verticalLg;
            verticalMd = (typeof verticalMd == 'undefined') ? verticalLg : verticalMd;
            verticalSm = (typeof verticalSm == 'undefined') ? verticalMd : verticalSm;
            verticalXs = (typeof verticalXs == 'undefined') ? verticalSm : verticalXs;


            slidesCenterMode = !slidesCenterMode ? false : slidesCenterMode;
            slidesArrows = !slidesArrows ? false : slidesArrows;
            slidesDots = !slidesDots ? false : slidesDots;
            slidesRows = !slidesRows ? 1 : slidesRows;
            slidesAutoplay = !slidesAutoplay ? false : slidesAutoplay;
            slidesFade = !slidesFade ? false : slidesFade;
            asNavFor = !asNavFor ? null : asNavFor;
            infinite = !infinite ? false : infinite;
            focusOnSelect = !focusOnSelect ? false : focusOnSelect;
            adaptiveHeight = !adaptiveHeight ? false : adaptiveHeight;


            var slidesRtl = ($("html").attr("dir") === "rtl" && !vertical) ? true : false;
            var slidesRtlXL = ($("html").attr("dir") === "rtl" && !verticalXl) ? true : false;
            var slidesRtlLg = ($("html").attr("dir") === "rtl" && !verticalLg) ? true : false;
            var slidesRtlMd = ($("html").attr("dir") === "rtl" && !verticalMd) ? true : false;
            var slidesRtlSm = ($("html").attr("dir") === "rtl" && !verticalSm) ? true : false;
            var slidesRtlXs = ($("html").attr("dir") === "rtl" && !verticalXs) ? true : false;

            $this.slick({
                slidesToShow: slidesPerView,
                autoplay: slidesAutoplay,
                dots: slidesDots,
                arrows: slidesArrows,
                infinite: infinite,
                vertical: vertical,
                rtl: slidesRtl,
                rows: slidesRows,
                centerPadding: centerPadding,
                centerMode: slidesCenterMode,
                fade: slidesFade,
                asNavFor: asNavFor,
                focusOnSelect: focusOnSelect,
                adaptiveHeight: adaptiveHeight,
                slidesToScroll: slidescroll,
                autoplaySpeed: timeout,
                rows: rows,
                prevArrow: '<button type="button" class="slick-prev"><i class="fas fa-chevron-left"></i></button>',
                nextArrow: '<button type="button" class="slick-next"><i class="fas fa-chevron-right"></i></button>',
                responsive: [{
                        breakpoint: 1300,
                        settings: {
                            slidesToShow: slidesPerViewXl,
                            vertical: verticalXl,
                            rtl: slidesRtlXL,
                        },
                    },
                    {
                        breakpoint: 992,
                        settings: {
                            slidesToShow: slidesPerViewLg,
                            vertical: verticalLg,
                            rtl: slidesRtlLg,
                        },
                    },
                    {
                        breakpoint: 768,
                        settings: {
                            slidesToShow: slidesPerViewMd,
                            vertical: verticalMd,
                            rtl: slidesRtlMd,
                        },
                    },
                    {
                        breakpoint: 576,
                        settings: {
                            slidesToShow: slidesPerViewSm,
                            vertical: verticalSm,
                            rtl: slidesRtlSm,
                        },
                    },
                    {
                        breakpoint: 480,
                        settings: {
                            slidesToShow: slidesPerViewXs,
                            vertical: verticalXs,
                            rtl: slidesRtlXs,
                        },
                    },
                ],
            });
        });
    }
    carousel();
    /*----------------------------------------*/
    /*  Carousel Function
    /*----------------------------------------*/


    /*----------------------------------------*/
    /*  Sticky Header & Scroll to top
    /*----------------------------------------*/
    function scrollToTop() {
        var $scrollUp = $('.scrollToTop'),
            $lastScrollTop = 0,
            $window = $(window);

        $window.on('scroll', function () {
            var st = $(this).scrollTop();
            if (st > $lastScrollTop) {
                $scrollUp.removeClass('show');
                $(".header").addClass("sticky");
            } else {
                if ($window.scrollTop() > 200) {
                    $scrollUp.addClass('show');
                    $(".header").removeClass("sticky");
                    $(".mobile-header").addClass("un_sticky");
                } else {
                    $scrollUp.removeClass('show');
                    $(".header").removeClass("sticky");
                    $(".mobile-header").removeClass("un_sticky");
                }
            }
            $lastScrollTop = st;
        });

        $scrollUp.on('click', function (evt) {
            $('html, body').animate({
                scrollTop: 0
            }, 100);
            evt.preventDefault();
        });
    }
    scrollToTop();
    /*----------------------------------------*/
    /*  Sticky Header & Scroll to top
    /*----------------------------------------*/


    /*----------------------------------------*/
    /*  Mobile Menu Fixer
    /*----------------------------------------*/
    $(document).on('click', '.toggle-nav, .mobile-cateogry__toggler', function (e) {
        e.preventDefault();
        $(this).toggleClass('active');
        $('.verticalmenu-content, .verticalmenu-overlay').toggleClass('show');
        $('body').toggleClass('open_menu');
    });
    
    $(document).on('click', '.verticalmenu-overlay', function (e) {
        $(this).removeClass('show');
        $('body').removeClass('open_menu');
        $('.verticalmenu-content').toggleClass('show');
        $('.dropdown-submenu,.dropdown-megamenu').slideUp('fast');
    });

    $(document).on('click', '.toggle-group-account', function (e) {
        e.preventDefault();
        $(this).toggleClass('active');
        $('.account-list-content').toggleClass('show');
    });
    $(document).mouseup(function (e) {
        var container = $(".account-list-content");
        var container2 = $(".toggle-group-account");
        if (!container2.is(e.target) && !container.is(e.target) && container.has(e.target).length === 0) {
            container.removeClass('show');
            if(container2.hasClass('active')){
                container2.removeClass('active');
            }
        }
    });

    $(document).on('click', '.show-sub', function (e) {
        $(this).closest('li').find('> div').slideToggle('fast');
        $('.carousel').slick('setPosition');
    });

    $(document).on('click', '.opener', function (e) {
        $(this).closest('li').find('> .mobile-nav__list').slideToggle('fast');
    });
    
    $(document).on('click', '.mobile-menu__toggler', function (e) {
        $('body').css('overflow', 'hidden');
        $('.mobile-main_menu').addClass('show');
    });
    
    $(document).on('click', '.mobile-menu__close', function (e) {
        $('body').css('overflow', 'auto');
        $('.mobile-main_menu').removeClass('show');
    });
    /*----------------------------------------*/
    /*  Mobile Menu Fixer    
    /*----------------------------------------*/


    /*----------------------------------------*/
    /*  Stick Menu
    /*----------------------------------------*/
    function Sticky_Menu() {
        var time;

        var height = $('.header').height();
        var a = 90;
        $(window).scroll(function () {
            if (time) clearTimeout(time);
            time = setTimeout(function () {
                var current_position = $(window).scrollTop();
                if (current_position > a) {
                    a = current_position;
                    $('.desktop-menu').removeClass('desktop-menu--fixed');
                } else {
                    $('.desktop-menu').addClass('desktop-menu--fixed');
                    a = current_position;
                }
                if (current_position <= 90) {
                    $('.desktop-menu').removeClass('desktop-menu--fixed');
                }
            }, 50);
        });
    }
    /*----------------------------------------*/
    /*  Stick Menu
    /*----------------------------------------*/

    /*----------------------------------------*/
    /*  Select2 Initialize
    /*----------------------------------------*/

    if ($('.select').length) {
        var placeholder = $(this).data('placeholder');
        placeholder = !placeholder ? "choose" : placeholder;

        $('.select').select2({
            placeholder: placeholder,
        });
    }

    /*----------------------------------------*/
    /*  Select2 Initialize
    /*----------------------------------------*/

    function LoadingSite() {
        $('#page-preloader').delay(1000).fadeOut();
    }

    $(window).on('load resize', function () {
        LoadingSite();
        Sticky_Menu();
    });
});