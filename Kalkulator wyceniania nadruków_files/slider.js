$(document).ready(function(){
    // hide #back-top first
    $("#back-top").hide();
    // fade in #back-top
    $(function () {
        $(window).scroll(function () {
            if ($(this).scrollTop() > 300) {
                $('#back-top').fadeIn();
                $('iframe#drift-widget').stop().animate({'bottom': '100px'}, 500);
            } else {
                $('#back-top').fadeOut();
                $('iframe#drift-widget').stop().animate({'bottom': '24px'}, 500);
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