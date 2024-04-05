<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/jquery-ui.js" type="text/javascript"></script>
<link href="catalog/view/javascript/jquery/css/jquery-ui.css" rel="stylesheet" media="screen" />
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
 <link href="catalog/view/javascript/material-design-iconic-font/css/material-design-iconic-font.min.css" rel="stylesheet" type="text/css" />
    <!-- <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet" type="text/css"> -->
    <!-- <link href="https://fonts.googleapis.com/css?family=Josefin+Sans:400,400i,600,600i,700,700i" rel="stylesheet" type="text/css"> -->
    <script src="catalog/view/javascript/webfont.js" type="text/javascript"></script>
    <script>
        WebFont.load({
            custom: {
                families: ['Proxima-Nova'],
                urls : [
                    'catalog/view/javascript/font-awesome/css/font-awesome.min.css',
                    'catalog/view/theme/tt_presiden1/stylesheet/opentheme/fonts/custom-fonts.css'
                ]
            }
        });
    </script>
    <link href="catalog/view/theme/tt_presiden1/stylesheet/stylesheet.css" rel="stylesheet">
    <script src="catalog/view/javascript/opentheme/ocslideshow/jquery.nivo.slider.js" type="text/javascript"></script>
    <link href="catalog/view/theme/tt_presiden1/stylesheet/opentheme/ocslideshow/ocslideshow.css" rel="stylesheet" />
    <link href="catalog/view/theme/tt_presiden1/stylesheet/opentheme/css/animate.css" rel="stylesheet" />
    <script src="catalog/view/javascript/opentheme/hozmegamenu/custommenu.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/opentheme/hozmegamenu/mobile_menu.js" type="text/javascript"></script>
    <link href="catalog/view/theme/tt_presiden1/stylesheet/opentheme/hozmegamenu/css/custommenu.css" rel="stylesheet" />
    <link href="catalog/view/theme/tt_presiden1/stylesheet/opentheme/css/owl.carousel.css" rel="stylesheet" />
    <script src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/opentheme/ocquickview/ocquickview.js" type="text/javascript"></script>
    <link href="catalog/view/theme/tt_presiden1/stylesheet/opentheme/ocquickview/css/ocquickview.css" rel="stylesheet">
    <link href="catalog/view/theme/tt_presiden1/stylesheet/opentheme/oclayerednavigation/css/oclayerednavigation.css" rel="stylesheet">
    <script src="catalog/view/javascript/opentheme/oclayerednavigation/oclayerednavigation.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/jquery/elevatezoom/jquery.elevatezoom.js" type="text/javascript"></script>
    <?php foreach ($styles as $style) { ?>
    <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
    <?php } ?>
    <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
    <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
    <?php } ?>
    <?php foreach ($scripts as $script) { ?>
    <script src="<?php echo $script; ?>" type="text/javascript"></script>
    <?php } ?>
    <?php foreach ($analytics as $analytic) { ?>
    <?php echo $analytic; ?>
    <?php } ?>
    </head>
    <body class="<?php echo $class; ?>">
    <div class="loading ng-isolate-scope">
    <div class="loading-overlay"></div>
        <figure>
            <svg xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0 0 100 100" width="96.1" height="96.1">
                <path d="M79.8,44.8c5.9-1.6,11.4-3.1,17.3-4.8c-2.9-10.9-5.8-21.5-8.7-32.5c-10.7,2.9-20.9,5.7-31.2,8.3c-2.5,0.6-3.8,1.6-4.4,4.2
                        c-1.3,6-8.9,8.3-13.8,2.9c-0.8-0.8-2.6-1.3-3.7-1.1c-9.8,2.5-28.6,7.6-28.6,7.6s0,0-3.8,1.1c3,10.9,5.9,21.6,8.8,32.3
                        c6.2-1.6,11.6-3,17.4-4.5l9.3,34c12.3-3.2,27.4-7.3,39.7-10.6c7.7-2.1,9.8-5.8,7.7-13.8C83.8,60.3,81.8,52.6,79.8,44.8z M42.1,86.2
                        L42.1,86.2c-0.2-0.5-1.5-5.3-6.9-25.2c-2.3-8.5-3-10.1-1.4-12.9c1.3-2.3,4.7-2.9,11.4-4.7C57.9,40,70.7,36.5,83.8,33
                        c-1-3.9-2-7.5-3.1-11.7c-6.3,1.7-12.3,3.2-18.3,5c-0.8,0.2-1.4,1.6-2,2.6c-5.1,8.2-15,10.7-23.5,6.3c-1.4-0.7-3.4-1-5-0.7
                        c-5.2,1.1-10.2,2.6-15.9,4.1c1.1,4,2,7.7,3.1,11.6c6.9-1.7,0.2-0.1,7-1.8c1.5,5.3,0,0,1.5,5.3c-4.1,1.1-8.1,2.2-12.3,3.3
                        c-1.9-7.1-3.7-13.7-5.5-20.3c-0.1-0.5-0.5-1.8-0.5-1.8s17-4.8,25.4-6.9c1-0.3,2.6,0.6,3.6,1.4c6.7,4.6,14.9,2.6,18-4.7
                        c1-2.4,2.5-3.3,4.8-3.9c7.7-1.9,15.4-4.1,23.4-6.2c2,7.5,4,14.6,6,22.2c-8.3,2.3-16.5,4.6-24.7,6.8c-7.7,2.1-15.5,3.9-23.1,6.1
                        c-4.5,1.3-4.5,1.3-3,6.7c0.3,1.1,3.6,14.2,5.2,19.4l26.5-28c0.5,1.8,0.7,2.6,0.8,2.9l0,0c0,0,0,0,0,0.1l0,0c0,0.1,0,0.1,0,0.1
                        c0.1,0.3,0.3,1.1,0.8,2.9c-0.6,0.6-1.1,1.1-1.5,1.6c-0.3,0.3-0.5,0.6-0.8,0.9l-0.1,0.1c-0.2,0.3-0.5,0.5-0.7,0.7
                        c-0.4,0.5-0.8,0.8-1.1,1.1c-0.1,0.1-0.2,0.3-0.4,0.4c-0.1,0.1-0.3,0.3-0.3,0.4C68,59,68,59,68,59c-0.1,0.1-0.2,0.2-0.2,0.2l0,0
                        c0,0,0.1-0.1,0.2-0.2l0.1-0.1c0.1-0.1,0.2-0.2,0.3-0.4c0.1-0.1,0.2-0.2,0.4-0.4c0.3-0.3,0.7-0.7,1.1-1.1c0.2-0.2,0.5-0.5,0.7-0.7
                        l0.1-0.1c0.3-0.3,0.5-0.6,0.8-0.9c0.9-0.9,1.5-1.6,1.5-1.6C42.1,86.2,73,53.7,42.1,86.2C42.2,86.3,42.2,86.3,42.1,86.2L42.1,86.2z
                         M71.2,78.8l-10-5.3l4.3-4.6l13.8,7.6L71.2,78.8z" class="top-left-logo"></path>
                <path d="M79.8,44.8c5.9-1.6,11.4-3.1,17.3-4.8c-2.9-10.9-5.8-21.5-8.7-32.5c-10.7,2.9-20.9,5.7-31.2,8.3c-2.5,0.6-3.8,1.6-4.4,4.2
                        c-1.3,6-8.9,8.3-13.8,2.9c-0.8-0.8-2.6-1.3-3.7-1.1c-9.8,2.5-28.6,7.6-28.6,7.6s0,0-3.8,1.1c3,10.9,5.9,21.6,8.8,32.3
                        c6.2-1.6,11.6-3,17.4-4.5l9.3,34c12.3-3.2,27.4-7.3,39.7-10.6c7.7-2.1,9.8-5.8,7.7-13.8C83.8,60.3,81.8,52.6,79.8,44.8z M42.1,86.2
                        L42.1,86.2c-0.2-0.5-1.5-5.3-6.9-25.2c-2.3-8.5-3-10.1-1.4-12.9c1.3-2.3,4.7-2.9,11.4-4.7C57.9,40,70.7,36.5,83.8,33
                        c-1-3.9-2-7.5-3.1-11.7c-6.3,1.7-12.3,3.2-18.3,5c-0.8,0.2-1.4,1.6-2,2.6c-5.1,8.2-15,10.7-23.5,6.3c-1.4-0.7-3.4-1-5-0.7
                        c-5.2,1.1-10.2,2.6-15.9,4.1c1.1,4,2,7.7,3.1,11.6c6.9-1.7,0.2-0.1,7-1.8c1.5,5.3,0,0,1.5,5.3c-4.1,1.1-8.1,2.2-12.3,3.3
                        c-1.9-7.1-3.7-13.7-5.5-20.3c-0.1-0.5-0.5-1.8-0.5-1.8s17-4.8,25.4-6.9c1-0.3,2.6,0.6,3.6,1.4c6.7,4.6,14.9,2.6,18-4.7
                        c1-2.4,2.5-3.3,4.8-3.9c7.7-1.9,15.4-4.1,23.4-6.2c2,7.5,4,14.6,6,22.2c-8.3,2.3-16.5,4.6-24.7,6.8c-7.7,2.1-15.5,3.9-23.1,6.1
                        c-4.5,1.3-4.5,1.3-3,6.7c0.3,1.1,3.6,14.2,5.2,19.4l26.5-28c0.5,1.8,0.7,2.6,0.8,2.9l0,0c0,0,0,0,0,0.1l0,0c0,0.1,0,0.1,0,0.1
                        c0.1,0.3,0.3,1.1,0.8,2.9c-0.6,0.6-1.1,1.1-1.5,1.6c-0.3,0.3-0.5,0.6-0.8,0.9l-0.1,0.1c-0.2,0.3-0.5,0.5-0.7,0.7
                        c-0.4,0.5-0.8,0.8-1.1,1.1c-0.1,0.1-0.2,0.3-0.4,0.4c-0.1,0.1-0.3,0.3-0.3,0.4C68,59,68,59,68,59c-0.1,0.1-0.2,0.2-0.2,0.2l0,0
                        c0,0,0.1-0.1,0.2-0.2l0.1-0.1c0.1-0.1,0.2-0.2,0.3-0.4c0.1-0.1,0.2-0.2,0.4-0.4c0.3-0.3,0.7-0.7,1.1-1.1c0.2-0.2,0.5-0.5,0.7-0.7
                        l0.1-0.1c0.3-0.3,0.5-0.6,0.8-0.9c0.9-0.9,1.5-1.6,1.5-1.6C42.1,86.2,73,53.7,42.1,86.2C42.2,86.3,42.2,86.3,42.1,86.2L42.1,86.2z
                         M71.2,78.8l-10-5.3l4.3-4.6l13.8,7.6L71.2,78.8z" class="bottom-right-logo"></path>
            </svg>
        </figure>
    </div>
    <div class="wrapper">
    <header>
    <nav id="top">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-12 col-sms-12">
                    <div id="logo">
                      <?php if ($logo) { ?>
                      <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
                      <?php } else { ?>
                      <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
                      <?php } ?>
                    </div>
                </div>
                <div class="col-md-9 col-sm-12 col-sms-12">
                    <div class="header-container">
                        <?php if(isset($block1)){ echo $block1; }?>
                        <div class="box-top">
                            <div class="top-cart">
                                <?php echo $cart; ?>
                            </div>
                            <div class="header-link">
                                <div class="header-content">
                                    <div class="icon-link fa fa-cog fa-fw" aria-hidden="true"></div>
                                    <div class="box-content">
                                        <div id="top-links">
                                            <div class="box-link">
                                                <ul class="list-inline links">
                                                    <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>"><span><?php echo $text_account; ?></span></a></li>
                                                    <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><span><?php echo $text_shopping_cart; ?></span></a></li>
                                                    <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><span ><?php echo $text_checkout; ?></span></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="language-currency">
                                            <div class="header-currency"><?php echo $currency; ?></div>
                                            <div class="header-laguage"><?php echo $language; ?></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="header-search">
                                <?php echo $search; ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>
    </header>
    <?php if(isset($block2)){ echo $block2; }?>
    <script type="text/javascript">
    $(document).ready(function(){
        $(window).scroll(function () {
            if ($(this).scrollTop() > 47 && $(window).width() > 991) {
            $('header').addClass("fix-nav");
            } else {
            $('header').removeClass("fix-nav");
            }
        });
        $(function dropDown()
        {
            elementClick = '.header-link .icon-link,#search-by-category .icon-search,#cart .btn-cart';
            elementSlide =  '.dropdown-menu,.search-box,.box-content';
            activeClass = 'active';

            $(elementClick).on('click', function(e){
            e.stopPropagation();
            var subUl = $(this).next(elementSlide);
            if(subUl.is(':hidden'))
            {
            subUl.slideDown();
            $(this).addClass(activeClass);
            }
            else
            {
            subUl.slideUp();
            $(this).removeClass(activeClass);
            }
            $(elementClick).not(this).next(elementSlide).slideUp();
            $(elementClick).not(this).removeClass(activeClass);
            e.preventDefault();
            });

            $(elementSlide).on('click', function(e){
            e.stopPropagation();
            });

            $(document).on('click', function(e){
            e.stopPropagation();
            var elementHide = $(elementClick).next(elementSlide);
            $(elementHide).slideUp();
            $(elementClick).removeClass('active');
            });

        });
    });
    </script>