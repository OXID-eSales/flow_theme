[{assign var="shop"           value=$oEmailView->getShop()}]
[{assign var="oViewConf"      value=$oEmailView->getViewConfig()}]
[{assign var="oConf"          value=$oViewConf->getConfig()}]
[{assign var="currency"       value=$oEmailView->getCurrency()}]
[{assign var="user"           value=$oEmailView->getUser()}]
[{assign var="oDelSet"        value=$order->getDelSet()}]
[{assign var="basket"         value=$order->getBasket()}]
[{assign var="payment"        value=$order->getPayment()}]
[{assign var="sOrderId"       value=$order->getId()}]
[{assign var="oOrderFileList" value=$oEmailView->getOrderFileList($sOrderId)}]

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
    }
[{/capture}]

[{include file="email/html/header.tpl" title="DD_ORDER_CUST_HEADING"|oxmultilangassign|cat:" #"|cat:$order->oxorder__oxordernr->value style=$style}]

[{block name="email_html_order_cust_orderemail"}]
    <p>
        [{if $payment->oxuserpayments__oxpaymentsid->value == "oxempty"}]
            [{oxcontent ident="oxuserordernpemail"}]
        [{else}]
            [{oxcontent ident="oxuserorderemail"}]
        [{/if}]
    </p>
[{/block}]

[{block name="email_html_order_cust_address"}]
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

