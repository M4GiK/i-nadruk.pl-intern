<?php if ($products) { ?>
                <div><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div>
                <div class="toolbar">
					<div class="toolbar1">
                        <div class="btn-group">
                            <button type="button" id="list-view" class="btn btn-default"></button>
                            <button type="button" id="grid-view" class="btn btn-default"></button>
                        </div>
                    </div>
                    <div class="toolbar2">
                        <select id="input-sort" class="form-control" onchange="oclayerednavigationajax.filter(this.value)">
                            <?php foreach ($sorts as $sorts) { ?>
                            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                            <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $text_sort; ?>&nbsp;<?php echo $sorts['text']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $sorts['href']; ?>"><?php echo $text_sort; ?>&nbsp;<?php echo $sorts['text']; ?></option>
                            <?php } ?>
                            <?php } ?>
                        </select>
                    </div>
					<div class="toolbar3">
                        <select id="input-limit" class="form-control" onchange="oclayerednavigationajax.filter(this.value)">
                            <?php foreach ($limits as $limits) { ?>
                            <?php if ($limits['value'] == $limit) { ?>
                            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $text_limit; ?>&nbsp;<?php echo $limits['text']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $limits['href']; ?>"><?php echo $text_limit; ?>&nbsp;<?php echo $limits['text']; ?></option>
                            <?php } ?>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <div class="custom-products">
                    <div class="row">
						<?php foreach ($products as $product) { ?>
							<div class="product-layout product-list col-xs-12">
								<div class="product-thumb item-inner">
									<div class="images-container">
										<a href="<?php echo $product['href']; ?>">
											<?php if ($product['thumb']) { ?>
											<?php if($product['rotator_image']){ ?><img class="image2" src="<?php echo $product['rotator_image']; ?>" alt="<?php echo $product['name']; ?>" /><?php } ?>
											<?php } else { ?>
											<img  src="image/cache/no_image-100x100.png" alt="<?php echo $product['name']; ?>" />
											<?php } ?>
											<img class="image1"  src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
										</a>
										<div class="actions">
											<div class="add-to-links">
												<div class="cart">
													<button class="button btn-cart" type="button" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');"><span><span><?php echo $button_cart; ?></span></span></button>
												</div>
												<div class="compare">
													<a class="link-compare" title="<?php echo $button_compare; ?>" data-toggle="tooltip" onclick="compare.add('<?php echo $product['product_id']; ?>');">
														<em><?php echo $button_compare; ?></em>
													</a>
												</div>
											</div>
										</div>
									</div>
									<div class="des-container">
										<div class="name-wishlist">
											<h2 class="product-name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h2>
											<div class="wishlist">
												<a class="link-wishlist" title="<?php echo $button_wishlist; ?>" data-toggle="tooltip" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
													<em><?php echo $button_wishlist; ?></em>
												</a>
											</div>
										</div>
										<p class="product-des"><?php echo $product['description']; ?></p>
										<div class="price-rating">
											<div class="price-label">
												<div class="box-price">
													<?php if ($product['price']) { ?>
														<p class="price">
														  <?php if (!$product['special']) { ?>
														  <?php echo $product['price']; ?>
														  <?php } else { ?>
														  <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
														  <?php } ?>
														  <?php if ($product['tax']) { ?>
														  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
														  <?php } ?>
														</p>
													<?php } ?>
												</div>
											</div>
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
										</div>
									</div>
								</div>
							</div>
						<?php } ?>
					</div>
                </div>
                <div class="row toolbar4">
                    <div class="col-sm-6"><?php echo $pagination; ?></div>
                    <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                </div>
                <?php } ?>
                <?php if (!$products) { ?>
                <p><?php echo $text_empty; ?></p>
                <div class="buttons">
                    <div class="pull-right"><a href="<?php echo $continue; ?>" class="button btn btn-primary"><?php echo $button_continue; ?></a></div>
                </div>
                <?php } ?>
<script type="text/javascript">
    // Product List
	$('#list-view').click(function() {
		$(this).addClass('selected');
		$('#grid-view').removeClass('selected');
		$('#content .product-grid > .clearfix').remove();

		//$('#content .product-layout').attr('class', 'product-layout product-list col-xs-12');
		$('#content .row > .product-grid').attr('class', 'product-layout product-list col-xs-12');
		$('#content .product-list .des-container').addClass('col-md-8 col-sm-8 col-sms-12');
		$('#content .product-list .images-container').addClass('col-md-4 col-sm-4 col-sms-12');

		localStorage.setItem('display', 'list');
	});
    
	// Product Grid
	$('#grid-view').click(function() {
		$(this).addClass('selected');
		$('#list-view').removeClass('selected');
		// What a shame bootstrap does not take into account dynamically loaded columns
		cols = $('#column-right, #column-left').length;

		if (cols == 2) {
			$('#content .product-list').attr('class', 'product-layout product-grid col-lg-6 col-md-6 col-sm-12 col-xs-12');
		} else if (cols == 1) {
			$('#content .product-list').attr('class', 'product-layout product-grid col-md-4 col-sm-6 col-xs-12');
		} else {
			$('#content .product-list').attr('class', 'product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12');
		}
		$('#content .product-grid .des-container').removeClass('col-md-8 col-sm-8 col-sms-12');
		$('#content .product-grid .images-container').removeClass('col-md-4 col-sm-4 col-sms-12');

		 localStorage.setItem('display', 'grid');
	});

	if (localStorage.getItem('display') == 'list') {
		
		$('#list-view').trigger('click');
	} else {
		$('#grid-view').trigger('click');
	}
</script>