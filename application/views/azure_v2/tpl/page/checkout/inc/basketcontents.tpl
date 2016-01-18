[{* basket contents *}]
[{oxscript include="js/widgets/oxbasketchecks.min.js" priority=10}]
[{oxscript include="js/libs/jqBootstrapValidation.min.js" priority=10}]
[{oxscript add="$('#checkAll, #basketRemoveAll').oxBasketChecks();"}]
[{oxscript add="$('input,select,textarea').not('[type=submit]').jqBootstrapValidation();"}]
[{assign var="currency" value=$oView->getActCurrency()}]

<form name="basket[{$basketindex}]" id="basket_form" action="[{$oViewConf->getSelfActionLink()}]" method="post">
    [{$oViewConf->getHiddenSid()}]
    <input type="hidden" name="cl" value="basket">
    <input type="hidden" name="fnc" value="changebasket">
    <input type="hidden" name="CustomError" value="basket">

    [{* Nur für Mobilgeräte <768px sichtbar *}]
    <div class="visible-xs" id="basketcontents_list">
        [{include file="page/checkout/inc/basketcontents_list.tpl"}]
    </div>
    [{* Für alle Geräte >=768px sichtbar *}]
    <div class="hidden-xs" id="basketcontents_table">
        [{include file="page/checkout/inc/basketcontents_table.tpl"}]
    </div>
</form>

[{if $oViewConf->getShowVouchers() && $oViewConf->getActiveClassName() == 'basket'}]
    [{block name="checkout_basket_vouchers"}]
        <div id="basketVoucher" class="pull-left">
            <form name="voucher" action="[{$oViewConf->getSelfActionLink()}]" method="post" class="js-oxValidate form-inline" role="form" novalidate="novalidate">
                <div class="couponBox" id="coupon">
                    <div class="hidden">
                        [{$oViewConf->getHiddenSid()}]
                        <input type="hidden" name="cl" value="basket">
                        <input type="hidden" name="fnc" value="addVoucher">
                        <input type="hidden" name="CustomError" value="basket">
                    </div>

                    <div class="form-group">
                        <label class="req sr-only" for="input_voucherNr">[{oxmultilang ident="PAGE_CHECKOUT_BASKET_ENTERCOUPONNUMBER"}]</label>
                        <div class="input-group">
                            <input type="text" name="voucherNr" size="30" class="form-control js-oxValidate js-oxValidate_notEmpty" id="input_voucherNr" placeholder="[{oxmultilang ident="PAGE_CHECKOUT_BASKET_ENTERCOUPONNUMBER"}]" required="required">
                            <span class="input-group-btn">
                                <button type="submit" class="btn btn-primary submitButton"><i class="fa fa-gift"></i> [{oxmultilang ident="PAGE_CHECKOUT_BASKET_SUBMITCOUPON"}]</button>
                            </span>
                        </div>
                        <div class="help-block"></div>
                    </div>


                    [{foreach from=$Errors.basket item=oEr key=key}]
                        [{if $oEr->getErrorClassType() == 'oxVoucherException'}]
                            <div class="alert alert-danger">
                                [{oxmultilang ident="COUPON_NOT_ACCEPTED" args=$oEr->getValue('voucherNr')}]
                                <strong>[{oxmultilang ident="REASON" suffix="COLON"}]</strong>
                                [{$oEr->getOxMessage()}]
                            </div>
                        [{/if}]
                    [{/foreach}]
                </div>
            </form>
        </div>
    [{/block}]
[{/if}]

