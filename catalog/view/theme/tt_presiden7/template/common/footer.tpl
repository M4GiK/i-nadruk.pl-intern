<?php if(isset($block4)){ echo $block4; } ?>
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
										<a href="#"><img src="catalog/view/theme/tt_presiden7/image/logo.png" alt=""></a>
									</div>
									<p class="desc-footer"><?php echo $text_desc_footer; ?></p>
									<div class="address"><label><?php echo $text_address; ?></label><?php echo $address; ?></div>
									<div class="email"><label><?php echo $text_email; ?></label><?php echo $email; ?></div>
									<div class="telephone"><label><?php echo $text_telephone; ?></label><?php echo $telephone; ?></div>
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
<script type="text/javascript">
	$(document).ready(function(){
		// hide #back-top first
		$("#back-top").hide();
		// fade in #back-top
		$(function () {
			$(window).scroll(function () {
				if ($(this).scrollTop() > 300) {
					$('#back-top').fadeIn();
				} else {
					$('#back-top').fadeOut();
				}
			});
			// scroll body to 0px on click
			$('#back-top').click(function () {
				$('body,html').animate({scrollTop: 0}, 800);
				return false;
			});
		});
		if (jQuery(window).width() < 992) {   
			jQuery('.footer-static .footer-title').click(function(){     
				jQuery(this).parent('.col').toggleClass('active').siblings().removeClass('active'); 
				jQuery(this).next('.col .footer-content').toggle(300);
				jQuery(this).parent('.col.active').siblings().children('.col .footer-content').slideUp(300); 
			}); 
			 
		}
	});
</script>
</footer>

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->

</body></html>