<div class="mostviewed-container">
	<div class="module-title"><h2><?php echo $title; ?></h2></div>
	<?php 
	$count = 0;
	$rows = $config_slide['f_rows'];
	if(!$rows) { $rows=1; }
	?>
	<div class="row">
		<div class="most-viewed-products-slider">
		<?php if($products): ?>
		<?php foreach ($products as $product) { ?>
		<?php  if($count % $rows == 0 ) { echo '<div class="item">'; } $count++; ?>
		<div class="item-inner">
			<?php if($config_slide['f_show_label']): ?>
				<?php if ($product['is_new']):
					if($product['special']): ?>
						<div class="sale"><?php echo $text_sale; ?></div>
					<?php else: ?>
						<div class="new"><?php echo $text_new; ?></div>
					<?php endif; ?>
				<?php else: ?>
					<?php if($product['special']): ?>
						<div class="sale"><?php echo $text_sale; ?></div>
					<?php endif; ?>
				<?php endif; ?>
			<?php endif; ?>
			<div class="images-container">
				<?php if ($product['thumb']) { ?>
					<a class="image" href="<?php echo $product['href']; ?>">
						<?php if($product['rotator_image']): ?>
						<img class="image2" src="<?php echo $product['rotator_image']; ?>" alt="<?php echo $product['name']; ?>" />
						<?php endif; ?>
						<img class="image1" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
					</a>
				<?php } else { ?>
					<a class="product-image" href="<?php echo $product['href']; ?>">
						<div class="product-image">
							<img src="image/cache/no_image-100x100.png" alt="<?php echo $product['name']; ?>" />
						</div>
					</a>
				<?php } ?>
			</div><!--images-container-->
			<div class="des-container">
				<h2 class="product-name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h2>
				<?php if (isset($product['rating'])) { ?>
					<div class="ratings">
						<div class="rating-box">
							<?php for ($i = 0; $i <= 5; $i++) { ?>
								<?php if ($product['rating'] == $i) {
									$class_r= "rating".$i;
									echo '<div class="'.$class_r.'">rating</div>';
								} 
							}  ?>
						</div>
					</div>
				<?php } ?>
				<?php if($config_slide['f_show_des']) { ?>
					<div class="product-des"><?php echo $product['description']; ?></div>
				<?php } ?>
				<div class="price-label">
					<div class="box-price">
						<?php if($config_slide['f_show_price']) { ?>
							<?php if ($product['price']) { ?>
							<div class="price-box">
								<?php if (!$product['special']) { ?>
									<span class="price"><?php echo $product['price']; ?></span>
								<?php } else { ?>
									<p class="special-price"><span class="price"><?php echo $product['special']; ?></span></p>
									<p class="old-price"><span class="price"><?php echo $product['price']; ?></span></p>
								<?php } ?>
							</div>
							<?php } ?>
						<?php } ?>
					</div>
				</div>
				<div class="actions">
					<div class="add-to-links">
						<div class="cart">
							<?php if($config_slide['f_show_addtocart']) { ?>
								<button class="button btn-cart" type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');">
									<span><span><?php echo $button_cart; ?></span></span>
								</button>
							<?php } ?>
						</div>
					</div>
				</div>
			</div><!-- des-container -->
		</div> <!-- item-inner -->
		<?php if($count % $rows == 0 ): ?>
			</div>
		<?php else: ?>
			<?php if($count == count($products)): ?>
				</div>
			<?php endif; ?>
		<?php endif; ?>
		<?php } ?>
		<?php else: ?>
			<p><?php echo $text_empty; ?></p>
		<?php endif; ?>
		</div>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function() { 
  	$(".most-viewed-products-slider").owlCarousel({
	  autoPlay: <?php if($config_slide['autoplay']) { echo 'true' ;} else { echo 'false'; } ?>,
		items : <?php if($config_slide['items']) { echo $config_slide['items'] ;} else { echo 3; } ?>,
		slideSpeed : <?php if($config_slide['f_speed']) { echo $config_slide['f_speed']; } else { echo 200;} ?>,
		navigation : <?php if($config_slide['f_show_nextback']) { echo 'true' ;} else { echo 'false'; } ?>,
		paginationNumbers : true,
		pagination : <?php if($config_slide['f_show_ctr']) { echo 'true' ;} else { echo 'false';} ?>,
		stopOnHover : false,
		itemsDesktop : [1199,1],
		itemsDesktopSmall : [991,1],
		itemsTablet: [700,1],
		itemsMobile : [400,1],
  	});
 
});
</script>