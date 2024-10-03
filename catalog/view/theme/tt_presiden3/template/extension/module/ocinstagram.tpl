<div id="instagram_block_home" class="instagram-container">
	<div class="module-title">
		<h2><?php echo $title; ?></h2>
		<div class="text-title"><p><?php echo $text_title; ?></p></div>
	</div>
	<?php
		$count = 0;
		$rows = $config_slide['f_rows'];
		if(!$rows) { $rows=1; }
	?>
	<div class="content_block">
		<?php foreach($instagrams as $instagram) : ?>
			<?php if($count % $rows == 0 ) : ?>
				<div class="row_items">
			<?php endif; ?>
			<?php $count++; ?>
					<a class="fancybox" href="<?php echo $instagram['image']; ?>" style="display: block;"><img src="<?php echo $instagram['image'] ?>" alt="" /></a>
			<?php if($count % $rows == 0 ): ?>
				</div>
			<?php else: ?>
				<?php if($count == count($instagrams)): ?>
					</div>
				<?php endif; ?>
			<?php endif; ?>
		<?php endforeach; ?>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
    $(".instagram-container .content_block").owlCarousel({
        navigation : false,
        paginationNumbers : true,
        pagination : false,
        stopOnHover : false,
		items : 7,
		itemsDesktop : [1199,6],
		itemsDesktopSmall : [991,5],
		itemsTablet: [767,4],
		itemsMobile : [480,1]
    });

});
</script>
<script type="text/javascript">
    $('.content_block').magnificPopup({
        type: 'image',
        delegate: 'a',
        gallery: {
            enabled : true
        }
    });
</script>