<table class="orderarticles" width="100%" style="width:100%;">
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
            [{block name="email_html_order_cust_basketitem"}]
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
                            [{if $basketitem->getChosenSelList()}]
                                <ul>
                                    [{foreach from=$basketitem->getChosenSelList() item=oList}]
                                        <li style="padding: 3px;">[{$oList->name}] [{$oList->value}]</li>
                                    [{/foreach}]
                                </ul>
                            [{/if}]
                            [{if $basketitem->getPersParams()}]
                                <ul>
                                    [{foreach key=sVar from=$basketitem->getPersParams() item=aParam}]
                                        <li style="padding: 3px;">[{$sVar}] : [{$aParam}]</li>
                                    [{/foreach}]
                                </ul>
                            [{/if}]
                            <br>
                            <p>
                                <b>[{oxmultilang ident="PRODUCT_NO" suffix="COLON"}] [{$basketproduct->oxarticles__oxartnum->value}]</b>
                            </p>
                            [{if $oViewConf->getShowGiftWrapping()}]
                                [{assign var="oWrapping" value=$basketitem->getWrapping()}]
                                <p>
                                    <b>[{oxmultilang ident="GIFT_WRAPPING"}]:&nbsp;</b>
                                    [{if !$basketitem->getWrappingId()}]
                                        [{oxmultilang ident="NONE"}]
                                    [{else}]
                                        [{$oWrapping->oxwrapping__oxname->value}]
                                    [{/if}]
                                </p>
                            [{/if}]

                            [{if $blShowReviewLink}]
                                <p>
                                    <a href="[{$oConf->getShopURL()}]index.php?shp=[{$shop->oxshops__oxid->value}]&amp;anid=[{$basketitem->getProductId()}]&amp;cl=review&amp;reviewuserhash=[{$user->getReviewUserHash($user->getId())}]" style="" target="_blank">[{oxmultilang ident="PRODUCT_REVIEW"}]</a>
                                </p>
                            [{/if}]
                        </p>
                    </td>
                    <td align="right">
                        <p>
                            <b>[{if $basketitem->getFUnitPrice()}][{$basketitem->getFUnitPrice()}] [{$currency->sign}][{/if}]</b>
                            [{if !$basketitem->isBundle()}]
                                [{assign var=dRegUnitPrice value=$basketitem->getRegularUnitPrice()}]
                                [{assign var=dUnitPrice value=$basketitem->getUnitPrice()}]
                                [{if $dRegUnitPrice->getPrice() > $dUnitPrice->getPrice()}]
                                <br><s>[{$basketitem->getFRegularUnitPrice()}]&nbsp;[{$currency->sign}]</s>
                                [{/if}]
                            [{/if}]
                        </p>

                        [{if $basketitem->aDiscounts}]
                            <p>
                                <em>[{oxmultilang ident="DISCOUNT"}]
                                    [{foreach from=$basketitem->aDiscounts item=oDiscount}]
                                      <br>[{$oDiscount->sDiscount}]
                                    [{/foreach}]
                                </em>
                            </p>
                        [{/if}]

                        [{if $basketproduct->oxarticles__oxorderinfo->value}]
                            [{$basketproduct->oxarticles__oxorderinfo->value}]
                        [{/if}]
                    </td>
                    <td align="right">
                        <b>[{$basketitem->getAmount()}]</b>
                    </td>
                    <td align="right">[{$basketitem->getVatPercent()}]%</td>
                    <td align="right">
                        <b>[{$basketitem->getFTotalPrice()}] [{$currency->sign}]</b>
                    </td>
                </tr>
            [{/block}]
        [{/foreach}]
    </tbody>
    <tfoot>
        [{assign var="iFooterColspan" value=4}]
        [{if $oViewConf->getViewThemeParam('blEmailsShowProductPictures')}]
            [{assign var="iFooterColspan" value=5}]
        [{/if}]
        [{block name="email_html_order_cust_voucherdiscount_top"}]
            [{if $oViewConf->getShowVouchers() && $basket->getVoucherDiscValue()}]
                <tr valign="top" bgcolor="#ebebeb">
                    <td align="right" colspan="[{$iFooterColspan}]" class="odd text-right">
                        <b>[{oxmultilang ident="USED_COUPONS"}]</b>
                    </td>
                    <td align="right" class="odd text-right">
                        <b>[{oxmultilang ident="REBATE"}]</b>
                    </td>
                </tr>
                [{foreach from=$order->getVoucherList() item=voucher}]
                    [{assign var="voucherseries" value=$voucher->getSerie()}]
                    <tr valign="top" bgcolor="#ebebeb">
                        <td align="right" colspan="[{$iFooterColspan}]" class="odd text-right">[{$voucher->oxvouchers__oxvouchernr->value}]</td>
                        <td align="right" class="odd text-right">[{$voucherseries->oxvoucherseries__oxdiscount->value}] [{if $voucherseries->oxvoucherseries__oxdiscounttype->value == "absolute"}][{$currency->sign}][{else}]%[{/if}]</td>
                    </tr>
                [{/foreach}]
            [{/if}]
        [{/block}]

        [{if !$basket->getDiscounts()}]
            [{block name="email_html_order_cust_nodiscounttotalnet"}]
                <!-- netto price -->
                <tr valign="top" bgcolor="#ebebeb">
                    <td align="right" colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="TOTAL_NET"}]</td>
                    <td align="right" class="odd text-right">[{$basket->getProductsNetPrice()}] [{$currency->sign}]</td>
                </tr>
            [{/block}]
            [{block name="email_html_order_cust_nodiscountproductvats"}]
                <!-- VATs -->
                [{foreach from=$basket->getProductVats(false) item=VATitem key=key}]
                    <tr valign="top" bgcolor="#ebebeb">
                        <td align="right" colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$key}]</td>
                        <td align="right" class="odd text-right">[{oxprice price=$VATitem currency=$currency}]</td>
                    </tr>
                [{/foreach}]
            [{/block}]

            [{block name="email_html_order_cust_nodiscounttotalgross"}]
                <!-- brutto price -->
                <tr valign="top" bgcolor="#ebebeb">
                    <td align="right" colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="TOTAL_GROSS"}]</td>
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
                        <td align="right" colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="TOTAL_NET"}]</td>
                        <td align="right" class="odd text-right">[{$basket->getProductsNetPrice()}] [{$currency->sign}]</td>
                    </tr>
                [{/block}]
            [{else}]
                [{block name="email_html_order_cust_discounttotalgross"}]
                    <!-- brutto price -->
                    <tr valign="top" bgcolor="#ebebeb">
                        <td align="right" colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="TOTAL_GROSS"}]</td>
                        <td align="right" class="odd text-right">[{$basket->getFProductsPrice()}] [{$currency->sign}]</td>
                    </tr>
                [{/block}]
            [{/if}]

            [{block name="email_html_order_cust_discounts"}]
                <!-- discounts -->
                [{foreach from=$basket->getDiscounts() item=oDiscount}]
                    <tr valign="top" bgcolor="#ebebeb">
                        <td align="right" colspan="[{$iFooterColspan}]" class="odd text-right">[{if $oDiscount->dDiscount < 0}][{oxmultilang ident="SURCHARGE"}][{else}][{oxmultilang ident="DISCOUNT"}][{/if}] <em>[{$oDiscount->sDiscount}]</em> :</td>
                        <td align="right" class="odd text-right">[{if $oDiscount->dDiscount < 0}][{$oDiscount->fDiscount|replace:"-":""}][{else}]-[{$oDiscount->fDiscount}][{/if}] [{$currency->sign}]</td>
                    </tr>
                [{/foreach}]
            [{/block}]

            [{if !$order->isNettoMode()}]
                [{block name="email_html_order_cust_totalnet"}]
                    <!-- netto price -->
                    <tr valign="top" bgcolor="#ebebeb">
                        <td align="right" colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="TOTAL_NET"}]</td>
                        <td align="right" class="odd text-right">[{$basket->getProductsNetPrice()}] [{$currency->sign}]</td>
                    </tr>
                [{/block}]
            [{/if}]

            [{block name="email_html_order_cust_productvats"}]
                <!-- VATs -->
                [{foreach from=$basket->getProductVats() item=VATitem key=key}]
                    <tr valign="top" bgcolor="#ebebeb">
                        <td align="right" colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$key}]</td>
                        <td align="right" class="odd text-right">[{oxprice price=$VATitem currency=$currency}]</td>
                    </tr>
                [{/foreach}]
            [{/block}]

            [{if $order->isNettoMode()}]
                [{block name="email_html_order_cust_totalbrut"}]
                    <!-- brutto price -->
                    <tr valign="top" bgcolor="#ebebeb">
                        <td align="right" colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="TOTAL_GROSS"}]</td>
                        <td align="right" class="odd text-right">[{$basket->getFProductsPrice()}] [{$currency->sign}]</td>
                    </tr>
                [{/block}]
            [{/if}]
        [{/if}]

        [{block name="email_html_order_cust_voucherdiscount"}]
            <!-- voucher discounts -->
            [{if $oViewConf->getShowVouchers() && $basket->getVoucherDiscValue()}]
                <tr valign="top" bgcolor="#ebebeb">
                    <td align="right" colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="COUPON"}]</td>
                    <td align="right" class="odd text-right">[{if $basket->getFVoucherDiscountValue() > 0}]-[{/if}][{$basket->getFVoucherDiscountValue()|replace:"-":""}] [{$currency->sign}]</td>
                </tr>
            [{/if}]
        [{/block}]

        [{block name="email_html_order_cust_delcosts"}]
            <!-- delivery costs -->
            [{assign var="oDeliveryCost" value=$basket->getDeliveryCost()}]
            [{if $oDeliveryCost && $oDeliveryCost->getPrice() > 0}]
                [{if $oViewConf->isFunctionalityEnabled('blShowVATForDelivery')}]
                    <tr valign="top" bgcolor="#ebebeb">
                        <td align="right" colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="SHIPPING_NET" suffix="COLON"}]</td>
                        <td align="right" class="odd text-right">[{oxprice price=$oDeliveryCost->getNettoPrice() currency=$currency}]</td>
                    </tr>
                    [{if $oDeliveryCost->getVatValue()}]
                        <tr valign="top" bgcolor="#ebebeb">
                            [{if $basket->isProportionalCalculationOn()}]
                                <td align="right" colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT" suffix="COLON"}]</td>
                            [{else}]
                                <td align="right" colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$oDeliveryCost->getVat()}]</td>
                            [{/if}]
                            <td align="right" class="odd text-right">[{oxprice price=$oDeliveryCost->getVatValue() currency=$currency}]</td>
                        </tr>
                    [{/if}]
                [{else}]
                    <tr valign="top" bgcolor="#ebebeb">
                        <td align="right" colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="SHIPPING_COST" suffix="COLON"}]</td>
                        <td align="right" class="odd text-right">[{oxprice price=$oDeliveryCost->getBruttoPrice() currency=$currency}]</td>
                    </tr>
                [{/if}]
            [{/if}]
        [{/block}]

        [{block name="email_html_order_cust_paymentcosts"}]
            <!-- payment sum -->
            [{if $basket->getPayCostNet()}]
                <tr valign="top" bgcolor="#ebebeb">
                    <td align="right" colspan="[{$iFooterColspan}]" class="odd text-right">[{if $basket->getPaymentCosts() >= 0}][{oxmultilang ident="SURCHARGE"}][{else}][{oxmultilang ident="DEDUCTION"}][{/if}] [{oxmultilang ident="PAYMENT_METHOD"}]</td>
                    <td align="right" class="odd text-right">[{$basket->getPayCostNet()}] [{$currency->sign}]</td>
                </tr>
                <!-- payment sum VAT (if available) -->
                [{if $basket->getPayCostVat()}]
                    <tr valign="top" bgcolor="#ebebeb">
                        [{if $basket->isProportionalCalculationOn()}]
                            <td align="right" colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT"}]:</td>
                        [{else}]
                            [{assign var="iPayCostVatPercent" value=$basket->getPayCostVatPercent()}]
                            <td align="right" colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$iPayCostVatPercent}]</td>
                        [{/if}]
                        <td align="right" class="odd text-right">[{$basket->getPayCostVat()}] [{$currency->sign}]</td>
                    </tr>
                [{/if}]
            [{elseif $basket->getFPaymentCosts()}]
                <tr valign="top" bgcolor="#ebebeb">
                    <td align="right" colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="SURCHARGE"}]:</td>
                    <td align="right" class="odd text-right">[{$basket->getFPaymentCosts()}] [{$currency->sign}]</td>
                </tr>
            [{/if}]
        [{/block}]

        [{if $oViewConf->getShowGiftWrapping()}]
            [{block name="email_html_order_cust_wrappingcosts"}]
                <!-- Gift wrapping -->
                [{if $basket->getWrappCostNet()}]
                    <tr valign="top" bgcolor="#ebebeb">
                        <td align="right" colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="BASKET_TOTAL_WRAPPING_COSTS_NET"}]:</td>
                        <td align="right" class="odd text-right">[{$basket->getWrappCostNet()}] [{$currency->sign}]</td>
                    </tr>
                    [{if $basket->getWrappCostVat()}]
                        <tr valign="top" bgcolor="#ebebeb">
                            <td align="right" colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="PLUS_VAT"}]:</td>
                            <td align="right" class="odd text-right">[{$basket->getWrappCostVat()}] [{$currency->sign}]</td>
                        </tr>
                    [{/if}]
                [{elseif $basket->getFWrappingCosts()}]
                    <tr valign="top" bgcolor="#ebebeb">
                        <td align="right" colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="GIFT_WRAPPING"}]:</td>
                        <td align="right" class="odd text-right">[{$basket->getFWrappingCosts()}] [{$currency->sign}]</td>
                    </tr>
                [{/if}]
            [{/block}]

            [{block name="email_html_order_cust_giftwrapping"}]
                <!-- Greeting card -->
                [{if $basket->getGiftCardCostNet()}]
                    <tr valign="top" bgcolor="#ebebeb">
                        <td align="right" colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="BASKET_TOTAL_GIFTCARD_COSTS_NET"}]:</td>
                        <td align="right" class="odd text-right">[{$basket->getGiftCardCostNet()}] [{$currency->sign}]</td>
                    </tr>
                    [{if $basket->getGiftCardCostVat()}]
                        <tr>
                            [{if $basket->isProportionalCalculationOn()}]
                                <td align="right" colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="BASKET_TOTAL_PLUS_PROPORTIONAL_VAT"}]:</td>
                            [{else}]
                                [{assign var="iGiftCardCostVatPercent" value=$basket->getGiftCardCostVatPercent()}]
                                <td align="right" colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="VAT_PLUS_PERCENT_AMOUNT" suffix="COLON" args=$iGiftCardCostVatPercent}]</td>
                            [{/if}]
                            <td align="right" class="odd text-right">[{$basket->getGiftCardCostVat()}] [{$currency->sign}]</td>
                        </tr>
                    [{/if}]
                [{elseif $basket->getFGiftCardCosts()}]
                    <tr valign="top" bgcolor="#ebebeb">
                        <td align="right" colspan="[{$iFooterColspan}]" class="odd text-right">[{oxmultilang ident="GREETING_CARD"}]:</td>
                        <td align="right" class="odd text-right">[{$basket->getFGiftCardCosts()}] [{$currency->sign}]</td>
                    </tr>
                [{/if}]
            [{/block}]
        [{/if}]

        [{block name="email_html_order_cust_grandtotal"}]
            <!-- grand total price -->
            <tr valign="top" bgcolor="#ebebeb" bgcolor="#ebebeb">
                <td align="right" colspan="[{$iFooterColspan}]" class="text-right odd"><b>[{oxmultilang ident="GRAND_TOTAL"}]</b></td>
                <td align="right" class="odd text-right"><b>[{$basket->getFPrice()}] [{$currency->sign}]</b></td>
            </tr>
        [{/block}]
    </tfoot>
