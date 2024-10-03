<?php
	$count = 0;
	$rows = $slide['rows'];
	if(!$rows) { $rows = 1; }
?>
<div class="testimonial-container">
	<div class="container">
		<div class="module-title block-title">
			<h2><?php echo $title; ?></h2>
		</div>
		<div class="block-content">
			<div id="slides">
				<?php foreach($testimonials as $testimonial) { ?>
					<?php  if($count % $rows == 0 ) { echo '<div class="row_items">'; } $count++; ?>
					<div class="testimonial-inner">
						<div class="testimonial-des">
							<a href="<?php echo $more; ?>"><?php echo substr($testimonial['content'],0,400)."..."; ?></a>
						</div>
						<div class="testimonial-content">
							<div class="testimonial-image">
								<img src="<?php echo $testimonial['image'];?>" alt="<?php echo $testimonial['customer_name'];?>">
							</div>
							<div class="testimonial-link">
								<span class="testimonial-author"><?php echo $testimonial['customer_name']; ?></span>
							</div>
						</div>
					</div><!--testimonial-content-->
					<?php if($count % $rows == 0 || $count == count($testimonials)): ?>
					</div>
					<?php endif; ?>
				<?php  } ?>
			</div>
		</div><!--block-content-->
	</div>
</div><!--testimonial-container-->
<script type="text/javascript">
    $("#slides").owlCarousel({
		autoPlay : <?php if($slide['auto']) { echo 'true' ;} else { echo 'false'; } ?>,
		items : <?php echo $slide['items'] ?>,
		itemsDesktop : [1199,1],
		itemsDesktopSmall : [980,1],
		itemsTablet: [768,1],
		itemsMobile : [479,1],
		slideSpeed : <?php echo $slide['speed']; ?>,
		paginationSpeed : <?php echo $slide['speed']; ?>,
		rewindSpeed : <?php echo $slide['speed']; ?>,
		navigation : <?php if($slide['navigation']) { echo 'true' ;} else { echo 'false'; } ?>,
		pagination : <?php if($slide['pagination']) { echo 'true' ;} else { echo 'false'; } ?>
    });
</script>