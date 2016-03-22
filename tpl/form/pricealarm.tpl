[{oxscript include="js/libs/jqBootstrapValidation.min.js" priority=10}]
[{oxscript add="$('input,select,textarea').not('[type=submit]').jqBootstrapValidation();"}]

[{assign var="currency" value=$oView->getActCurrency()}]
<p class="alert alert-info">[{oxmultilang ident="MESSAGE_PRICE_ALARM_PRICE_CHANGE"}]</p>
<form class="js-oxValidate form-horizontal" name="pricealarm" action="[{$oViewConf->getSelfActionLink()}]" method="post" novalidate="novalidate">
    <div>
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="cl" value="[{$oViewConf->getTopActiveClassName()}]">
        [{if $oDetailsProduct}]
            <input type="hidden" name="anid" value="[{$oDetailsProduct->oxarticles__oxid->value}]">
        [{/if}]
        <input type="hidden" name="fnc" value="addme">
    </div>
    <div class="form-group">
        <label class="req control-label col-lg-3">[{oxmultilang ident="YOUR_PRICE"}] ([{$currency->sign}]):</label>
        <div class="col-lg-9">
            <input class="form-control" type="text" name="pa[price]" value="[{oxhasrights ident="SHOWARTICLEPRICE"}][{if $product}][{$product->getFPrice()}][{/if}][{/oxhasrights}]" maxlength="32" required="required">
            <div class="help-block"></div>
        </div>
    </div>
    <div class="form-group">
        <label class="req control-label col-lg-3">[{oxmultilang ident="EMAIL"}]:</label>
        <div class="col-lg-9">
            <input class="form-control" type="email" name="pa[email]" value="[{if $oxcmp_user}][{$oxcmp_user->oxuser__oxusername->value}][{/if}]" maxlength="128" required="required">
            <div class="help-block"></div>
        </div>
    </div>

    [{block name="captcha_form"}][{/block}]

    <div class="form-group">
        <div class="col-lg-9 col-lg-offset-3">
            <button class="submitButton btn btn-primary" type="submit">[{oxmultilang ident="SEND"}]</button>
        </div>
    </div>
</form>