<link href="catalog/view/css/p24/p24.css" rel="stylesheet" type="text/css" />
<style>
    .p24_method > label > div {
        <?php if(!$p24_noimages): ?>
        height: 70px;
        font-size: 9px;
        <?php else: ?>
        height: 40px;
        font-size: 11px;
        <?php endif; ?>
    }
</style>

<div class="p24_payment">
    <form action="<?php echo $action; ?>" method="post" id="p24_checkout">
        <input type="hidden" name="p24_merchant_id" value="<?php echo $p24_merchant_id; ?>"/>
        <input type="hidden" name="p24_session_id" value="<?php echo $p24_session_id; ?>"/>
        <input type="hidden" name="p24_pos_id" value="<?php echo $p24_pos_id; ?>"/>
        <input type="hidden" name="p24_amount" value="<?php echo $p24_amount;?>"/>
        <input type="hidden" name="p24_currency" value="<?php echo $p24_currency; ?>"/>
        <input type="hidden" name="p24_description" value="<?php echo $p24_description; ?>"/>
        <input type="hidden" name="p24_email" value="<?php echo $p24_email; ?>"/>
        <input type="hidden" name="p24_client" value="<?php echo $p24_client; ?>"/>
        <input type="hidden" name="p24_address" value="<?php echo $p24_address; ?>"/>
        <input type="hidden" name="p24_zip" value="<?php echo $p24_zip; ?>"/>
        <input type="hidden" name="p24_city" value="<?php echo $p24_city; ?>"/>
        <input type="hidden" name="p24_country" value="<?php echo $p24_country; ?>"/>
        <input type="hidden" name="p24_language" value="<?php echo $p24_language; ?>"/>
        <input type="hidden" name="p24_url_status" value="<?php echo $p24_url_status; ?>"/>
        <input type="hidden" name="p24_url_return" value="<?php echo $p24_url_return; ?>"/>
        <input type="hidden" name="p24_url_cancel" value="<?php echo $p24_url_cancel; ?>"/>
        <input type="hidden" name="p24_api_version" value="<?php echo $p24_api_version; ?>"/>
        <input type="hidden" name="p24_sign" value="<?php echo $p24_sign; ?>"/>
        <input type="hidden" name="p24_ecommerce" value="<?php echo $p24_ecommerce; ?>"/>
        <input type="hidden" name="p24_ecommerce2" value="<?php echo $p24_ecommerce2; ?>"/>

        <?php if($p24_time_limit != 0): ?>
        <input type="hidden" name="p24_time_limit" value="<?php echo $p24_time_limit; ?>"/>
        <?php endif; ?>

        <?php if(!$p24_only24at7): ?>
        <input type="hidden" name="p24_channel" value="16"/>
        <?php endif; ?>

        <input type="hidden" name="p24_shipping" value="<?php echo $p24_shipping; ?>"/>

        <?php foreach ($p24_order_items as $key => $item): ?>
            <input type="hidden" name="<?=$key;?>" value="<?=$item;?>"/>
        <?php endforeach; ?>

        <?php if($payment_in_shop): ?>
            <img src="image/catalog/p24_big.png" alt="Przelewy24"/><br/>
        <?php if($p24_discount != 0): ?>
        <h3 style="margin: 15px 0;"><?php echo $discount_info.' <b>-'.number_format($p24_discount, 2, ".", "").'%'; ?></b></h3>
        <?php endif; ?>
        <?php if($p24_fee != 0): ?>
        <h3 style="margin: 15px 0;">
            <?php echo $fee_info.' <b>+'; echo number_format($p24_fee, 2, ".", ""); ?>
            <?php if($p24_fee_type == 'percentage'): ?>
            %
            <?php else: ?>
            <?php echo $p24_currency; ?>
            <?php endif; ?>
            </b>
        </h3>

        <?php if($p24_discount != 0 || $p24_fee != 0): ?>
        <h3 style="margin: 15px 0;"><?php echo $amount_info.' <b>'.number_format(($p24_amount / 100), 2, ".", ""); echo " " . $p24_currency?></b></h3>
        <?php endif; ?>

        <?php endif; ?>
            <?php if(!empty($p24_used_methods) || (!empty($p24_used_cards) && $oneclick)): ?>
            <div class="p24_method_info"><?=$last_methods;?></div>
            <div class="p24_method">
                <?php if(count($p24_used_cards) > 0 && $oneclick): ?>
                <div class="p24_method_info"><?=$myP24_lastCards;?></div>
                <?php foreach ($p24_used_cards as $uc): ?>
                <label><input type="radio" name="p24_card" value="<?=$uc['ref_id'];?>"><div><?php if(!$p24_noimages): ?><div class="p24_method_image" style="background-image: url('https://secure.przelewy24.pl/template/201312/bank/logo_<?=$uc['method_id'];?>.gif');"></div><?php endif; ?><?=$uc['card_type'];?> <?=$uc['mask'];?></div></label>
                <?php endforeach; endif; ?>

                <?php if(count($p24_used_methods) > 0): ?>
                <div class="p24_method_info"><?=$myP24_lastMethods;?></div>
                <?php  foreach ($p24_payment_methods as $pm): if(($pm->status || !$p24_only24at7) && in_array($pm->id, $p24_used_methods)): ?>
                <?php
                if($p24_only24at7 && $pm->avaibilityHours->mondayToFriday === null &&
                    $pm->avaibilityHours->saturday === null &&
                    $pm->avaibilityHours->sunday === null)
                continue;
                ?>
                <label><input type="radio" name="p24_method" value="<?=$pm->id;?>"><div><?php if(!$p24_noimages): ?><div class="p24_method_image" style="background-image: url('https://secure.przelewy24.pl/template/201312/bank/logo_<?=$pm->id;?>.gif');"></div><?php endif; ?><?=$pm->name;?></div></label>
                <?php endif; endforeach; endif; ?>

            </div>
            <div class="p24_method_info"><?=$other_methods;?></div>
            <?php else: ?>
            <div class="p24_method_info"><?=$all_methods;?></div>
            <?php endif; ?>
            <div class="p24_method">
                <?php foreach ($p24_payment_methods as $pm): if(($pm->status || !$p24_only24at7) && !in_array($pm->id, $p24_used_methods)): ?>
                <?php
                if($p24_only24at7 && $pm->avaibilityHours->mondayToFriday === null &&
                    $pm->avaibilityHours->saturday === null &&
                    $pm->avaibilityHours->sunday === null)
                continue;
                ?>
                <label><input type="radio" name="p24_method" value="<?=$pm->id;?>"><div><?php if(!$p24_noimages): ?><div class="p24_method_image" style="background-image: url('https://secure.przelewy24.pl/template/201312/bank/logo_<?=$pm->id;?>.gif');"></div><?php endif; ?><?=$pm->name;?></div></label>
                <?php endif; endforeach; ?>
            </div>
        <?php endif; ?>

        <?php if($acceptinshop_enabled): ?>
        <label for="p24_regulation_accept" style="font-weight: normal;">
            <input type="checkbox" name="p24_regulation_accept" id="p24_regulation_accept" style="display: inline-block;">
            <?=$regulation_text;?>
        </label>
        <?php endif; ?>
    </form>
    <div class="buttons">
        <div class="pull-right">
            <input type="button" value="<?php echo $button_title; ?>" id="button-confirm" <?php if($acceptinshop_enabled): ?>disabled="true"<?php endif; ?> class="btn btn-primary" />
        </div>
    </div>
