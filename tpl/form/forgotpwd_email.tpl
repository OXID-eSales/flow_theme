[{oxscript include="js/libs/jqBootstrapValidation.min.js" priority=10}]
[{oxscript add="$('input,select,textarea').not('[type=submit]').jqBootstrapValidation();"}]

<p>
    [{oxmultilang ident="HAVE_YOU_FORGOTTEN_PASSWORD"}]<br>
    [{oxmultilang ident="HERE_YOU_SET_UP_NEW_PASSWORD"}]
</p>

<form class="form-horizontal" action="[{$oViewConf->getSelfActionLink()}]" name="forgotpwd" method="post" novalidate="novalidate">
    <div class="hidden">
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="fnc" value="forgotpassword">
        <input type="hidden" name="cl" value="forgotpwd">
        <input type="hidden" name="actcontrol" value="forgotpwd">
    </div>

    <div class="form-group">
        <label class="req control-label col-md-3">[{oxmultilang ident="YOUR_EMAIL_ADDRESS"}]</label>

        <div class="col-md-9">
            <input id="forgotPasswordUserLoginName[{$idPrefix}]" type="email" name="lgn_usr" value="[{$oView->getActiveUsername()}]" class="form-control" required="required">
            <p class="help-block"></p>
        </div>
    </div>

    [{block name="captcha_form"}][{/block}]

    <div class="form-group">
        <div class="col-md-9 col-md-offset-3">
            <button class="btn btn-primary submitButton" type="submit">[{oxmultilang ident="REQUEST_PASSWORD"}]</button>
        </div>
    </div>
</form>

[{oxmultilang ident="REQUEST_PASSWORD_AFTERCLICK"}]<br><br>
[{oxifcontent ident="oxforgotpwd" object="oCont"}]
    [{$oCont->oxcontents__oxcontent->value}]
[{/oxifcontent}]