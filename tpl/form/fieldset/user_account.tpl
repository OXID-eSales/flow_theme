<div class="form-group[{if $aErrors.oxuser__oxusername}] oxInValid[{/if}]">
    [{block name="user_account_username"}]
        <label class="control-label col-lg-3 req" for="userLoginName">[{oxmultilang ident="EMAIL_ADDRESS"}]</label>
        <div class="col-lg-9">
            <input id="userLoginName" class="form-control js-oxValidate js-oxValidate_notEmpty js-oxValidate_email" type="email" name="lgn_usr" value="[{$oView->getActiveUsername()}]" required="required">
            <div class="help-block"></div>
        </div>
    [{/block}]
</div>
<div class="form-group[{if $aErrors.oxuser__oxpassword}] oxInValid[{/if}]">
    [{block name="user_account_password"}]
        <label class="control-label col-lg-3 req" for="userPassword">[{oxmultilang ident="PASSWORD"}]</label>
        <input type="hidden" id="passwordLength" value="[{$oViewConf->getPasswordLength()}]">
        <div class="col-lg-9">
            <input id="userPassword" class="form-control textbox js-oxValidate js-oxValidate_notEmpty js-oxValidate_length js-oxValidate_match" type="password" name="lgn_pwd" value="[{$lgn_pwd}]" required="required">
            <div class="help-block"></div>
        </div>
    [{/block}]
</div>
<div class="form-group[{if $aErrors.oxuser__oxpassword}] oxInValid[{/if}]">
    [{block name="user_account_confirmpwd"}]
        <label class="control-label col-lg-3 req">[{oxmultilang ident="CONFIRM_PASSWORD"}]</label>
        <div class="col-lg-9">
            <input id="userPasswordConfirm" class="form-control textbox js-oxValidate js-oxValidate_notEmpty js-oxValidate_length js-oxValidate_match" type="password" name="lgn_pwd2" value="[{$lgn_pwd2}]" required="required">
            <div class="help-block"></div>
        </div>
    [{/block}]
</div>
[{block name="user_account_newsletter"}]
    <div class="form-group">
        <div class="col-lg-9 col-lg-offset-3">
            <input type="hidden" name="blnewssubscribed" value="0">
            <div class="checkbox">
                <label>
                    <input type="checkbox" name="blnewssubscribed" value="1" [{if $oView->isNewsSubscribed()}]checked[{/if}]> [{oxmultilang ident="NEWSLETTER_SUBSCRIPTION"}]
                </label>
            </div>
            <span class="help-block">[{oxmultilang ident="MESSAGE_NEWSLETTER_SUBSCRIPTION"}]</span>
        </div>
    </div>
[{/block}]