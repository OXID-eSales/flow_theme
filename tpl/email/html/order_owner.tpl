[{assign var="shop"      value=$oEmailView->getShop()}]
[{assign var="oViewConf" value=$oEmailView->getViewConfig()}]
[{assign var="oConf"     value=$oViewConf->getConfig()}]
[{assign var="currency"  value=$oEmailView->getCurrency()}]
[{assign var="user"      value=$oEmailView->getUser()}]
[{assign var="basket"    value=$order->getBasket()}]
[{assign var="oDelSet"   value=$order->getDelSet()}]
[{assign var="payment"   value=$order->getPayment()}]

[{capture assign="style"}]
    table.orderarticles th {
        white-space: nowrap;
    }

    table.orderarticles th, table.orderarticles td {
        border: 1px solid #d4d4d4;
        font-size: 13px;
        padding:5px;
        white-space: nowrap;
    }

    table.orderarticles {
        border-collapse: collapse;
    }

    table.orderarticles thead th {
        background-color: #ebebeb;
    }

    table.orderarticles .odd {
        background-color: #ebebeb;
        white-space: nowrap;
    }
[{/capture}]

[{include file="email/html/header.tpl" title="DD_ORDER_CUST_HEADING"|oxmultilangassign|cat:" #"|cat:$order->oxorder__oxordernr->value style=$style}]

[{block name="email_html_order_owner_orderemail"}]
    <p>
        [{if $payment->oxuserpayments__oxpaymentsid->value == "oxempty"}]
            [{oxcontent ident="oxadminordernpemail"}]
        [{else}]
            [{oxcontent ident="oxadminorderemail"}]
        [{/if}]
    </p>
[{/block}]


[{block name="email_html_order_owner_address"}]
    <!-- Address info -->
    <table class="row footer">
        <tbody>
        <tr>
            <td class="wrapper">
                <table class="six columns">
                    <tbody>
                        <tr bgcolor="#ebebeb">
                            <td class="left-text-pad">
                                <h3 style="margin: 0; padding: 0 0 5px; line-height: 20px; text-transform: uppercase;">[{oxmultilang ident="BILLING_ADDRESS"}]</h3>
                                <p>
                                    [{$order->oxorder__oxbillcompany->value}]<br>
                                    [{$order->oxorder__oxbillsal->value|oxmultilangsal}] [{$order->oxorder__oxbillfname->value}] [{$order->oxorder__oxbilllname->value}]<br>
                                    [{if $order->oxorder__oxbilladdinfo->value}][{$order->oxorder__oxbilladdinfo->value}]<br>[{/if}]
                                    [{$order->oxorder__oxbillstreet->value}] [{$order->oxorder__oxbillstreetnr->value}]<br>
                                    [{$order->oxorder__oxbillstateid->value}]
                                    [{$order->oxorder__oxbillzip->value}] [{$order->oxorder__oxbillcity->value}]<br>
                                    [{$order->oxorder__oxbillcountry->value}]<br>
                                    [{if $order->oxorder__oxbillustid->value}][{oxmultilang ident="VAT_ID_NUMBER"}] [{$order->oxorder__oxbillustid->value}]<br>[{/if}]
                                    [{oxmultilang ident="PHONE"}] [{$order->oxorder__oxbillfon->value}]<br><br>
                                </p>
                            </td>
                            <td class="expander"></td>
                        </tr>
                    </tbody>
                </table>
            </td>
            <td class="wrapper last">
                <table class="six columns">
                    <tbody>
                        <tr bgcolor="#ebebeb">
                            <td class="last right-text-pad">
                                <h3 style="margin: 0; padding: 0 0 5px; line-height: 20px; text-transform: uppercase;">[{oxmultilang ident="SHIPPING_ADDRESS"}]</h3>
                                <p>
                                    [{if $order->oxorder__oxdellname->value}]
                                        [{$order->oxorder__oxdelcompany->value}]<br>
                                        [{$order->oxorder__oxdelsal->value|oxmultilangsal}] [{$order->oxorder__oxdelfname->value}] [{$order->oxorder__oxdellname->value}]<br>
                                        [{if $order->oxorder__oxdeladdinfo->value}][{$order->oxorder__oxdeladdinfo->value}]<br>[{/if}]
                                        [{$order->oxorder__oxdelstreet->value}] [{$order->oxorder__oxdelstreetnr->value}]<br>
                                        [{$order->oxorder__oxdelstateid->value}]
                                        [{$order->oxorder__oxdelzip->value}] [{$order->oxorder__oxdelcity->value}]<br>
                                        [{$order->oxorder__oxdelcountry->value}]
                                    [{else}]
                                        [{$order->oxorder__oxbillcompany->value}]<br>
                                        [{$order->oxorder__oxbillsal->value|oxmultilangsal}] [{$order->oxorder__oxbillfname->value}] [{$order->oxorder__oxbilllname->value}]<br>
                                        [{if $order->oxorder__oxbilladdinfo->value}][{$order->oxorder__oxbilladdinfo->value}]<br>[{/if}]
                                        [{$order->oxorder__oxbillstreet->value}] [{$order->oxorder__oxbillstreetnr->value}]<br>
                                        [{$order->oxorder__oxbillstateid->value}]
                                        [{$order->oxorder__oxbillzip->value}] [{$order->oxorder__oxbillcity->value}]<br>
                                        [{$order->oxorder__oxbillcountry->value}]<br>
                                    [{/if}]
                                </p>
                            </td>
                            <td class="expander"></td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        </tbody>
    </table>
    <br/>
