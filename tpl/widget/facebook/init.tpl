[{if $oViewConf->getFbAppId()}]
    <div id="fb-root"></div>
    [{oxscript include="js/widgets/oxfacebook.min.js"}]
    [{if $oView->isActive('FacebookConfirm') && !$oView->isFbWidgetVisible()}]
        <div class="modal fade" id="fbinfo" tabindex="-1" role="dialog" aria-labelledby="fbinfoLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <span class="h4 modal-title" id="fbinfoLabel">[{oxmultilang ident="FACEBOOK_ENABLE_INFOTEXTHEADER"}]</span>
                    </div>
                    <div class="modal-body">[{oxcontent ident="oxfacebookenableinfotext"}]</div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">[{oxmultilang ident="CLOSE"}]</button>
                    </div>
                </div>
            </div>
        </div>

        [{capture name="facebookInit"}]
            [{oxscript include="js/libs/jquery.cookie.min.js"}]
            [{assign var="sFbAppId" value=$oViewConf->getFbAppId()}]
            [{assign var="sLocale" value="FACEBOOK_LOCALE"|oxmultilangassign}]
            [{assign var="sLoginUrl" value=$oView->getLink()|oxaddparams:"fblogin=1"}]
            [{assign var="sLogoutUrl" value=$oViewConf->getLogoutLink()}]
            [{oxscript add="$('.oxfbenable').click( function() { oxFacebook.showFbWidgets('`$sFbAppId`','`$sLocale`','`$sLoginUrl`','`$sLogoutUrl`'); return false;});"}]
        [{/capture}]
    [{else}]
        [{capture name="facebookInit"}]
            oxFacebook.fbInit("[{$oViewConf->getFbAppId()}]", "[{oxmultilang ident="FACEBOOK_LOCALE"}]", "[{$oView->getLink()|oxaddparams:"fblogin=1"}]", "[{$oViewConf->getLogoutLink()}]");
        [{/capture}]
    [{/if}]
    [{oxscript add="`$smarty.capture.facebookInit`"}]
[{/if}]