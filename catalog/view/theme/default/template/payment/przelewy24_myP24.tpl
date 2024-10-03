<?php echo $header; ?>
<link href="catalog/view/css/p24/p24.css" rel="stylesheet" media="screen" />
<style>
    .p24_method > label > div {
        <?php if(!$p24_noimages): ?>
        height: 70px;
        font-size: 9px;
        <?php else: ?>
        height: 40px;
        font-size: 12px;
        <?php endif; ?>
    }
</style>
<?php echo $column_left; ?>
<?php echo $column_right; ?>
<div id="content" class="container">
  <div class="top">
    <div class="left"></div>
    <div class="right"></div>
    <div class="center">
      <h1><?=$myP24_header;?></h1>
    </div>
  </div>
  <div class="middle">
    <p><?=$myP24_information;?></p>
      <div class="p24_payment">
          <?php if(!empty($myP24_methods) || !empty($p24_used_cards)): ?>
          <form method="post" id="p24_checkout">
              <div class="p24_method">
                  <?php if(count($p24_used_cards) > 0):?>
                  <div class="p24_method_info"><?=$myP24_lastCards;?></div>
                  <?php foreach ($p24_used_cards as $uc): ?>
                  <label><input type="radio" name="p24_card" value="<?=$uc['ref_id'];?>"><div><?php if(!$p24_noimages): ?><div class="p24_method_image" style="background-image: url('https://secure.przelewy24.pl/template/201312/bank/logo_<?=$uc['method_id'];?>.gif');"></div><?php endif; ?><?=$uc['card_type'];?> <?=$uc['mask'];?></div></label>
                  <?php endforeach; endif; ?>

                  <?php if(count($myP24_methods) > 0): ?>
                  <div class="p24_method_info"><?=$myP24_lastMethods;?></div>
                  <?php foreach ($myP24_methods as $pm): ?>
                  <label><input type="radio" name="p24_method" value="<?=$pm->id;?>"><div><?php if(!$p24_noimages): ?><div class="p24_method_image" style="background-image: url('https://secure.przelewy24.pl/template/201312/bank/logo_<?=$pm->id;?>.gif');"></div><?php endif; ?><?=$pm->name;?></div></label>
                  <?php endforeach; endif; ?>
              </div>
              <div class="buttons">
                  <div class="pull-right">
                      <input type="submit" value="delete" id="button-confirm" disabled="true" class="btn btn-primary" />
                  </div>
              </div>
          </form>
          <?php else: ?>
          <b><?=$myP24_emptyList;?></b>
          <?php endif; ?>
      </div>
  </div>
  <div class="bottom">
    <div class="left"></div>
    <div class="right"></div>
    <div class="center"></div>
  </div>
</div>
<script>
    $("input[name=p24_method], input[name=p24_card]").click(function () {
        $("div.p24_method_image").removeClass("p24_methods");
        $("div.p24_method_image").addClass("p24_methods");
        $("#button-confirm").prop('disabled', false);
    });

    $('input[type=radio]').change(function() {
        $('input[type=radio]:checked').not(this).prop('checked', false);
    });
</script>
<?php echo $footer; ?> 