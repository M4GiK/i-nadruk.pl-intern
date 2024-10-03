<?php 
/*
* CookieMaster Module
* TPL CATALOG
* Developed for OpenCart 2.x
* Author Keyword Studio - http://www.keywordstudio.it
* @01/2017
* Under GNU GPL license v3.
*
* Improved by M4GiK Software
*/

$cookiemaster_cookietext = html_entity_decode($cookiemaster_cookietext);
$datanew = date('D, j M Y', strtotime("+$cookiemaster_days days"));
if($cookiemaster_dsplposition == "top"){$positioncm = "bottom:auto; top:0;";}else{$positioncm = "";}
?>
<style>
#cookiemaster{<?php echo $positioncm; ?> color:#<?php echo $cookiemaster_txtcolor;?>; background:#<?php echo $cookiemaster_cookiebck;?>; border-top:1px solid #<?php echo $cookiemaster_bordcolor;?>;}
#cookiemaster #accept{background:#<?php echo $cookiemaster_bckbutton;?>; color:#<?php echo $cookiemaster_clrbutton;?>; border:1px solid #<?php echo $cookiemaster_brdbutton;?>;}
#cookiemaster #accept:hover{background:#<?php echo $cookiemaster_bckbuttonhvr;?>; color:#<?php echo $cookiemaster_clrbuttonhvr;?>;}
</style>
<script type="text/javascript">
                $(document).ready(function() {
                var myCookie = document.cookie.replace(/(?:(?:^|.*;\s*)accepted\s*\=\s*([^;]*).*$)|^.*$/, "$1");
                    if (myCookie != "yes") {
                        $('#cookiemaster').show();
                        $('#accept').click(function() {
                            document.cookie = "accepted=yes; expires=<?php echo $datanew;?> 12:00:00 GMT; path=/";
                            $('#cookiemaster').slideUp('slow');
                        });
                    }
                });        
            </script>
<div id="cookiemaster" class="container">
    <div id="cookiemastertext"><button id="accept"><?php echo $cookiemaster_txtbutton; ?></button><?php echo $cookiemaster_cookietext; ?></div>
</div>