[{/block}]

<table class="orderarticles" border="0" cellspacing="0" cellpadding="0" width="100%">
    <thead>
        <tr bgcolor="#ebebeb">
            <th[{if $oViewConf->getViewThemeParam('blEmailsShowProductPictures')}] colspan="2"[{/if}]>[{oxmultilang ident="PRODUCT"}]</th>
            <th>[{oxmultilang ident="UNIT_PRICE"}]</th>
            <th>[{oxmultilang ident="QUANTITY"}]</th>
            <th>[{oxmultilang ident="VAT"}]</th>
            <th>[{oxmultilang ident="TOTAL"}]</th>
        </tr>
    </thead>
    <tbody>

        [{assign var="basketitemlist" value=$basket->getBasketArticles()}]
        [{foreach key=basketindex from=$basket->getContents() item=basketitem}]
            [{block name="email_html_order_owner_basketitem"}]
                [{assign var="basketproduct" value=$basketitemlist.$basketindex}]
                <tr valign="top">
                    [{if $oViewConf->getViewThemeParam('blEmailsShowProductPictures')}]
                        <td>
                            <img src="[{$basketproduct->getIconUrl(false)}]" border="0" hspace="0" vspace="0" alt="[{$basketitem->getTitle()|strip_tags}]" align="texttop" style="max-width:80px;">
                        </td>
                    [{/if}]
                    <td>
                        <p>
                            <b>[{$basketitem->getTitle()}]</b>
                            [{if $basketitem->getChosenSelList()}],
                                [{foreach from=$basketitem->getChosenSelList() item=oList}]
                                    [{$oList->name}] [{$oList->value}]&nbsp;
                                [{/foreach}]
                            [{/if}]
                            [{if $basketitem->getPersParams()}]
                                [{foreach key=sVar from=$basketitem->getPersParams() item=aParam}]
                                    ,&nbsp;<em>[{$sVar}] : [{$aParam}]</em>
                                [{/foreach}]
                            [{/if}]
                            <br>[{oxmultilang ident="PRODUCT_NO" suffix="COLON"}] [{$basketproduct->oxarticles__oxartnum->value}]

                            [{if $oViewConf->getShowGiftWrapping()}]
                                [{assign var="oWrapping" value=$basketitem->getWrapping()}]
                                <br><b>[{oxmultilang ident="GIFT_WRAPPING"}]</b>:&nbsp;[{if !$basketitem->getWrappingId()}][{oxmultilang ident="NONE"}][{else}][{$oWrapping->oxwrapping__oxname->value}][{/if}]
                            [{/if}]
                        </p>
                    </td>
                    <td>
                        <p>
                            <b style="white-space:nowrap;">[{if $basketitem->getFUnitPrice()}][{$basketitem->getFUnitPrice()}]&nbsp;[{$currency->sign}][{/if}]</b>
                            [{if !$basketitem->isBundle()}]
                                [{assign var=dRegUnitPrice value=$basketitem->getRegularUnitPrice()}]
                                [{assign var=dUnitPrice value=$basketitem->getUnitPrice()}]
                                [{if $dRegUnitPrice->getPrice() > $dUnitPrice->getPrice()}]
                                    <br><s>[{$basketitem->getFRegularUnitPrice()}]&nbsp;[{$currency->sign}]</s>
                                [{/if}]
                            [{/if}]
                            [{if $basketitem->aDiscounts}]<br><br>
                                <em style="font-size: 7pt;font-weight: normal;">[{oxmultilang ident="DISCOUNT"}]
                                    [{foreach from=$basketitem->aDiscounts item=oDiscount}]
                                        <br>[{$oDiscount->sDiscount}]
                                    [{/foreach}]
                                </em>
                            [{/if}]
                            [{if $basketproduct->oxarticles__oxorderinfo->value}]
                                [{$basketproduct->oxarticles__oxorderinfo->value}]
                            [{/if}]
                        </p>
                    </td>
                    <td>[{$basketitem->getAmount()}]</td>
                    <td>[{$basketitem->getVatPercent()}]%</td>
                    <td>
                        <b>[{$basketitem->getFTotalPrice()}]&nbsp;[{$currency->sign}]</b>
                    </td>
                </tr>
            [{/block}]
        [{/foreach}]
        [{block name="email_html_order_owner_giftwrapping"}]
            [{if $basket->oCard}]
                <tr valign="top">
                    <td>
                        <img src="[{$basket->oCard->getPictureUrl()}]" alt="[{$basket->oCard->oxwrapping__oxname->value}]" hspace="0" vspace="0" border="0" align="top">
                    </td>
                    <td colspan="[{$iFooterColspan}]">
                        <b>[{oxmultilang ident="ATENTION_GREETING_CARD"}]</b><br>
                        [{oxmultilang ident="WHAT_I_WANTED_TO_SAY"}]
                        <br><br>
                        [{$basket->getCardMessage()}]
                    </td>
                </tr>
            [{/if}]
        [{/block}]
    </tbody>
    <tfoot>
        [{assign var="iFooterColspan" value=4}]
        [{if $oViewConf->getViewThemeParam('blEmailsShowProductPictures')}]
            [{assign var="iFooterColspan" value=5}]
        [{/if}]
        [{block name="email_html_order_owner_voucherdiscount_top"}]
            [{if $oViewConf->getShowVouchers()}]
                [{if $basket->getVoucherDiscValue()}]
                    <tr valign="top" bgcolor="#ebebeb">
                        <td colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="USED_COUPONS"}]</td>
                        <td align="right" class="odd text-right">[{oxmultilang ident="REBATE"}]</td>
                    </tr>
                [{/if}]
                [{foreach from=$order->getVoucherList() item=voucher}]
                    [{assign var="voucherseries" value=$voucher->getSerie()}]
                    <tr valign="top" bgcolor="#ebebeb">
                        <td colspan="[{$iFooterColspan}]" class="odd text-right">[{$voucher->oxvouchers__oxvouchernr->value}]</td>
                        <td align="right" class="odd text-right">[{$voucherseries->oxvoucherseries__oxdiscount->value}] [{if $voucherseries->oxvoucherseries__oxdiscounttype->value == "absolute"}][{$currency->sign}][{else}]%[{/if}]</td>
                    </tr>
                [{/foreach}]
            [{/if}]
        [{/block}]
        [{if !$basket->getDiscounts()}]
            [{block name="email_html_order_owner_nodiscounttotalnet"}]
                <!-- netto price -->
                <tr valign="top" bgcolor="#ebebeb">
                    <td colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="TOTAL_NET"}]</td>
                    <td align="right" class="odd text-right">[{$basket->getProductsNetPrice()}] [{$currency->sign}]</td>
                </tr>
            [{/block}]
            [{block name="email_html_order_owner_nodiscountproductvats"}]
                <!-- VATs -->
                [{foreach from=$basket->getProductVats() item=VATitem key=key}]
                    <tr valign="top" bgcolor="#ebebeb">
                        <td colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$key}]</td>
                        <td align="right" class="odd text-right">[{ $VATitem }] [{$currency->sign}]</td>
                    </tr>
                [{/foreach}]
            [{/block}]

            [{block name="email_html_order_owner_nodiscounttotalgross"}]
                <!-- brutto price -->
                <tr valign="top" bgcolor="#ebebeb">
                    <td colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="TOTAL_GROSS"}]</td>
                    <td align="right" class="odd text-right">[{$basket->getFProductsPrice()}] [{$currency->sign}]</td>
                </tr>
            [{/block}]
        [{/if}]

        <!-- applied discounts -->
        [{if $basket->getDiscounts()}]
            [{if $order->isNettoMode()}]
                [{block name="email_html_order_cust_discounttotalnet"}]
                <!-- netto price -->
                    <tr valign="top" bgcolor="#ebebeb">
                        <td colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="TOTAL_NET"}]</td>
                        <td align="right" class="odd text-right">[{$basket->getProductsNetPrice()}] [{$currency->sign}]</td>0
                    </tr>
                [{/block}]
            [{else}]
                [{block name="email_html_order_cust_discounttotalgross"}]
                    <!-- brutto price -->
                    <tr valign="top" bgcolor="#ebebeb">
                        <td colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="TOTAL_GROSS"}]</td>
                        <td align="right" class="odd text-right">[{$basket->getFProductsPrice()}] [{$currency->sign}]</td>
                    </tr>
                [{/block}]
            [{/if}]

            [{block name="email_html_order_owner_discounts"}]
                <!-- discounts -->
                [{foreach from=$basket->getDiscounts() item=oDiscount}]
                    <tr valign="top" bgcolor="#ebebeb">
                        <td colspan="[{$iFooterColspan}]" class="odd text-right">[{if $oDiscount->dDiscount < 0}][{oxmultilang ident="SURCHARGE"}][{else}][{oxmultilang ident="DISCOUNT"}][{/if}] <em>[{$oDiscount->sDiscount}]</em>:</td>
                        <td align="right" class="odd text-right">[{if $oDiscount->dDiscount < 0}][{$oDiscount->fDiscount|replace:"-":""}][{else}]-[{$oDiscount->fDiscount}][{/if}] [{$currency->sign}]</td>
                    </tr>
                [{/foreach}]
            [{/block}]

            [{if !$order->isNettoMode()}]
                [{block name="email_html_order_cust_totalnet"}]
                    <!-- netto price -->
                    <tr valign="top" bgcolor="#ebebeb">
                        <td colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="TOTAL_NET"}]</td>
                        <td align="right" class="odd text-right">[{$basket->getProductsNetPrice()}] [{$currency->sign}]</td>
                    </tr>
                [{/block}]
            [{/if}]

            [{block name="email_html_order_owner_productvats"}]
                <!-- VATs -->
                [{foreach from=$basket->getProductVats() item=VATitem key=key}]
                    <tr valign="top" bgcolor="#ebebeb">
                        <td colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$key}]</td>
                        <td align="right" class="odd text-right">[{$VATitem}] [{$currency->sign}]</td>
                    </tr>
                [{/foreach}]
            [{/block}]

            [{if $order->isNettoMode()}]
                [{block name="email_html_order_cust_totalbrut"}]
                    <!-- brutto price -->
                    <tr valign="top" bgcolor="#ebebeb">
                        <td colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="TOTAL_GROSS"}]</td>
                        <td align="right" class="odd text-right">[{$basket->getFProductsPrice()}] [{$currency->sign}]</td>
                    </tr>
                [{/block}]
            [{/if}]
        [{/if}]

        [{block name="email_html_order_owner_voucherdiscount"}]
            <!-- voucher discounts -->
            [{if $oViewConf->getShowVouchers() && $basket->getVoucherDiscValue()}]
                <tr valign="top" bgcolor="#ebebeb">
                    <td colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="COUPON"}]</td>
                    <td align="right" class="odd text-right">[{if $basket->getFVoucherDiscountValue() > 0}]-[{/if}][{$basket->getFVoucherDiscountValue()|replace:"-":""}] [{$currency->sign}]</td>
                </tr>
            [{/if}]
        [{/block}]

        [{block name="email_html_order_owner_delcosts"}]
            <!-- delivery costs -->
            [{if $basket->getDelCostNet()}]
                <tr valign="top" bgcolor="#ebebeb">
                    <td colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="SHIPPING_NET"}]</td>
                    <td align="right" class="odd text-right">[{$basket->getDelCostNet()}] [{$currency->sign}]</td>
                </tr>
                [{if $basket->getDelCostVat()}]
                    <tr valign="top" bgcolor="#ebebeb">
                        [{if $basket->isProportionalCalculationOn()}]
                            <td colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT"}]:</td>
                        [{else}]
                            <td colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$basket->getDelCostVatPercent()}]</td>
                        [{/if}]
                        <td align="right" class="odd text-right">[{$basket->getDelCostVat()}] [{$currency->sign}]</td>
                    </tr>
                [{/if}]
            [{elseif $basket->getFDeliveryCosts()}]
                <tr valign="top" bgcolor="#ebebeb">
                    <td colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="SHIPPING_COST"}]</td>
                    <td align="right" class="odd text-right">[{$basket->getFDeliveryCosts()}] [{$currency->sign}]</td>
                </tr>
            [{/if}]
        [{/block}]

        [{block name="email_html_order_owner_paymentcosts"}]
            <!-- payment sum -->
            [{if $basket->getPayCostNet()}]
                <tr valign="top" bgcolor="#ebebeb">
                    <td colspan="[{$iFooterColspan}]" class="odd text-right">[{if $basket->getPaymentCosts() >= 0}][{oxmultilang ident="SURCHARGE"}][{else}][{oxmultilang ident="DEDUCTION"}][{/if}] [{oxmultilang ident="PAYMENT_METHOD"}]</td>
                    <td align="right" class="odd text-right">[{$basket->getPayCostNet()}] [{$currency->sign}]</td>
                </tr>
                <!-- payment sum VAT (if available) -->
                [{if $basket->getPayCostVat()}]
                    <tr valign="top" bgcolor="#ebebeb">
                        [{if $basket->isProportionalCalculationOn()}]
                            <td colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT"}]:</td>
                        [{else}]
                            <td colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$basket->getPayCostVatPercent()}]</td>
                        [{/if}]
                        <td align="right" class="odd text-right">[{$basket->getPayCostVat()}] [{$currency->sign}]</td>
                    </tr>
                [{/if}]
            [{elseif $basket->getFPaymentCosts()}]
                <tr valign="top" bgcolor="#ebebeb">
                    <td colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="SURCHARGE"}]:</td>
                    <td align="right" class="odd text-right">[{$basket->getFPaymentCosts()}] [{$currency->sign}]</td>
                </tr>
            [{/if}]
        [{/block}]

        [{if $oViewConf->getShowGiftWrapping()}]
            [{block name="email_html_order_owner_wrappingcosts"}]
                <!-- Gift wrapping -->
                [{if $basket->getWrappCostNet()}]
                    <tr valign="top" bgcolor="#ebebeb">
                        <td colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="BASKET_TOTAL_WRAPPING_COSTS_NET"}]:</td>
                        <td align="right" class="odd text-right">[{$basket->getWrappCostNet()}] [{$currency->sign}]</td>
                    </tr>
                    [{if $basket->getWrappCostVat()}]
                        <tr valign="top" bgcolor="#ebebeb">
                            <td colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="PLUS_VAT"}]:</td>
                            <td align="right" class="odd text-right">[{$basket->getWrappCostVat()}] [{$currency->sign}]</td>
                        </tr>
                    [{/if}]
                [{elseif $basket->getFWrappingCosts()}]
                    <tr valign="top" bgcolor="#ebebeb">
                        <td colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="GIFT_WRAPPING"}]:</td>
                        <td align="right" class="odd text-right">[{$basket->getFWrappingCosts()}] [{$currency->sign}]</td>
                    </tr>
                [{/if}]
            [{/block}]

            [{block name="email_html_order_owner_giftwrapping"}]
                <!-- Greeting card -->
                [{if $basket->getGiftCardCostNet()}]
                    <tr valign="top" bgcolor="#ebebeb">
                        <td colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="BASKET_TOTAL_GIFTCARD_COSTS_NET"}]:</td>
                        <td align="right" class="odd text-right">[{$basket->getGiftCardCostNet()}] [{$currency->sign}]</td>
                    </tr>
                    [{if $basket->getGiftCardCostVat()}]
                    <tr>
                        [{if $basket->isProportionalCalculationOn()}]
                            <td colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT"}]:</td>
                        [{else}]
                            <td colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$basket->getGiftCardCostVatPercent()}]</td>
                        [{/if}]
                        <td align="right" class="odd text-right">[{$basket->getGiftCardCostVat()}] [{$currency->sign}]</td>
                    </tr>
                    [{/if}]
                [{elseif $basket->getFGiftCardCosts()}]
                    <tr valign="top" bgcolor="#ebebeb">
                        <td colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="GREETING_CARD"}]:</td>
                        <td align="right" class="odd text-right">[{$basket->getFGiftCardCosts()}] [{$currency->sign}]</td>
                    </tr>
                [{/if}]
            [{/block}]
        [{/if}]

        [{block name="email_html_order_owner_grandtotal"}]
            <!-- grand total price -->
            <tr valign="top" bgcolor="#ebebeb">
                <td colspan="[{$iFooterColspan}]" class="odd text-right" align="right">
                    <b>[{oxmultilang ident="GRAND_TOTAL"}]</b>
                </td>
                <td align="right" class="odd text-right">
                    <b>[{$basket->getFPrice()}] [{$currency->sign}]</b>
                </td>
            </tr>
        [{/block}]
    </tfoot>
