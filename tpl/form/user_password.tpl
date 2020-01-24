[{oxscript include="js/libs/jqBootstrapValidation.min.js" priority=10}]
[{oxscript add="$('input,select,textarea').not('[type=submit]').jqBootstrapValidation();"}]

<form class="js-oxValidate form-horizontal" action="[{$oViewConf->getSelfActionLink()}]" name="changepassword" method="post" novalidate="novalidate">
    [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]

    <div class="hidden">
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="fnc" value="changePassword">
        <input type="hidden" name="cl" value="account_password">
        <input type="hidden" name="CustomError" value='user'>
        <input type="hidden" id="passwordLength" value="[{$oViewConf->getPasswordLength()}]">
    </div>

        <div class="form-group[{if $aErrors.oxuser__oxpassword}] oxInValid[{/if}]">
            <label class="control-label col-lg-3" for="passwordOld">[{oxmultilang ident="OLD_PASSWORD"}]</label>
            <div class="col-lg-5">
                <input type="password" id="passwordOld" name="password_old" class="js-oxValidate js-oxValidate_notEmpty form-control" required="">
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxpassword}]
                <div class="help-block"></div>
            </div>
        </div>
        <div class="form-group[{if $aErrors.oxuser__oxpassword}] oxInValid[{/if}]">
            [{block name="user_account_password"}]
            <label class="control-label col-lg-3" for="passwordNew">[{oxmultilang ident="NEW_PASSWORD"}]</label>
            <div class="col-lg-5">
                <input type="password" id="passwordNew" name="password_new" class="js-oxValidate js-oxValidate_notEmpty js-oxValidate_length js-oxValidate_match form-control" required="">
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxpassword}]
                <div class="help-block"></div>
            </div>
            [{/block}]
        </div>
        <div class="form-group[{if $aErrors.oxuser__oxpassword}] oxInValid[{/if}]">
            <label class="control-label col-lg-3" for="passwordNewConfirm">[{oxmultilang ident="CONFIRM_PASSWORD"}]</label>
            <div class="col-lg-5">
                <input type="password" id="passwordNewConfirm" name="password_new_confirm" class="js-oxValidate js-oxValidate_notEmpty js-oxValidate_length js-oxValidate_match form-control" required="" data-validation-matches-match="password_new" data-validation-matches-message="[{oxmultilang ident="ERROR_MESSAGE_PASSWORD_DO_NOT_MATCH"}]">
                <div class="help-block"></div>
                [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxpassword}]
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-offset-3 col-lg-5">
                <button id="savePass" type="submit" class="btn btn-primary" role="button">[{oxmultilang ident="SAVE"}]</button>
            </div>
        </div>
</form>