</div>
<div id="p24_raty" style="display: none">
    <form action="https://secure.przelewy24.pl/kalkulator_raty/" method="get">
        <div class="buttons">
            <div class="pull-right">
                <input type="hidden" name="amount" value="<?php echo ceil($p24_amount/100);?>" />
                <input type="submit" value="<?=$button_calc;?>" class="btn" formtarget="_blank" style="margin-right: 20px" />
            </div>
        </div>
    </form>
</div>
<?php if($payment_in_shop): ?>
<div class="modal fade" id="p24_cc" tabindex="-1" role="dialog" aria-labelledby="Przelewy24">
    <div class="modal-dialog" role="document" style="width: 320px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="ccLabel"><?=$cardPaymentTitle;?></h4>
            </div>
            <div class="modal-body" id="ccBody">
                <div id="P24FormContainer" data-sign="<?php echo $p24_sign; ?>" data-successCallback="p24Success" data-failureCallback="p24Failed" data-dictionary='{"cardHolderLabel":"<?=$cardHolderLabel;?>","cardNumberLabel":"<?=$cardNumberLabel;?>","cvvLabel":"<?=$cvvLabel;?>","expDateLabel":"<?=$expDateLabel;?>","payButtonCaption":"<?=$payButtonCaption;?>","threeDSAuthMessage":"<?=$threeDSAuthMessage;?>"}'>
                </div>
                <div id="ccMessage">
                </div>
            </div>
        </div>
    </div>
</div>
<?php endif; ?>