</table>
<br/>

[{block name="email_html_order_cust_giftwrapping"}]
  [{if $oViewConf->getShowGiftWrapping() && $basket->getCard()}]
      [{assign var="oCard" value=$basket->getCard()}]

      <table>
          <tr>
              <td colspan="2">
                  <b>[{oxmultilang ident="YOUR_GREETING_CARD"}]</b>
              </td>
          </tr>
          <tr valign="top">
              <td valign="top">
                  <img src="[{$oCard->getPictureUrl()}]" alt="[{$oCard->oxwrapping__oxname->value}]" hspace="0" vspace="0" border="0" align="top">
              </td>
              <td>[{oxmultilang ident="WHAT_I_WANTED_TO_SAY"}]<br><br>[{$basket->getCardMessage()}]</td>
          </tr>
      </table>
  [{/if}]
[{/block}]

<br><br>

[{block name="email_html_order_cust_userremark"}]
    [{if $order->oxorder__oxremark->value}]
        <h3 class="underline">[{oxmultilang ident="WHAT_I_WANTED_TO_SAY"}]</h3>
        <p>[{$order->oxorder__oxremark->value|oxescape}]</p>
        <br/>
    [{/if}]
[{/block}]

[{block name="email_html_order_cust_download_link"}]
    [{if $oOrderFileList}]
        <h3 class="underline">[{oxmultilang ident="MY_DOWNLOADS_DESC"}]</h3>
        [{foreach from=$oOrderFileList item="oOrderFile"}]
            <p>
                [{if $order->oxorder__oxpaid->value || !$oOrderFile->oxorderfiles__oxpurchasedonly->value}]
                    <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=download" params="sorderfileid="|cat:$oOrderFile->getId()}]">[{$oOrderFile->oxorderfiles__oxfilename->value}]</a> [{$oOrderFile->getFileSize()|oxfilesize}]
                [{else}]
                    <span>[{$oOrderFile->oxorderfiles__oxfilename->value}]</span>
                    <strong>[{oxmultilang ident="DOWNLOADS_PAYMENT_PENDING"}]</strong>
                [{/if}]
            </p>
        [{/foreach}]
        <br>
    [{/if}]
