<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            font-family: "Helvetica Neue", HelveticaNeue, Helvetica, "Lucida Grande", arial, sans-serif;
            font-size: 16px;
            font-weight: 400;
            background: #f4f4f4;
            color: #555;
            line-height: 22px;
        }

        h1, h2, h3, h4, h5 {
            color: #222;
        }

        h1 {
            font-weight: 700;
            font-size: 30px;
            line-height: 40px;
            margin: 30px 0 0;
        }

        h2 {
            font-size: 22px;
            font-weight: 700;
            line-height: 28px;
            margin: 30px 0 0;
        }

        h3 {
            font-size: 18px;
            line-height: 1.3em;
            margin: 30px 0 0;
        }

        h4 {
            color: #555;
            margin: 30px 0 30px 0;
        }

        p {
            margin: 0px 0 30px 0;
        }

        a {
            text-decoration: none;
            outline: 0;
            color: #F0473D;
        }

        #logo {
            margin-top: 20px;
        }

        .container {
            max-width: 660px;
            margin: 0 auto;
            padding-bottom: 40px;
        }

        #content {
            background: #fff;
            padding: 10px;
            margin-bottom: 50px;
        }

        .image {
            height: auto;
            max-width: 600px;
            width: 100%;
        }

        .text-center {
            text-align: center;
        }

        .cta {
            color: #888;
            text-align: center;
            margin: 40px 0;
        }

        .cta a {
            display: inline-block;
            background-color: #F0473D;
            color: white;
            padding: 0 20px 0 20px;
            line-height: 45px;
        }

        .cheers {
            margin-bottom: 0;
        }

        #header {
            margin-bottom: 40px;
        }

        #social-links {
            width: auto;
            text-align: center;
            margin-bottom: 30px;
        }

        #social-links a {
            font-size: 12px;
            margin-right: 5px;
            margin-bottom: 20px;
            font-weight: 400;
            color: #555;
            line-height: 25px;
            vertical-align: top;
            display: inline-block;
        }

        .grey-line {
            width: 240px;
            height: 1px;
            margin: 0 auto;
            border-top: 1px solid #d5d5d5;
        }

        #footer {
            width: auto;
        }

        #footer p {
            color: #555;
            text-align: center;
            font-size: 14px;
            line-height: 30px;
        }

        @media only screen and (max-device-width: 480px) {
            body, table, td, p, a, li, blockquote {
                -webkit-text-size-adjust: none !important;
            }

            body {
                font-size: 20px !important;
                letter-spacing: normal !important;
                line-height: 28px;
            }

            #content {
                padding: 10px !important;
                margin-bottom: 40px !important;
            }

            a {
                font-weight: 400 !important;
            }

            h1 {
                font-size: 30px !important;
                line-height: 40px !important;
                text-align: center !important;
            }

            h2 {
                line-height: 1.4em !important;
            }

            h3 {
                font-size: 28px !important;
                line-height: 1.4em !important;
            }

            .img-desktop {
                display: none !important;
            }

            #social-links {
                padding: 0 3px !important;
                margin-bottom: 10px !important;
            }

            #social-links img {
                width: 40px !important;
                height: 40px !important;
            }

            #social-links > a {
                font-size: 12px !important;
                margin-right: 5px !important;
                margin-bottom: 20px !important;
                font-weight: 400 !important;
            }

            .raster {
                width: 40px !important;
                height: 40px !important;
                margin: 10px 0 !important;
            }

            #header {
                text-align: center !important;
            }

            #header img {
                width: 252px !important;
            }

            #footer {
                padding: 0 10px !important;
            }

            #footer p, #footer a {
                font-size: 15px !important;
            }
        }

        @media only screen and (min-width: 481px) {
            #content {
                padding: 30px 40px 50px 40px !important;
            }

            #social-links a {
                margin-right: 25px !important;
                color: #555 !important;
                line-height: 25px !important;
                vertical-align: top !important;
                font-size: 14px !important;
                display: inline-block !important;
            }
        }
    </style>
