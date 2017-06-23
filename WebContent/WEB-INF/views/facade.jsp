<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
    	String path = request.getContextPath();
    %>
<!DOCTYPE HTML>
<html>
<head>
	<title>宏图办公系统</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <link href='http://fonts.googleapis.com/css?family=Fugaz+One' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen"/>
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="js/responsiveslides.min.js"></script>
    <script>
        $(function () {
            $("#slider").responsiveSlides({
                auto: true,
                nav: true,
                speed: 500,
                namespace: "callbacks",
                pager: true,
            });
        });
    </script>
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1200);
            });
        });
    </script>
</head>
<body>
<div class="header" id="home">
    <div class="header-top">
        <div class="container">
            <div class="icon">
                <ul>
                    <li><i class="message"></i></li>
                    <li><a href="mailto:example@mail.com">Info@Seen.com</a></li>
                    <li><i class="phone"></i></li>
                    <li><p>+00(123)4567890</p></li>
                </ul>
            </div>
            <div class="social-icons">
                <a href="#"><i class="icon1"></i></a>
                <a href="#"><i class="icon2"></i></a>
                <a href="#"><i class="icon3"></i></a>
                <a href="#"><i class="icon4"></i></a>
                <a href="#"><i class="icon5"></i></a>
                <a href="#"><i class="icon6"></i></a>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="container">
        <div class="header-bottom">
            <div class="logo">
                <img src="images/logo.png" height="51px" width="199px"/>
            </div>
            <div class="top-menu">
                <span class="menu"><img src="images/nav-icon.png" alt=""/></span>
                <ul>
                    <nav class="cl-effect-5">
                        <li><a href="javascript:;" class="active"><span data-hover="首页">首页</span></a></li>
                        <li><a href="javascript:;"><span data-hover="公告">公告</span></a></li>
                        <li><a href="<%=path%>/emp/loginPage"><span data-hover="员工登录">员工登录</span></a></li>
                        <li><a href="<%=path%>/stu/loginPage"><span data-hover="学生登录">学生登录</span></a></li>
                    </nav>
                </ul>
                <div class="clearfix"></div>
            </div>
            <!--script-nav-->
            <script>
                $("span.menu").click(function () {
                    $(".top-menu ul").slideToggle("slow", function () {
                    });
                });
            </script>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- header-section-ends -->
<div class="header-slider">
    <div class="slider">
        <div class="callbacks_container">
            <ul class="rslides" id="slider">
                <li>
                    <img src="images/banner.jpg" alt="">
                    <div class="caption">
                        <h3>GRAPHIC WEB DESIGNER</h3>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has
                            been the industry's standard dummy text ever since the 1500s, when an unknowns.</p>

                    </div>
                </li>
                <li>
                    <img src="images/banner1.jpg" alt="">
                    <div class="caption">
                        <h3>Made GRAPHIC DESIGNER</h3>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has
                            been the industry's standard dummy text ever since the 1500s, when an unknowns.</p>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
