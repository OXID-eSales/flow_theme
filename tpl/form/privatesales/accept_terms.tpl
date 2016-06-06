<div class="well">
    <form name="login" class="js-oxValidate" action="[{$oViewConf->getSslSelfLink()}]" method="post" id="private-sales-login">

        <div>
            [{$oViewConf->getHiddenSid()}]
            [{$oViewConf->getNavFormParams()}]
            <input type="hidden" name="fnc" value="login_noredirect">
            <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
            <input type="hidden" name="tpl" value="[{$oViewConf->getActTplName()}]">
            <input type="hidden" name="oxloadid" value="[{$oViewConf->getActContentLoadId()}]">
            [{if $oView->getArticleId()}]
              <input type="hidden" name="aid" value="[{$oView->getArticleId()}]">
            [{/if}]
            [{if $oView->getProduct()}]
              [{assign var="product" value=$oView->getProduct()}]
              <input type="hidden" name="anid" value="[{$product->oxarticles__oxnid->value}]">
            [{/if}]
            <input type="hidden" name="ord_agb" value="0">
        </div>

        <div class="checkbox">
            <label>
                <input type="checkbox" name="ord_agb" value="1" class="agb-check"> [{oxifcontent ident="oxrighttocancellegend" object="oContent"}]
                [{$oContent->oxcontents__oxcontent->value}]
                [{/oxifcontent}]
            </label>
        </div>
        <button type="submit" class="submitButton btn btn-default" disabled="disabled">[{oxmultilang ident="LOGIN"}]</button>

    </form>
</div>