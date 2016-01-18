[{if $oxcmp_shop->oxshops__oxproductive->value}]
    [{oxscript include="js/libs/jqBootstrapValidation.min.js" priority=10}]
[{else}]
    [{oxscript include="js/libs/jqBootstrapValidation.js" priority=10}]
[{/if}]
[{oxscript add="$('input,select,textarea').not('[type=submit]').jqBootstrapValidation();"}]

[{assign var="currency" value=$oView->getActCurrency()}]
<p class="alert alert-info">[{oxmultilang ident="FORM_PRICEALARM_PRICEALARMMESSAGE"}]</p>
<form class="js-oxValidate form-horizontal" name="pricealarm" action="[{$oViewConf->getSelfActionLink()}]" method="post" novalidate="novalidate">
    <div>
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="cl" value="[{$oViewConf->getTopActiveClassName()}]">
        [{if $oDetailsProduct}]
            <input type="hidden" name="anid" value="[{$oDetailsProduct->oxarticles__oxid->value}]">
        [{/if}]
        <input type="hidden" name="fnc" value="addme">
        [{assign var="oCaptcha" value=$oView->getCaptcha()}]
        <input type="hidden" name="c_mach" value="[{$oCaptcha->getHash()}]"/>
    </div>
    <div class="form-group">
        <label class="req control-label col-lg-3">[{oxmultilang ident="FORM_PRICEALARM_YOURPRICE"}] ([{$currency->sign}]):</label>
        <div class="col-lg-9">
            <input class="form-control" type="text" name="pa[price]" value="[{oxhasrights ident="SHOWARTICLEPRICE"}][{if $product}][{$product->getFPrice()}][{/if}][{/oxhasrights}]" maxlength="32" required="required">
            <div class="help-block"></div>
        </div>
    </div>
    <div class="form-group">
        <label class="req control-label col-lg-3">[{oxmultilang ident="FORM_PRICEALARM_EMAIL"}]:</label>
        <div class="col-lg-9">
            <input class="form-control" type="email" name="pa[email]" value="[{if $oxcmp_user}][{$oxcmp_user->oxuser__oxusername->value}][{/if}]" maxlength="128" required="required">
            <div class="help-block"></div>
        </div>
    </div>
    <div class="form-group">
        <label class="req control-label col-lg-3">[{oxmultilang ident="FORM_PRICEALARM_VERIFICATIONCODE"}]:</label>
        <div class="col-lg-9">
            <div class="input-group">
                [{if $oCaptcha->isImageVisible()}]
                    <span class="input-group-addon">
                        <img class="verificationCode" src="[{$oCaptcha->getImageUrl()}]" alt="[{oxmultilang ident="FORM_PRICEALARM_VERIFICATIONCODE"}]">
                    </span>
                [{else}]
                    <span class="input-group-addon verificationCode" id="verifyTextCode">[{$oCaptcha->getText()}]</span>
                [{/if}]
                <input class="form-control" type="text" name="c_mac" value="" required="required">
            </div>
            <div class="help-block"></div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-lg-9 col-lg-offset-3">
            <button class="submitButton btn btn-primary" type="submit">[{oxmultilang ident="FORM_PRICEALARM_SEND"}]</button>
        </div>
    </div>
</form>