</div>
<div class="beautifull">
    <div class="container">
        <div class="beautifull-header">
            <h4>Lorem ipsum dolor sit amet.</h4>
            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the
                industry's standard dummy text ever since the 1500s, when an unknowns.Android, it doesn't matter. Your
                content will always looks its absolute.</p>
        </div>
        <div class="beautifull-grids">
            <div class="col-md-4 beautiful-grid">
                <div class="icon1">
                    <i class="heart"></i>
                </div>
                <div class="passion">
                    <h4>Passion</h4>
                    <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur
                        magni dolores eos qui ratione voluptatem sequi nesciunt posae volor rem modis volor.</p>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-4 beautiful-grid">
                <div class="icon1">
                    <i class="lamp"></i>
                </div>
                <div class="passion">
                    <h4>Creativity</h4>
                    <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur
                        magni dolores eos qui ratione voluptatem sequi nesciunt posae volor rem modis volor.</p>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="col-md-4 beautiful-grid">
                <div class="icon1">
                    <i class="star"></i>
                </div>
                <div class="passion">
                    <h4>Quality</h4>
                    <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur
                        magni dolores eos qui ratione voluptatem sequi nesciunt posae volor rem modis volor.</p>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<div class="checkout-section">
    <div class="container">
        <div class="checkout-header">
            <h4>Latest Works</h4>
            <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugites.</p>
        </div>
        <div id="portfoliolist">
            <div class="portfolio">
                <div class="portfolio-wrapper">
                    <a href="#small-dialog" class="b-link-stripe b-animate-go  thickbox play-icon popup-with-zoom-anim">
                        <img class="work-img" src="images/pic1.jpg" alt=""/>
                        <div class="b-wrapper"><h2 class="b-animate b-from-left    b-delay03 "><img
                                src="images/icon-eye.png" alt=""/></h2>
                        </div>
                    </a>
                </div>
                <div class="bottom-header">
                    <h5>The system and expound the actual</h5>
                    <p>Identity</p>
                </div>
            </div>
            <div class="portfolio">
                <div class="portfolio-wrapper">
                    <a href="#small-dialog1"
                       class="b-link-stripe b-animate-go  thickbox play-icon popup-with-zoom-anim">
                        <img class="work-img" src="images/pic2.jpg" alt=""/>
                        <div class="b-wrapper"><h2 class="b-animate b-from-left    b-delay03 "><img
                                src="images/icon-eye.png" alt=""/></h2>
                        </div>
                    </a>
                </div>
                <div class="bottom-header">
                    <h5>The system and expound the actual</h5>
                    <p>Identity</p>
                </div>
            </div>

            <div class="clearfix"></div>
        </div>


        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1200);
                });
            });
        </script>
        <!-- Script for gallery Here -->
        <script type="text/javascript" src="js/jquery.mixitup.min.js"></script>
        <script type="text/javascript">
            $(function () {

                var filterList = {

                    init: function () {

                        // MixItUp plugin
                        // http://mixitup.io
                        $('#portfoliolist').mixitup({
                            targetSelector: '.portfolio',
                            filterSelector: '.filter',
                            effects: ['fade'],
                            easing: 'snap',
                            // call the hover effect
                            onMixEnd: filterList.hoverEffect()
                        });

                    },

                    hoverEffect: function () {

                        // Simple parallax effect
                        $('#portfoliolist .portfolio').hover(
                            function () {
                                $(this).find('.label').stop().animate({bottom: 0}, 200, 'easeOutQuad');
                                $(this).find('img').stop().animate({top: -30}, 500, 'easeOutQuad');
                            },
                            function () {
                                $(this).find('.label').stop().animate({bottom: -40}, 200, 'easeInQuad');
                                $(this).find('img').stop().animate({top: 0}, 300, 'easeOutQuad');
                            }
                        );

                    }

                };

                // Run the show!
                filterList.init();


            });
        </script>
        <!-- Gallery Script Ends -->
        <!-- pop-up-box -->
        <script type="text/javascript" src="js/modernizr.custom.min.js"></script>
        <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
        <script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
        <!-- //pop-up-box -->
        <div id="small-dialog" class="mfp-hide">
            <div class="image-top">
                <img src="images/pic1.jpg" alt=""/>
            </div>
        </div>
        <div id="small-dialog1" class="mfp-hide">
            <div class="image-top">
                <img src="images/pic2.jpg" alt=""/>
            </div>
        </div>

        <script>
            $(document).ready(function () {
                $('.popup-with-zoom-anim').magnificPopup({
                    type: 'inline',
                    fixedContentPos: false,
                    fixedBgPos: true,
                    overflowY: 'auto',
                    closeBtnInside: true,
                    preloader: false,
                    midClick: true,
                    removalDelay: 300,
                    mainClass: 'my-mfp-zoom-in'
                });

            });
        </script>
        <div class="screen-shots">
            <!--sreen-gallery-cursual-->
            <div class="sreen-gallery-cursual">
                <!-- start content_slider -->
                <div id="owl-demo" class="owl-carousel">
                    <div class="item">
                        <div class="item-grid">
                            <div class="item-pic">
                                <img src="images/pic3.jpg"/>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-grid">
                            <div class="item-pic">
                                <img src="images/pic4.jpg"/>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-grid">
                            <div class="item-pic">
                                <img src="images/pic5.jpg"/>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-grid">
                            <div class="item-pic">
                                <img src="images/pic6.jpg"/>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-grid">
                            <div class="item-pic">
                                <img src="images/pic3.jpg"/>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-grid">
                            <div class="item-pic">
                                <img src="images/pic4.jpg"/>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-grid">
                            <div class="item-pic">
                                <img src="images/pic5.jpg"/>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-grid">
                            <div class="item-pic">
                                <img src="images/pic6.jpg"/>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-grid">
                            <div class="item-pic">
                                <img src="images/pic3.jpg"/>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-grid">
                            <div class="item-pic">
                                <img src="images/pic4.jpg"/>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-grid">
                            <div class="item-pic">
                                <img src="images/pic5.jpg"/>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-grid">
                            <div class="item-pic">
                                <img src="images/pic6.jpg"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <link href="css/owl.carousel.css" rel="stylesheet">
        <script src="js/owl.carousel.js"></script>
        <script>
            $(document).ready(function () {
                $("#owl-demo").owlCarousel({
                    items: 4,
                    lazyLoad: true,
                    autoPlay: true,
                    navigation: false,
                    navigationText: false,
                    pagination: true,
                });
            });
        </script>
        <!-- //requried-jsfiles-for owl -->

    </div>
</div>
</body>
</html>