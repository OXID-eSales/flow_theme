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
                        <label class="req sr-only" for="input_voucherNr">[{oxmultilang ident="ENTER_COUPON_NUMBER"}]</label>
                        <div class="input-group">
                            <input type="text" name="voucherNr" size="30" class="form-control js-oxValidate js-oxValidate_notEmpty" id="input_voucherNr" placeholder="[{oxmultilang ident="ENTER_COUPON_NUMBER"}]" required="required">
                            <span class="input-group-btn">
                                <button type="submit" class="btn btn-primary submitButton"><i class="fa fa-gift"></i> [{oxmultilang ident="REDEEM_COUPON"}]</button>
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
            [{block name="checkout_basketcontents_summary_table_inner"}]
                [{if !$oxcmp_basket->getDiscounts()}]
                    [{block name="checkout_basketcontents_nodiscounttotalnet"}]
                        <tr>
                            <th>[{oxmultilang ident="TOTAL_NET"}]</th>
                            <td id="basketTotalProductsNetto">[{oxprice price=$oxcmp_basket->getNettoSum() currency=$currency}]</td>
                        </tr>
                    [{/block}]

                    [{block name="checkout_basketcontents_nodiscountproductvats"}]
                        [{foreach from=$oxcmp_basket->getProductVats(false) item=VATitem key=key}]
                            <tr>
                                <th>[{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$key}]</th>
                                <td>[{oxprice price=$VATitem currency=$currency}]</td>
                            </tr>
                        [{/foreach}]
                    [{/block}]

                    [{block name="checkout_basketcontents_nodiscounttotalgross"}]
                        <tr>
                            <th>[{oxmultilang ident="TOTAL_GROSS" suffix="COLON"}]</th>
                            <td id="basketTotalProductsGross">[{oxprice price=$oxcmp_basket->getBruttoSum() currency=$currency}]</td>
                        </tr>
                    [{/block}]
                [{else}]
                    [{if $oxcmp_basket->isPriceViewModeNetto()}]
                        [{block name="checkout_basketcontents_discounttotalnet"}]
                            <tr>
                                <th>[{oxmultilang ident="TOTAL_NET"}]</th>
                                <td id="basketTotalProductsNetto">[{oxprice price=$oxcmp_basket->getNettoSum() currency=$currency}]</td>
                            </tr>
                        [{/block}]
                    [{else}]
                         [{block name="checkout_basketcontents_discounttotalgross"}]
                            <tr>
                                <th>[{oxmultilang ident="TOTAL_GROSS" suffix="COLON"}]</th>
                                <td id="basketTotalProductsGross">[{oxprice price=$oxcmp_basket->getBruttoSum() currency=$currency}]</td>
                            </tr>
                        [{/block}]
                    [{/if}]

                    [{block name="checkout_basketcontents_discounts"}]
                        [{foreach from=$oxcmp_basket->getDiscounts() item=oDiscount name=test_Discounts}]
                            <tr>
                                <th>
                                    <b>[{if $oDiscount->dDiscount < 0}][{oxmultilang ident="SURCHARGE"}][{else}][{oxmultilang ident="DISCOUNT"}][{/if}]&nbsp;</b>
                                    [{$oDiscount->sDiscount}]
                                </th>
                                <td>
                                    [{oxprice price=$oDiscount->dDiscount*-1 currency=$currency}]
                                </td>
                            </tr>
                        [{/foreach}]
                    [{/block}]

                    [{if !$oxcmp_basket->isPriceViewModeNetto()}]
                        [{block name="checkout_basketcontents_totalnet"}]
                            <tr>
                                <th>[{oxmultilang ident="TOTAL_NET"}]</th>
                                <td id="basketTotalNetto">[{oxprice price=$oxcmp_basket->getNettoSum() currency=$currency}]</td>
                            </tr>
                        [{/block}]
                    [{/if}]

                    [{block name="checkout_basketcontents_productvats"}]
                        [{foreach from=$oxcmp_basket->getProductVats(false) item=VATitem key=key}]
                            <tr>
                                <th>[{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$key}]</th>
                                <td>[{oxprice price=$VATitem currency=$currency}]</td>
                            </tr>
                        [{/foreach}]
                    [{/block}]

                    [{if $oxcmp_basket->isPriceViewModeNetto()}]
                        [{block name="checkout_basketcontents_totalgross"}]
                            <tr>
                                <th>[{oxmultilang ident="TOTAL_GROSS" suffix="COLON"}]</th>
                                <td id="basketTotalGross">[{oxprice price=$oxcmp_basket->getBruttoSum() currency=$currency}]</td>
                            </tr>
                        [{/block}]
                    [{/if}]
                [{/if}]
            [{/block}]

            [{block name="checkout_basketcontents_voucherdiscount"}]
                [{if $oViewConf->getShowVouchers() && $oxcmp_basket->getVoucherDiscValue()}]
                    [{foreach from=$oxcmp_basket->getVouchers() item=sVoucher key=key name=Voucher}]
                        <tr class="couponData">
                            <th><span><strong>[{oxmultilang ident="COUPON"}]</strong>&nbsp;([{oxmultilang ident="NUMBER"}] [{$sVoucher->sVoucherNr}])</span>
                            [{if $editable}]
                                <a href="[{$oViewConf->getSelfLink()}]&amp;cl=basket&amp;fnc=removeVoucher&amp;voucherId=[{$sVoucher->sVoucherId}]&amp;CustomError=basket&amp;stoken=[{$oViewConf->getSessionChallengeToken()}]" class="removeFn">[{oxmultilang ident="REMOVE"}]</a>
                            [{/if}]
                            </th>
                            <td>[{oxprice price=$sVoucher->dVoucherdiscount*-1 currency=$currency}]</td>
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
                                <th class="text-right">[{oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT" suffix="COLON"}]</th>
                            [{else}]
                                <th class="text-right">[{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$deliveryCost->getVat()}]</th>
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
                [{assign var="paymentCost" value=$oxcmp_basket->getPaymentCost()}]
                [{if $paymentCost && $paymentCost->getPrice() }]
                    [{if $oViewConf->isFunctionalityEnabled('blShowVATForPayCharge') }]
                        <tr>
                            <th>[{if $paymentCost->getPrice() >= 0}][{ oxmultilang ident="SURCHARGE" }][{else}][{ oxmultilang ident="DEDUCTION" }][{/if}] [{ oxmultilang ident="PAYMENT_METHOD" suffix="COLON"}]</th>
                            <td id="basketPaymentNetto">[{oxprice price=$paymentCost->getNettoPrice() currency=$currency }]</td>
                        </tr>
                        [{if $paymentCost->getVatValue()}]
                            <tr>
                                [{if $oxcmp_basket->isProportionalCalculationOn() }]
                                    <th>[{ oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT" suffix="COLON" }]</th>
                                [{else}]
                                    <th>[{ oxmultilang ident="SURCHARGE_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$paymentCost->getVat() }]</th>
                                [{/if}]
                                <td id="basketPaymentVat">[{oxprice price=$paymentCost->getVatValue() currency=$currency }]</td>
                            </tr>
                        [{/if}]
                    [{else}]
                        <tr>
                            <th>[{if $paymentCost->getPrice() >= 0}][{ oxmultilang ident="SURCHARGE" }][{else}][{ oxmultilang ident="DEDUCTION" }][{/if}] [{ oxmultilang ident="PAYMENT_METHOD" suffix="COLON" }]</th>
                            <td id="basketPaymentGross">[{oxprice price=$paymentCost->getBruttoPrice() currency=$currency }]</td>
                        </tr>
                    [{/if}]
                [{/if}]
            [{/block}]

            [{block name="checkout_basketcontents_wrappingcosts"}]
                [{if $oViewConf->getShowGiftWrapping() }]

                    [{assign var="wrappingCost" value=$oxcmp_basket->getWrappingCost()}]
                    [{if $wrappingCost && $wrappingCost->getPrice() > 0 }]
                        [{if $oViewConf->isFunctionalityEnabled('blShowVATForWrapping') }]
                            <tr>
                                <th>[{ oxmultilang ident="BASKET_TOTAL_WRAPPING_COSTS_NET" suffix="COLON" }]</th>
                                <td id="basketWrappingNetto">[{oxprice price=$wrappingCost->getNettoPrice() currency=$currency}]</td>
                            </tr>
                            [{if $oxcmp_basket->getWrappCostVat() }]
                                <tr>
                                    <th>[{ oxmultilang ident="PLUS_VAT" suffix="COLON" }]</th>
                                    <td id="basketWrappingVat">[{oxprice price=$wrappingCost->getVatValue() currency=$currency}]</td>
                                </tr>
                            [{/if}]
                        [{else}]
                            <tr>
                                <th>[{ oxmultilang ident="GIFT_WRAPPING" suffix="COLON" }]</th>
                                <td id="basketWrappingGross">[{oxprice price=$wrappingCost->getBruttoPrice() currency=$currency }]</td>
                            </tr>
                        [{/if}]
                    [{/if}]

                    [{assign var="giftCardCost" value=$oxcmp_basket->getGiftCardCost()}]
                    [{if $giftCardCost && $giftCardCost->getPrice() > 0 }]
                        [{if $oViewConf->isFunctionalityEnabled('blShowVATForWrapping') }]
                            <tr>
                                <th>[{ oxmultilang ident="BASKET_TOTAL_GIFTCARD_COSTS_NET" suffix="COLON" }]</th>
                                <td id="basketGiftCardNetto">[{oxprice price=$giftCardCost->getNettoPrice() currency=$currency }]</td>
                            </tr>
                            <tr>
                                [{if $oxcmp_basket->isProportionalCalculationOn() }]
                                    <th>[{ oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT" suffix="COLON" }]</th>
                                [{else}]
                                    <th>[{ oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$giftCardCost->getVat() }] </th>
                                [{/if}]
                                <td id="basketGiftCardVat">[{oxprice price=$giftCardCost->getVatValue() currency=$currency}]</td>
                            </tr>
                        [{else}]
                            <tr>
                                <th>[{ oxmultilang ident="GREETING_CARD" suffix="COLON" }]</th>
                                <td id="basketGiftCardGross">[{oxprice price=$giftCardCost->getBruttoPrice() currency=$currency}]</td>
                            </tr>
                        [{/if}]
                    [{/if}]
                [{/if}]
            [{/block}]

            [{block name="checkout_basketcontents_grandtotal"}]
                <tr>
                    <th class="lead"><strong>[{oxmultilang ident="GRAND_TOTAL" suffix="COLON"}]</strong></th>
                    <td id="basketGrandTotal" class="lead"><strong>[{oxprice price=$oxcmp_basket->getPrice() currency=$currency}]</strong></td>
                </tr>
            [{/block}]

            [{if $oxcmp_basket->hasSkipedDiscount()}]
                <tr>
                    <th><span class="note">**</span> [{oxmultilang ident="MESSAGE_COUPON_NOT_APPLIED_FOR_ARTICLES"}]</span></th>
                    <td></td>
                </tr>
            [{/if}]
        </table>
    </div>
[{/block}]
<div class="clearfix"></div>
