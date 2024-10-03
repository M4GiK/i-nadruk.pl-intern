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
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans:400,400i,600,600i,700,700i" rel="stylesheet" type="text/css">
<link href="catalog/view/theme/tt_presiden6/stylesheet/stylesheet.css" rel="stylesheet">
<script src="catalog/view/javascript/opentheme/ocslideshow/jquery.nivo.slider.js" type="text/javascript"></script>
<link href="catalog/view/theme/tt_presiden6/stylesheet/opentheme/ocslideshow/ocslideshow.css" rel="stylesheet" />
<link href="catalog/view/theme/tt_presiden6/stylesheet/opentheme/css/animate.css" rel="stylesheet" />
<script src="catalog/view/javascript/opentheme/hozmegamenu/custommenu.js" type="text/javascript"></script>
<script src="catalog/view/javascript/opentheme/hozmegamenu/mobile_menu.js" type="text/javascript"></script>
<link href="catalog/view/theme/tt_presiden6/stylesheet/opentheme/hozmegamenu/css/custommenu.css" rel="stylesheet" />
<link href="catalog/view/theme/tt_presiden6/stylesheet/opentheme/css/owl.carousel.css" rel="stylesheet" />
<script src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.js" type="text/javascript"></script>
<script src="catalog/view/javascript/opentheme/ocquickview/ocquickview.js" type="text/javascript"></script>
<link href="catalog/view/theme/tt_presiden6/stylesheet/opentheme/ocquickview/css/ocquickview.css" rel="stylesheet">
<link href="catalog/view/theme/tt_presiden6/stylesheet/opentheme/oclayerednavigation/css/oclayerednavigation.css" rel="stylesheet">
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
<div class="container">
	<nav id="top">
		<div class="row">
			<div class="col-md-4 col-sm-4 col-sms-12">
				<div class="language-currency">
					<div class="header-laguage"><?php echo $language; ?></div>
					<div class="header-currency"><?php echo $currency; ?></div>
				</div>
			</div>
			<div class="col-md-4 col-sm-4 col-sms-12">
				<p class="block-header"><?php echo $text_block; ?></p>
			</div>
			<div class="col-md-4 col-sm-4 col-sms-12">
				<div id="top-links">
					<ul class="list-inline">
						<li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle link-account" data-toggle="dropdown"><span><?php echo $text_account; ?></span></a>
						  <ul class="dropdown-menu dropdown-menu-right">
							<li><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" data-toggle="dropdown"><span><?php echo $text_account; ?></span></a></li>
							<?php if ($logged) { ?>
							<li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
							<?php } else { ?>
							<li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
							<li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
							<?php } ?>
							<li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><span><?php echo $text_shopping_cart; ?></span></a></li>
							<li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><span ><?php echo $text_checkout; ?></span></a></li>
						  </ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
</div>
<header>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-sm-4 col-sms-12">
				<div class="header-search">
					<?php echo $search; ?>
				</div>
			</div>
			<div class="col-md-4 col-sm-4 col-sms-12">
				<div id="logo">
				  <?php if ($logo) { ?>
				  <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
				  <?php } else { ?>
				  <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
				  <?php } ?>
				</div>
			</div>
			<div class="col-md-4 col-sm-4 col-sms-12">
				<div class="top-cart">
					<?php echo $cart; ?>
				</div>
			</div>
		</div>
	</div>
</header>
<div class="header-menu">
	<?php if(isset($block1)){ echo $block1; }?>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$(window).scroll(function () {
		if ($(this).scrollTop() > 175) {
		$('.header-menu').addClass("fix-nav");
		} else {
		$('.header-menu').removeClass("fix-nav");
		}
	});
	$(function dropDown()
	{
		elementClick = '#form-currency .btn-currency,#form-language .btn-language,#top-links .link-account,#search-by-category .icon-search,#cart .btn-cart';
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