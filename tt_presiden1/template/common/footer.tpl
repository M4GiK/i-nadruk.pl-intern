<?php if(isset($block4)){ echo $block4; } ?>
</div>
<footer>
	<div class="footer-static">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 col-md-8 col-xs-12">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-5">
							<div class="col col1">
								<div class="footer-title">
									<h3><?php echo $text_logo_footer; ?></h3>
								</div>
								<div class="footer-content">
									<div class="logo-footer">
										<a href="#"><img src="catalog/view/theme/tt_presiden1/image/logo.png" alt=""></a>
									</div>
									<p class="desc-footer"><?php echo $text_desc_footer; ?></p>
									<div class="address info"><i class="fa fa-home"></i><?php echo nl2br($address); ?></div>
                                    <div class="email info"><i class="fa fa-envelope"></i><a href="mailto:<?php echo $email; ?>" class="footer-mail"><?php echo $email; ?></a></div>
									<div class="telephone info"><i class="fa fa-phone"></i><?php echo $telephone; ?></div>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-4">
							<div class="col col2">
								<div class="footer-title">
									<h3><?php echo $text_service; ?></h3>
								</div>
								<div class="footer-content">
									<ul class="list-unstyled">
										<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
										<?php foreach ($informations as $information) { ?>
											<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
										<?php } ?>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-3">
							<div class="col col3">
								<div class="footer-title"><h3><?php echo $text_account; ?></h3></div>
								<div class="footer-content">
									<ul class="list-unstyled">
										<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
										<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
										<li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
										<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
										<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-12 col-md-4 col-xs-12">
					<div class="col col4">
						<div class="footer-title"><h3><?php echo $text_newsletter; ?></h3></div>
						<div class="footer-content">
							<?php if(isset($block5)){ ?>
								<?php echo $block5; ?>
							<?php } ?>
							<?php if(isset($block6)){ ?>
								<?php echo $block6; ?>
							<?php } ?>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="bottom-footer">
		<div class="container">
			<div class="container-inner">
				<div class="link-footer">
					<ul>
						<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
						<li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
						<li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
						<li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
					</ul>
				</div>
				<p><?php echo $powered; ?></p>
				<?php if(isset($block7)){ ?>
					<?php echo $block7; ?>
				<?php } ?>
			</div>
		</div>
	</div>
  
  <div id="back-top"></div>
    <script src="catalog/view/javascript/opentheme/slider.js" type="text/javascript"></script>
    <link href="catalog/view/theme/default/stylesheet/drift.css" rel="stylesheet">
</footer>

<!-- Theme created by M4GiK Software -->

</body></html>