<?php echo $header; ?>
<ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li> <a href="<?php echo $breadcrumb['href']; ?>"> <?php echo $breadcrumb['text']; ?> </a> </li>
    <?php } ?>
</ul>
<div class="container main">
<div class="main">
    <div id="content">
    <?php echo $content_top; ?>
        <div class="testimonial-product">
        <div class="title-module">
            <div class="page-title"><h1><?php echo $heading_title; ?></h1></div>
        </div>
            <?php if ($testimonials) { ?>
            <div class="testimonial-page">
                <?php foreach ($testimonials as $testimonial) { ?>
				<div class="row-testimonials">
					<div class="testimonial-images"><img src="<?php echo $testimonial['image']; ?>"></div>
					<div class="box-testimonial">
						<div class="testimonial-std"><?php echo $testimonial['content']; ?></div>
						<div class="testimonial-name"><h2>--<?php echo $testimonial['customer_name']; ?>--</h2></div>
					</div>
				</div>
                <?php } ?>
            </div>
            <div class="row">
                <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                <div class="col-sm-6 text-right"><?php echo $results; ?></div>
            </div>
            <?php } else { ?>
            <p><?php echo $text_empty; ?></p>
            <div class="buttons">
                <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
            </div>
            <?php } ?>
        </div>
    </div>
</div>
    <?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>