</head>
<body style="margin: 0;padding: 0;font-family: 'Helvetica Neue', HelveticaNeue, Helvetica, 'Lucida Grande', arial, sans-serif;font-size: 16px;font-weight: 400;background: #f4f4f4;color: #555;line-height: 22px;">
<div class="container" style="max-width:660px;margin:0 auto;padding-bottom:20px;">

    <div id="header" style="margin-bottom:20px;">
        <a href="<?php echo $store_url; ?>" title="<?php echo $store_name; ?>">
            <img id="logo" src="<?php echo $logo; ?>" width="205" height="71" alt="<?php echo $store_name; ?>" title="<?php echo $store_name; ?>" style="margin-top:20px;">
        </a>
    </div>

    <div id="content" style="background:#fff;padding:20px 40px 50px 40px;margin-bottom:50px;border-radius:8px;">

        <h1 style="font-weight:700;font-size:30px;line-height:40px;color:#222;">
            <?php echo $text_hello; ?>
        </h1>

        <h2>
            <?php echo $text_update_order; ?>
        </h2>

        <p style="font-size:15px;line-height:20px;margin:0px 0 30px 0;color:#555;">
            <?php echo $text_update_date_added; ?>
        </p>

        <p style="font-size:15px;line-height:20px;margin:20px 0 30px 0;color:#555;">
            <?php echo $text_update_order_status; ?>
        </p>

        <?php if (isset($customer_id)) { ?>
            <p style="background-color:#fff6ce;display:inline-block;padding:10px;font-size:15px;line-height:20px;border-radius:8px;">
                <?php echo $text_link; ?>
                <a href="<?php echo $link; ?>" target="_blank" style="outline:0;font-size:15px;color:#ed4642;line-height:20px;text-decoration:none;">
                    <?php echo $link; ?>
                </a>
            </p>
        <?php } ?>


        <?php if (isset($comment)) { ?>
            <p style="background-color:#f7f7f7;display:inline-block;padding:10px;font-size:15px;line-height:20px;border-radius:8px;">
                <b><?php echo $text_shop_comment ?></b> <br>
                <i style="display:inline-block;padding:10px;font-size:15px;line-height:20px;">
                    <?php echo $comment; ?>
                </i>
            </p>
        <?php } ?>

        <p style="font-size:15px;line-height:20px;margin:20px 0 0px 0;color:#555;">
            <?php echo $text_regards; ?>
        </p>
    </div>

    <div id="social-links" style="width:auto;text-align:center;margin-bottom:30px;">

        <a href="//twitter.com/KamsTechnologie" target="_blank"
           style="font-size: 12px;margin-right: 5px;margin-bottom: 20px;font-weight: 400;color: #555;line-height: 25px;vertical-align: top;display: inline-block;">
            <img alt="twitter" class="raster"
                 src="https://kamstechnologies.pl/catalog/view/theme/default/image/mail/icon-twitter--new.png"
                 width="50" height="50">
            <br/>
            Twitter
        </a>
        <a href="//www.facebook.com/KamsTechnologies/" target="_blank"
           style="font-size: 12px;margin-right: 5px;margin-bottom: 20px;font-weight: 400;color: #555;line-height: 25px;vertical-align: top;display: inline-block;">
            <img alt="facebook" class="raster"
                 src="https://kamstechnologies.pl/catalog/view/theme/default/image/mail/icon-facebook--new.png"
                 width="50" height="50">
            <br/>
            Facebook
        </a>
        <a href="//www.instagram.com/kamstechnologies/" target="_blank"
           style="font-size: 12px;margin-right: 5px;margin-bottom: 20px;font-weight: 400;color: #555;line-height: 25px;vertical-align: top;display: inline-block;">
            <img alt="instagram" class="raster"
                 src="https://kamstechnologies.pl/catalog/view/theme/default/image/mail/icon-instagram--new.png"
                 width="50" height="50">
            <br/>
            Instagram
        </a>
        <a href="//www.youtube.com/channel/UCLKjcGcJxgrBpman9mmjtrA" target="_blank"
           style="font-size: 12px;margin-right: 5px;margin-bottom: 20px;font-weight: 400;color: #555;line-height: 25px;vertical-align: top;display: inline-block;">
            <img alt="youtube" class="raster"
                 src="https://kamstechnologies.pl/catalog/view/theme/default/image/mail/icon-youtube--new.png"
                 width="50" height="50">
            <br/>
            Youtube
        </a>
    </div>

    <div class="grey-line" style="width: 240px;height: 1px;margin: 0 auto;border-top: 1px solid #d5d5d5;"></div>

    <div style="width:auto;" id="footer">
        <p style="margin:30px 0 30px 0;color:#555;text-align:center;font-size:14px;line-height:30px">
            Kams Technologies, ul. Jana Pawła Woronicza 3, 31-409 Kraków<br>
            <?php echo $text_footer; ?>
        </p>

        <div class="grey-line" style="width: 240px;height: 1px;margin: 0 auto;border-top: 1px solid #d5d5d5;"></div>

        <h5 style="color:#555;text-align:center;margin: 30px 0 30px 0;"><?php echo $text_desc_footer; ?></h5>
        <div style="text-align: center">
            <img alt="Kams Technologies"
                 src="https://kamstechnologies.pl/catalog/view/theme/default/image/mail/logotype.png"
                 width="60" height="60">
        </div>
    </div>
</div>
</body>
</html>