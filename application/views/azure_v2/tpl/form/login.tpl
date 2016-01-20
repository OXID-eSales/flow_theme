[{oxscript include="js/libs/jqBootstrapValidation.min.js" priority=10}]
[{oxscript add="$('input,select,textarea').not('[type=submit]').jqBootstrapValidation();"}]

<form class="js-oxValidate" name="login" action="[{$oViewConf->getSslSelfLink()}]" method="post" role="form" novalidate="novalidate">
    <div class="hidden">
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="fnc" value="login_noredirect">
        <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
    </div>
    <div class="panel panel-default" id="optionLogin">
        <div class="panel-heading">
            <h3 class="panel-title">[{oxmultilang ident="ALREADY_CUSTOMER"}]</h3>
        </div>
        <div class="panel-body">
            [{block name="checkout_options_login_text"}]
                <p>[{oxmultilang ident="LOGIN_DESCRIPTION"}]</p>
            [{/block}]
            [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
            <div class="form-group [{if $aErrors}]oxInValid[{/if}]">
                <label class="control-label">[{oxmultilang ident="EMAIL_ADDRESS"}]</label>
                <input type="text" name="lgn_usr" class="form-control textbox js-oxValidate js-oxValidate_notEmpty" placeholder="[{oxmultilang ident="EMAIL_ADDRESS"}]" required="required">
                <div class="help-block"></div>
            </div>
            <div class="form-group [{if $aErrors}]oxInValid[{/if}]">
                <label class="control-label">[{oxmultilang ident="PASSWORD"}]</label>
                <div class="input-group">
                    <input type="password" name="lgn_pwd" class="form-control js-oxValidate js-oxValidate_notEmpty textbox stepsPasswordbox" placeholder="[{oxmultilang ident="PASSWORD"}]" required="required">
                    <span class="input-group-btn">
                        <a class="btn btn-default forgotPasswordOpener" id="step2PswdOpener" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=forgotpwd"}]" title="[{oxmultilang ident="FORGOT_PASSWORD"}]">?</a>
                    </span>
                </div>
                <div class="help-block"></div>
            </div>
        </div>
        <div class="panel-footer text-right">
            <button type="submit" class="btn btn-primary submitButton">[{oxmultilang ident="LOGIN"}] <i class="fa fa-caret-right"></i></button>
        </div>
    </div>
</form>