</table>

<br/>

[{block name="email_html_order_owner_userremark"}]
    [{if $order->oxorder__oxremark->value}]
        <h3 class="underline">[{oxmultilang ident="MESSAGE"}]</h3>
        <p>[{$order->oxorder__oxremark->value|oxescape}]</p>
        <br>
    [{/if}]
[{/block}]

[{block name="email_html_order_owner_paymentinfo"}]
    [{if $payment->oxuserpayments__oxpaymentsid->value != "oxempty"}]
        <h3 class="underline">[{oxmultilang ident="PAYMENT_INFORMATION"}]</h3>
        <p>
            <b>[{oxmultilang ident="PAYMENT_METHOD"}] [{$payment->oxpayments__oxdesc->value}] [{if $basket->getPaymentCosts()}]([{$basket->getFPaymentCosts()}] [{$currency->sign}])[{/if}]</b>
        </p>
        <br>
    [{/if}]
[{/block}]

[{block name="email_html_order_owner_username"}]
    <h3 class="underline">[{oxmultilang ident="EMAIL_ADDRESS"}]</h3>
    <p>[{$user->oxuser__oxusername->value}]</p>
    <br>
[{/block}]

[{block name="email_html_order_owner_deliveryinfo"}]
    [{if $payment->oxuserpayments__oxpaymentsid->value != "oxempty"}]
        <h3 class="underline">[{oxmultilang ident="SELECTED_SHIPPING_CARRIER"}]</h3>
        <p>[{$oDelSet->oxdeliveryset__oxtitle->value}]</p>
        <br>
    [{/if}]
[{/block}]

[{include file="email/html/footer.tpl"}]
