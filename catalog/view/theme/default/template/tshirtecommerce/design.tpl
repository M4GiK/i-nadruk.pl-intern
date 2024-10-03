<?php @ini_set("zlib.output_compression", "Off"); ?>
<?php echo $header; ?>
<div id="container" class="container" style="padding-top: 15px;margin-top: 15px;">
	<?php echo $content; ?>
</div>
<link href="<?php echo $url.'tshirtecommerce/opencart/css/opencart.css?v='.time(); ?>" rel="stylesheet">
<link href="<?php echo $url.'tshirtecommerce/opencart/css/mobile.css?v='.time(); ?>" rel="stylesheet">
<script type="text/javascript">
	var tshirtURL 		= '<?php echo $url;?>/tshirtecommerce/';
	var auto_redirect_cart = '<?php echo $tshirtecommerce_redirect_to_cart_page; ?>';
	var urlBack = '<?php echo $url.'index.php?route=product/product&product_id='.$parent_id; ?>';	
	var urlDesign = '<?php echo $url.'index.php?route=tshirtecommerce/designer'; ?>';
	var urlDesignload = '<?php echo $urlDesignload; ?>';
	var _product_id_oc = '<?php echo $parent_id; ?>';
	var ocedit = '<?php echo $edit; ?>';
	var logo_loading = '<?php echo $tshirtecommerce_logo_loading; ?>';
	var text_loading = '<?php echo $tshirtecommerce_text_loading; ?>';
	var design_user_id = '<?php echo $design_user_id ?>';
	var design_email = '<?php echo $design_email ?>';
</script>
<script src="<?php echo $url.'tshirtecommerce/opencart/js/app.js?v='.time(); ?>" type="text/javascript"></script>
<?php echo $footer; ?>