[{block name="checkout_basketcontents_summary"}]
    <div id="basketSummary" class="pull-right summary[{if $oViewConf->getActiveClassName() == 'order'}] orderSummary[{/if}]">
        [{*  basket summary  *}]
        <table class="table table-bordered table-striped">
            [{if !$oxcmp_basket->getDiscounts()}]
                [{block name="checkout_basketcontents_nodiscounttotalnet"}]
                    <tr>
                        <th>[{oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_TOTALNET"}]</th>
                        <td id="basketTotalProductsNetto">[{$oxcmp_basket->getProductsNetPrice()}]&nbsp;[{$currency->sign}]</td>
                    </tr>
                [{/block}]

                [{block name="checkout_basketcontents_nodiscountproductvats"}]
                    [{foreach from=$oxcmp_basket->getProductVats() item=VATitem key=key}]
                        <tr>
                            <th>[{oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_TAX1"}]&nbsp;[{$key}][{oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_TAX2"}]</th>
                            <td>[{$VATitem}]&nbsp;[{$currency->sign}]</td>
                        </tr>
                    [{/foreach}]
                [{/block}]

                [{block name="checkout_basketcontents_nodiscounttotalgross"}]
                    <tr>
                        <th>[{oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_TOTALGROSS"}]</th>
                        <td id="basketTotalProductsGross">[{$oxcmp_basket->getFProductsPrice()}]&nbsp;[{$currency->sign}]</td>
                    </tr>
                [{/block}]
            [{else}]
                [{if $oxcmp_basket->isPriceViewModeNetto()}]
                    [{block name="checkout_basketcontents_discounttotalnet"}]
                        <tr>
                            <th>[{oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_TOTALNET"}]</th>
                            <td id="basketTotalProductsNetto">[{$oxcmp_basket->getProductsNetPrice()}]&nbsp;[{$currency->sign}]</td>
                        </tr>
                    [{/block}]
                [{else}]
                     [{block name="checkout_basketcontents_discounttotalgross"}]
                        <tr>
                            <th>[{oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_TOTALGROSS"}]</th>
                            <td id="basketTotalProductsGross">[{$oxcmp_basket->getFProductsPrice()}]&nbsp;[{$currency->sign}]</td>
                        </tr>
                    [{/block}]
                [{/if}]

                [{block name="checkout_basketcontents_discounts"}]
                    [{foreach from=$oxcmp_basket->getDiscounts() item=oDiscount name=test_Discounts}]
                        <tr>
                            <th>
                                <b>[{if $oDiscount->dDiscount < 0}][{oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_CHARGE"}][{else}][{oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_DISCOUNT2"}][{/if}]&nbsp;</b>
                                [{$oDiscount->sDiscount}]
                            </th>
                            <td>
                                [{if $oDiscount->dDiscount < 0}][{$oDiscount->fDiscount|replace:"-":""}][{else}]-[{$oDiscount->fDiscount}][{/if}]&nbsp;[{$currency->sign}]
                            </td>
                        </tr>
                    [{/foreach}]
                [{/block}]

                [{if !$oxcmp_basket->isPriceViewModeNetto()}]
                    [{block name="checkout_basketcontents_totalnet"}]
                        <tr>
                            <th>[{oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_TOTALNET"}]</th>
                            <td id="basketTotalNetto">[{$oxcmp_basket->getProductsNetPrice()}]&nbsp;[{$currency->sign}]</td>
                        </tr>
                    [{/block}]
                [{/if}]

                [{block name="checkout_basketcontents_productvats"}]
                    [{foreach from=$oxcmp_basket->getProductVats() item=VATitem key=key}]
                        <tr>
                            <th>[{oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_TAX1"}] [{$key}][{oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_TAX2"}]</th>
                            <td>[{$VATitem}]&nbsp;[{$currency->sign}]</td>
                        </tr>
                    [{/foreach}]
                [{/block}]

                [{if $oxcmp_basket->isPriceViewModeNetto()}]
                    [{block name="checkout_basketcontents_totalgross"}]
                        <tr>
                            <th>[{oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_TOTALGROSS"}]</th>
                            <td id="basketTotalGross">[{$oxcmp_basket->getFProductsPrice()}]&nbsp;[{$currency->sign}]</td>
                        </tr>
                    [{/block}]
                [{/if}]
            [{/if}]

            [{block name="checkout_basketcontents_voucherdiscount"}]
                [{if $oViewConf->getShowVouchers() && $oxcmp_basket->getVoucherDiscValue()}]
                    [{foreach from=$oxcmp_basket->getVouchers() item=sVoucher key=key name=Voucher}]
                        <tr class="couponData">
                            <th><span><strong>[{oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_COUPON"}]</strong>&nbsp;([{oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_NOMBER"}] [{$sVoucher->sVoucherNr}])</span>
                            [{if $editable}]
                                <a href="[{$oViewConf->getSelfLink()}]&amp;cl=basket&amp;fnc=removeVoucher&amp;voucherId=[{$sVoucher->sVoucherId}]&amp;CustomError=basket" class="removeFn">[{oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_REMOVE2"}]</a>
                            [{/if}]
                            </th>
                            <td>-<strong>[{$sVoucher->fVoucherdiscount}]&nbsp;[{$currency->sign}]</strong></td>
                        </tr>
                    [{/foreach}]
                [{/if}]
            [{/block}]

            [{block name="checkout_basketcontents_delcosts"}]
                [{assign var="deliveryCost" value=$oxcmp_basket->getDeliveryCost()}]
                [{if $deliveryCost && ($oxcmp_basket->getBasketUser() || $oViewConf->isFunctionalityEnabled('blCalculateDelCostIfNotLoggedIn') ) }]
                    [{if $oViewConf->isFunctionalityEnabled('blShowVATForDelivery') }]
                        <tr>
                            <th>[{ oxmultilang ident="SHIPPING_NET" suffix="COLON" }]</th>
                            <td id="basketDeliveryNetto">[{oxprice price=$deliveryCost->getNettoPrice() currency=$currency }]</td>
                        </tr>
                        [{if $deliveryCost->getVatValue()}]
                        <tr>
                            [{if $oxcmp_basket->isProportionalCalculationOn() }]
                                <th>[{oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT" suffix="COLON"}]</th>
                            [{else}]
                                <th>[{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$deliveryCost->getVat()}]</th>
                            [{/if}]
                            <td id="basketDeliveryVat">[{oxprice price=$deliveryCost->getVatValue() currency=$currency}]</td>
                        </tr>
                        [{/if}]
                    [{else}]
                    <tr>
                        <th>[{ oxmultilang ident="SHIPPING_COST" suffix="COLON" }]</th>
                        <td id="basketDeliveryGross">[{oxprice price=$deliveryCost->getBruttoPrice() currency=$currency}]</td>
                    </tr>
                    [{/if}]
                [{/if}]
            [{/block}]

            [{block name="checkout_basketcontents_paymentcosts"}]
                [{if $oxcmp_basket->getPayCostNet()}]
                    <tr>
                        <th>[{if $oxcmp_basket->getPaymentCosts() >= 0}][{oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_PAYMENT"}][{else}][{oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_CHARGE2"}][{/if}] [{oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_DISCOUNT3"}]</th>
                        <td id="basketPaymentNetto">[{$oxcmp_basket->getPayCostNet()}]&nbsp;[{$currency->sign}]</td>
                    </tr>
                    [{if $oxcmp_basket->getPayCostVat()}]
                        <tr>
                            [{if $oxcmp_basket->isProportionalCalculationOn()}]
                                <th>[{oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT"}]:</th>
                            [{else}]
                                <th>[{oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_PAYMENTTAX1"}] [{$oxcmp_basket->getPayCostVatPercent()}] [{oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_PAYMENTTAX2"}]</th>
                            [{/if}]
                            <td id="basketPaymentVat">[{$oxcmp_basket->getPayCostVat()}]&nbsp;[{$currency->sign}]</td>
                        </tr>
                    [{/if}]
                [{elseif $oxcmp_basket->getFPaymentCosts()}]
                    <tr>
                        <th>[{if $oxcmp_basket->getPaymentCosts() >= 0}][{oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_PAYMENT"}][{else}][{oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_CHARGE2"}][{/if}] [{oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_DISCOUNT3"}]</th>
                        <td id="basketPaymentGross">[{$oxcmp_basket->getFPaymentCosts()}]&nbsp;[{$currency->sign}]</td>
                    </tr>
                [{/if}]
            [{/block}]

            [{block name="checkout_basketcontents_ts"}]
                [{if $oxcmp_basket->getTsProtectionCosts()}]
                    [{if $oxcmp_basket->getTsProtectionNet()}]
                        <tr>
                            <th>[{oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_TSPROTECTION"}]</th>
                            <td id="basketTSNetto">[{$oxcmp_basket->getTsProtectionNet()}]&nbsp;[{$currency->sign}]</td>
                        </tr>
                        [{if $oxcmp_basket->getTsProtectionVat()}]
                            <tr>
                                [{if $oxcmp_basket->isProportionalCalculationOn()}]
                                    <th>[{oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT"}]:</th>
                                [{else}]
                                    <th>[{oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_TSPROTECTIONCHARGETAX1"}] [{$oxcmp_basket->getTsProtectionVatPercent()}][{oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_TSPROTECTIONCHARGETAX2"}]</th>
                                [{/if}]
                                <td id="basketTSVat">[{$oxcmp_basket->getTsProtectionVat()}]&nbsp;[{$currency->sign}]</td>
                            </tr>
                        [{/if}]
                    [{elseif $oxcmp_basket->getFTsProtectionCosts()}]
                        <tr>
                            <th>[{oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_TSPROTECTION"}]</th>
                            <td id="basketTSGross">[{$oxcmp_basket->getFTsProtectionCosts()}]&nbsp;[{$currency->sign}]</td>
                        </tr>
                    [{/if}]
                [{/if}]
            [{/block}]

            [{block name="checkout_basketcontents_wrappingcosts"}]
                [{if $oViewConf->getShowGiftWrapping()}]

                    [{if $oxcmp_basket->getWrappCostNet()}]
                        <tr>
                            <th>[{oxmultilang ident="BASKET_TOTAL_WRAPPING_COSTS_NET"}]:</th>
                            <td id="basketWrappingNetto">[{$oxcmp_basket->getWrappCostNet()}] [{$currency->sign}]</td>
                        </tr>
                        [{if $oxcmp_basket->getWrappCostVat()}]
                        <tr>
                            <th>[{oxmultilang ident="BASKET_TOTAL_PLUS_VAT"}]:</th>
                            <td id="basketWrappingVat">[{$oxcmp_basket->getWrappCostVat()}] [{$currency->sign}]</td>
                        </tr>
                        [{/if}]
                    [{elseif $oxcmp_basket->getFWrappingCosts()}]
                        <tr>
                            <th>[{oxmultilang ident="BASKET_TOTAL_WRAPPING_COSTS"}]:</th>
                            <td id="basketWrappingGross">[{$oxcmp_basket->getFWrappingCosts()}] [{$currency->sign}]</td>
                        </tr>
                    [{/if}]


                    [{if $oxcmp_basket->getGiftCardCostNet()}]
                        <tr>
                            <th>[{oxmultilang ident="BASKET_TOTAL_GIFTCARD_COSTS_NET"}]:</th>
                            <td id="basketGiftCardNetto">[{$oxcmp_basket->getGiftCardCostNet()}] [{$currency->sign}]</td>
                        </tr>
                        [{if $oxcmp_basket->getGiftCardCostVat()}]
                        <tr>
                            [{if $oxcmp_basket->isProportionalCalculationOn()}]
                                <th>[{oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT"}]:</th>
                            [{else}]
                                <th>[{oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_WRAPPINGTAX1"}] [{$oxcmp_basket->getGiftCardCostVatPercent()}][{oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_WRAPPINGTAX2"}]</th>
                            [{/if}]
                            <td id="basketGiftCardVat">[{$oxcmp_basket->getGiftCardCostVat()}] [{$currency->sign}]</td>
                        </tr>
                        [{/if}]
                    [{elseif $oxcmp_basket->getFGiftCardCosts()}]
                        <tr>
                            <th>[{oxmultilang ident="BASKET_TOTAL_GIFTCARD_COSTS"}]:</th>
                            <td id="basketGiftCardGross">[{$oxcmp_basket->getFGiftCardCosts()}] [{$currency->sign}]</td>
                        </tr>
                    [{/if}]
                [{/if}]
            [{/block}]

            [{block name="checkout_basketcontents_grandtotal"}]
                <tr>
                    <th class="lead"><strong>[{oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_GRANDTOTAL"}]</strong></th>
                    <td id="basketGrandTotal" class="lead"><strong>[{$oxcmp_basket->getFPrice()}]&nbsp;[{$currency->sign}]</strong></td>
                </tr>
            [{/block}]

            [{if $oxcmp_basket->hasSkipedDiscount()}]
                <tr>
                    <th><span class="note">**</span> [{oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_DISCOUNTS_NOT_APPLIED_FOR_ARTICLES"}]</span></th>
                    <td></td>
                </tr>
            [{/if}]
        </table>
    </div>
[{/block}]
<div class="clearfix"></div>