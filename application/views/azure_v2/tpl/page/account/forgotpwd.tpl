[{capture append="oxidBlock_pageBody"}]
    [{if $oView->isEnabledPrivateSales()}]
        [{oxid_include_widget cl="oxwCookieNote" _parent=$oView->getClassName() nocookie=1}]
    [{/if}]
[{/capture}]
[{capture append="oxidBlock_content"}]

    [{if $oView->showUpdateScreen()}]
        [{assign var="template_title" value="PAGE_ACCOUNT_FORGOTPWD_UPDATETITLE"|oxmultilangassign}]
    [{elseif $oView->updateSuccess()}]
        [{assign var="template_title" value="PAGE_ACCOUNT_FORGOTPWD_UPDATESUCCESSTITLE"|oxmultilangassign}]
    [{else}]
        [{assign var="template_title" value="PAGE_ACCOUNT_FORGOTPWD_TITLE"|oxmultilangassign}]
    [{/if}]

    <h1 class="page-header">[{$template_title}]</h1>

    [{if $oView->isExpiredLink()}]
        <div class="alert alert-danger">[{oxmultilang ident="FORGOTPWD_ERRLINKEXPIRED"}]</div>
    [{elseif $oView->showUpdateScreen()}]
        [{include file="form/forgotpwd_change_pwd.tpl"}]
    [{elseif $oView->updateSuccess()}]
        <div class="alert alert-success">[{oxmultilang ident="PAGE_ACCOUNT_FORGOTPWD_UPDATE_SUCCESS"}]</div>

        <form action="[{$oViewConf->getSelfActionLink()}]" name="forgotpwd" method="post" role="form">
            <div>
                [{$oViewConf->getHiddenSid()}]
                <input type="hidden" name="cl" value="start">
                <button id="backToShop" class="submitButton largeButton btn btn-primary" type="submit">
                    <i class="fa fa-caret-left"></i> [{oxmultilang ident="PAGE_ACCOUNT_FORGOTPWD_BACKTOSHOP"}]
                </button>
            </div>
        </form>
    [{else}]
        [{if $oView->getForgotEmail()}]
            <div class="alert alert-info">[{oxmultilang ident="PAGE_ACCOUNT_FORGOTPWD_PWDWASSEND"}] [{$oView->getForgotEmail()}]</div>
            <div class="bar">
                <form action="[{$oViewConf->getSelfActionLink()}]" name="forgotpwd" method="post">
                    <div>
                        [{$oViewConf->getHiddenSid()}]
                        <input type="hidden" name="cl" value="start">
                        <button id="backToShop" class="btn btn-primary submitButton largeButton" type="submit">
                            <i class="fa fa-caret-left"></i> [{oxmultilang ident="PAGE_ACCOUNT_FORGOTPWD_BACKTOSHOP"}]
                        </button>
                    </div>
                 </form>
             </div>
        [{else}]
            [{include file="form/forgotpwd_email.tpl"}]
        [{/if}]
    [{/if}]

    [{if !$oView->isActive('PsLogin')}]
        [{insert name="oxid_tracker" title=$template_title}]
    [{/if}]
[{/capture}]
[{if $oView->isActive('PsLogin')}]
    [{include file="layout/popup.tpl"}]
[{else}]
    [{include file="layout/page.tpl"}]
[{/if}]

