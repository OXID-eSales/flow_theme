[{block name="checkout_steps_main"}]
    <ol class="checkoutSteps">
        [{if $oxcmp_basket->getProductsCount()}]
            [{assign var=showStepLinks value=true}]
        [{/if}]

        [{block name="checkout_steps_basket"}]
            <li class="step1[{if $active == 1}] active [{elseif $active > 1}] passed [{/if}]">
                [{if $showStepLinks}]<a href="[{oxgetseourl ident=$oViewConf->getBasketLink()}]">[{/if}]
                <div class="num">1</div>
                <div class="text">
                    [{oxmultilang ident="STEPS_BASKET"}]
                </div>
                [{if $showStepLinks}]</a>[{/if}]
            </li>
        [{/block}]

        [{assign var=showStepLinks value=false}]
        [{if !$oView->isLowOrderPrice() && $oxcmp_basket->getProductsCount()}]
            [{assign var=showStepLinks value=true}]
        [{/if}]

        [{block name="checkout_steps_send"}]
            <li class="step2[{if $active == 2}] active [{elseif $active > 2}] passed [{/if}]">
                [{if $showStepLinks}]<a href="[{oxgetseourl ident=$oViewConf->getOrderLink()}]">[{/if}]
                <div class="num">2</div>
                <div class="text">
                    [{oxmultilang ident="STEPS_SEND"}]
                </div>
                [{if $showStepLinks}]</a>[{/if}]
            </li>
        [{/block}]

        [{assign var=showStepLinks value=false}]
        [{if $active != 1 && $oxcmp_user && !$oView->isLowOrderPrice() && $oxcmp_basket->getProductsCount()}]
            [{assign var=showStepLinks value=true}]
        [{/if}]

        [{block name="checkout_steps_pay"}]
            <li class="step3[{if $active == 3}] active [{elseif $active > 3}] passed [{/if}]">
                [{if $showStepLinks}]<a [{if $oViewConf->getActiveClassName() == "user"}]id="paymentStep"[{/if}] href="[{oxgetseourl ident=$oViewConf->getPaymentLink()}]">[{/if}]
                <div class="num">3</div>
                <div class="text">
                    [{oxmultilang ident="STEPS_PAY"}]
                </div>
                [{if $showStepLinks}]</a>[{/if}]
            </li>
            [{*[{oxscript add="$('#paymentStep').click( function() { $('#userNextStepBottom').click();return false;});"}]*}]
        [{/block}]

        [{assign var=showStepLinks value=false}]
        [{if $active != 1 && $oxcmp_user && $oxcmp_basket->getProductsCount() && $oView->getPaymentList() && !$oView->isLowOrderPrice()}]
            [{assign var=showStepLinks value=true}]
        [{/if}]

        [{block name="checkout_steps_order"}]
            <li class="step4[{if $active == 4}] active [{elseif $active > 4}] passed [{/if}]">
                [{if $showStepLinks}]<a [{if $oViewConf->getActiveClassName() == "payment"}]id="orderStep"[{/if}] href="[{if $oViewConf->getActiveClassName() == "payment"}]javascript:document.forms.order.submit();[{else}][{oxgetseourl ident=$oViewConf->getOrderConfirmLink()}][{/if}]">[{/if}]
                <div class="num">4</div>
                <div class="text">
                    [{oxmultilang ident="STEPS_ORDER"}]
                </div>
                [{if $showStepLinks}]</a>[{/if}]
            </li>
            [{*[{oxscript add="$('#orderStep').click( function() { $('#paymentNextStepBottom').click();return false;});"}]*}]
        [{/block}]

        [{block name="checkout_steps_laststep"}]
            <li class="step5[{if $active == 5}] activeLast [{else}] defaultLast [{/if}] ">
                <div class="num">5</div>
                <div class="text">
                    [{oxmultilang ident="READY"}]
                </div>
            </li>
        [{/block}]
    </ol>
    <div class="clearfix"></div>
    <div class="spacer"></div>
[{/block}]