<script>
    var load = false;

    $('#p24_regulation_accept').change(
        function () {
            if ($("#p24_regulation_accept").is(':checked')) {
                $("#button-confirm").prop('disabled', false);
            }
            else {
                $("#button-confirm").prop('disabled', true);
            }
        });

    $("#button-confirm").click(function () {
        $("#button-confirm").prop('disabled', true);
        $('#P24FormContainer').children().remove();
        $('#P24FormContainer').css("display", "inline");

        var dane = $("#p24_checkout").serialize();

        if($("input[name=p24_method]").is(':checked')) {
            $.ajax({url: "index.php?route=extension/payment/przelewy24/trnRegister", type: "post", data: dane, success: function(result){
                if(result != 'ERROR') {
                    if((<?php foreach($ccpayments as $payid): ?>$("input:radio[name=p24_method]:checked").val() == <?php echo $payid.' || '; endforeach; ?>false) && <?=$cc_in;?>) {
                        $('#ccMessage').css("display", "inline-block");
                        $('#ccMessage').html('<?=$cardPanelLoading;?><br/><img src="image/catalog/loadingAnimation.gif" />');
                        $.getScript('<?php echo $p24_host; ?>inchtml/ajaxPayment/ajax.js?token='+result, function() {
                            P24_Transaction.init();
                            $('#ccMessage').css("display", "none");
                            <?php if($oneclick): ?>$('#P24_expYear').after('<label class="ccNotRemember" style="width: 250px; margin-top: 10px"><?=$cardNotRemember;?> <input type="checkbox" name="p24_ccNotRemember" id="p24_ccNotRemember"></label>');<?php endif;?>
                            $('#P24FormContainer form').submit(function() {
                                load = true;
                                checkCCData();
                            });
                        });
                        $('#p24_cc').modal({backdrop: 'static', keyboard: false});
                        $('#p24_cc').modal('show');
                    }
                    else
                        window.location='<?=$action2;?>'+result;
                }
                $("#button-confirm").prop('disabled', false);
            }});
        }
        else if($("input[name=p24_card]").is(':checked')) {
            $('#ccMessage').css("display", "inline-block");
            $('#ccMessage').html('<?=$cardChargeWait;?><br/><img src="image/catalog/loadingAnimation.gif" />');
            $('#p24_cc').modal({backdrop: 'static', keyboard: false});
            $('#p24_cc').modal('show');

            $.ajax({url: "index.php?route=extension/payment/przelewy24/chargeCard", type: "post", data: dane, success: function(result){
                if(result == 'OK') {
                    $('#ccMessage').text('<?=$cardSuccess;?>');
                    window.location='<?=$p24_url_return;?>';
                }
                else {
                    $('#ccMessage').text('<?=$cardChargeError;?>');
                }
                $("#button-confirm").prop('disabled', false);
            }});
        }
        else
            $('#p24_checkout').submit();
    });

    function checkCCData() {
        var hc = false;
        $('#P24FormContainer *').each(function() {
            if ($(this).hasClass('P24_input_error')) {
                $('#ccMessage').css("display", "none");
                hc = true;
            }
        });
        if(!hc && load) {
            $('#ccMessage').css("display", "inline-block");
            $('#ccMessage').html('<img src="image/catalog/loadingAnimation.gif" />');
        }
    }

    $('#P24FormContainer').bind('DOMSubtreeModified', function(e) {
        checkCCData();
    });



    $("input[name=p24_method],input[name=p24_card]").click(function () {
        if($("input[name=p24_method]:checked").val() == 129)
            $("#p24_raty").css("display", "inline");
        else
            $("#p24_raty").css("display", "none");

        $("div.p24_method_image").removeClass("p24_methods");
        $("div.p24_method_image").addClass("p24_methods");
    });

    $('input[type=radio]').change(function() {
        $('input[type=radio]:checked').not(this).prop('checked', false);
    });

    function p24Success(orderId) {
        var rem;
        var meth_id = $("input:radio[name=p24_method]:checked").val();
        $('#P24FormContainer').css("display", "none");
        if($('#p24_ccNotRemember').is(':checked')) {
            rem = 0;
        }
        else rem = 1;
        $.ajax({url: "index.php?route=extension/payment/przelewy24/trnVerify", type: "post", data: { id: orderId, sign: '<?=$p24_sign;?>', session: '<?=$p24_session_id;?>', amount: '<?=$p24_amount;?>', currency: '<?=$p24_currency;?>', remember: rem, method: meth_id }, success: function(data){
            if(data=="OK") {
                $('#ccMessage').css("display", "inline-block");
                $('#ccMessage').text('<?=$cardSuccess;?>');
                $(location).attr('href', '<?=$p24_url_return;?>');
            } else {
                $('#ccMessage').css("display", "inline-block");
                $('#ccMessage').text('<?=$cardWrongData;?>');
                $('#p24_cc').data('hideInterval', setTimeout(function(){
                    $('#p24_cc').modal('hide');
                }, 2000));
            }
        }});
    }
    function p24Failed(errorCode) {
        $('#P24FormContainer').children().remove();
        $('#ccMessage').css("display", "inline-block");
        $('#ccMessage').text('<?=$cardErrorAlert;?>'+errorCode);
        $('#p24_cc').data('hideInterval', setTimeout(function(){
            $('#p24_cc').modal('hide');
        }, 3000));
    }

    function reposition() {
        var modal = $(this), dialog = modal.find('.modal-dialog'), size = dialog.height();
        if(size < 300)
                size = 350;
            modal.css('display', 'block');
            dialog.css("margin-top", Math.max(0, ($(window).height() - size) / 2));
    }

    $(window).on('resize', function() {
        $('.modal:visible').each(reposition);
    });
    $('.modal').on('show.bs.modal', reposition);

</script>