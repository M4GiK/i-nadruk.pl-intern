<?php echo $header; ?>
<script>
	var mydesign_ajax_del_link = '<?php echo $mydesign_ajax_del_link;?>';
	var tshirtecommerce_design_confirm_delete = '<?php echo $tshirtecommerce_design_confirm_delete;?>';
	var tshirtecommerce_design_search_link = '<?php echo $tshirtecommerce_design_search_link;?>';
</script>

<link rel="stylesheet" type="text/css" href="<?php echo $site_url; ?>/tshirtecommerce/opencart/new/css/fontawesome-all.css">
<link rel="stylesheet" type="text/css" href="<?php echo $site_url; ?>/tshirtecommerce/opencart/new/css/xbootstrap.css">
<link rel="stylesheet" type="text/css" href="<?php echo $site_url; ?>/tshirtecommerce/opencart/mydesign.css">

<script src="<?php echo $site_url; ?>/tshirtecommerce/opencart/new/xjquery-3.3.1.min.js" type="text/javascript" charset="utf-8"></script>
<!--
<script src="{{ site_url }}/tshirtecommerce/opencart/new/js/xpopper.js" type="text/javascript" charset="utf-8"></script>
<script src="{{ site_url }}/tshirtecommerce/opencart/new/js/xbootstrap.js" type="text/javascript" charset="utf-8"></script>
-->
<script src="<?php echo $site_url; ?>/tshirtecommerce/opencart/mydesign.js" type="text/javascript" charset="utf-8"></script>

<div class="container">
	<ul class="breadcrumb">
		<?php foreach($breadcrumbs as $breadcrumb){ ?>
			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
	    <?php } ?>
	</ul>

	<div class="row">
		<div id="content">
			<div id="tsemydesign" class="tshirtecommerce-mydesign">
				<div class="container-fluid">
					<h3 class="form-group"><?php echo $design_title; ?></h3>
					<div class="btn-toolbar" role="toolbar">
						<div class="input-group">
							<input type="text" class="form-control" value="<?php echo $search_value; ?>" id="tsedesign" name="design" placeholder="<?php echo $tshirtecommerce_design_search_holder; ?>">
							<div class="input-group-append">
								<button class="btn btn-outline-default" onclick="tsemydesign.search()" type="button"><i class="fa fa-search"></i></button>
							</div>
						</div>

						<div class="btn-group float-right" role="group">
							<a target="_blank" href="<?php echo $design_your_own; ?>" class="btn btn-success"><i class="fa fa-plus"></i> <?php echo $button_create_design; ?></a>
						</div>
					</div>

					<div class="row" id="tsemydesign-list">
						<?php if(count($designs) > 0){ ?>
							<?php foreach($designs as $design){ ?>
							<div class="col-sm-3" id="my-design-<?php echo $design['id']; ?>">
								<div class="card card-mydesign">
									<div class="card-img-top">
										<div class="quickshare">
											<div class="xql">
												<a href="javascript:void(0)" onclick="tsemydesign.delete('<?php echo $design['id']; ?>')" data-toggle="tooltip" title="<?php echo $design_delete_text; ?>"><i class="xfas xfa-times"></i></a>
											</div>
											<div class="xqr">
												<a href="<?php echo $design['fblink']; ?>" target="_blank" data-toggle="tooltip" title="<?php echo $design_share_facebook_text; ?>"><i class="xfab xfa-facebook-square"></i></a>
												<a href="<?php echo $design['twlink']; ?>" target="_blank" data-toggle="tooltip" title="<?php echo $design_share_twitter_text; ?>"><i class="xfab xfa-twitter-square"></i></a>
												<a href="<?php echo $design['prlink']; ?>" target="_blank" data-toggle="tooltip" title="<?php echo $design_share_pinterest_text; ?>"><i class="xfab xfa-pinterest-square"></i></a>
												<!--
												<a href="{{ design.iglink }}" target="_blank" data-toggle="tooltip" title="{{ design_share_instagram_text }}"><i class="xfab xfa-instagram"></i></a>
											-->
											</div>
										</div>
										<a href="<?php echo $design.view_link; ?>" target="_blank">
											<img src="<?php echo $site_url; ?>/tshirtecommerce/<?php echo $design['image']; ?>" alt="<?php echo $design['title']; ?>">
										</a>
									</div>
									<div class="card-body">
										<p class="card-text"><a href="<?php echo $design['view_link']; ?>" target="_blank" class="text-truncate"><?php echo $design['title']; ?></a></p>
									</div>
								</div>
							</div>
							<?php } ?>
							<?php }else{ ?>
							<div class="col-sm-12">
								<div class="alert alert-danger" role="alert">
  									<?php echo $tshirtecommerce_design_not_found; ?>
								</div>
							</div>
							<?php } ?>
					</div>
					<?php if(count($designs) > 0){ ?>
					<div class="row">
				        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
				        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
					</div>
					<?php } ?>
				</div>
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>