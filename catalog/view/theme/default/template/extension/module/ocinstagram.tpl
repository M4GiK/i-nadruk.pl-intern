<div id="instagram_block_home" class="block">
    <div class="title_block">
        <h3 class="footer-title"><?php echo $title; ?></h3>
    </div>
    <?php
        $count = 0;
        echo $rows = $config_slide['f_rows'];
        if(!$rows) { $rows=1; }
    ?>
    <div class="content_block">
        <?php foreach($instagrams as $instagram) : ?>
            <?php if($count % $rows == 0 ) : ?>
                <div class="row_items">
            <?php endif; ?>
            <?php $count++; ?>
                    <a rel="gallery" class="fancybox " href="<?php echo $instagram['image']; ?>" style="display: block;"><img src="<?php echo $instagram['image'] ?>" alt="" /></a>
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

<?php if($config_slide['f_view_mode'] == 'slider') : ?>
<script type="text/javascript">
    $("#instagram_block_home .content_block").owlCarousel({
        autoPlay: <?php if($config_slide['autoplay']) { echo 'true' ;} else { echo 'false'; } ?>,
        items : <?php echo $config_slide['items']; ?>,
        slideSpeed : <?php if($config_slide['f_speed']) { echo $config_slide['f_speed']; } else { echo 3000;} ?>,
        navigation : <?php if($config_slide['f_show_nextback']) { echo 'true' ;} else { echo 'false'; } ?>,
        pagination : <?php if($config_slide['f_show_ctr']) { echo 'true' ;} else { echo 'false';} ?>,
        stopOnHover : true,
        itemsDesktop : [1199, 5],
        itemsDesktopSmall : [979, 4],
        itemsTablet : [768, 2],
        itemsMobile : [479, 1],
    });
</script>
<?php endif; ?>
<script type="text/javascript">
    $('.content_block').magnificPopup({
        type: 'image',
        delegate: 'a',
        gallery: {
            enabled : true
        }
    });
</script>