[{/block}]

[{block name="email_html_order_cust_paymentinfo_top"}]
    [{if $payment->oxuserpayments__oxpaymentsid->value != "oxempty"}]
        <h3 class="underline">[{oxmultilang ident="PAYMENT_METHOD"}]</h3>
        <p>
            <b>[{$payment->oxpayments__oxdesc->value}] [{if $basket->getPaymentCosts()}]([{$basket->getFPaymentCosts()}] [{$currency->sign}])[{/if}]</b>
        </p>
        <br>
    [{/if}]
[{/block}]

[{block name="email_html_order_cust_username"}]
    <h3 class="underline">[{oxmultilang ident="EMAIL_ADDRESS"}]</h3>
    <p>[{$user->oxuser__oxusername->value}]</p>
    <br>
[{/block}]

[{block name="email_html_order_cust_deliveryinfo"}]
    [{if $payment->oxuserpayments__oxpaymentsid->value != "oxempty"}]
        <h3 class="underline">[{oxmultilang ident="SELECTED_SHIPPING_CARRIER"}]</h3>
        <p>
            <b>[{$order->oDelSet->oxdeliveryset__oxtitle->value}]</b>
        </p>
        <br>
    [{/if}]
[{/block}]

[{block name="email_html_order_cust_paymentinfo"}]
    [{if $payment->oxuserpayments__oxpaymentsid->value == "oxidpayadvance"}]
        <h3 class="underline">[{oxmultilang ident="BANK_DETAILS"}]</h3>
        <p>
            [{oxmultilang ident="BANK"}] [{$shop->oxshops__oxbankname->value}]<br>
            [{oxmultilang ident="BANK_CODE"}] [{$shop->oxshops__oxbankcode->value}]<br>
            [{oxmultilang ident="BANK_ACCOUNT_NUMBER"}] [{$shop->oxshops__oxbanknumber->value}]<br>
            [{oxmultilang ident="BIC"}] [{$shop->oxshops__oxbiccode->value}]<br>
            [{oxmultilang ident="IBAN"}] [{$shop->oxshops__oxibannumber->value}]
        </p>
        <br>
    [{/if}]
[{/block}]

[{block name="email_html_order_cust_orderemailend"}]
    <p>[{oxcontent ident="oxuserorderemailend"}]</p>
[{/block}]

[{include file="email/html/footer.tpl"}]
