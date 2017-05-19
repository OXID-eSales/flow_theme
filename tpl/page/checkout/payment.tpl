[{capture append="oxidBlock_content"}]
    [{* ordering steps *}]
    [{include file="page/checkout/inc/steps.tpl" active=3}]

    [{block name="checkout_payment_main"}]
        [{assign var="currency" value=$oView->getActCurrency()}]
        [{block name="change_shipping"}]
            [{if $oView->getAllSets()}]
                [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
                <form action="[{$oViewConf->getSslSelfLink()}]" name="shipping" id="shipping" method="post">
                    <div class="hidden">
                        [{$oViewConf->getHiddenSid()}]
                        [{$oViewConf->getNavFormParams()}]
                        <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
                        <input type="hidden" name="fnc" value="changeshipping">
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">[{if $oView->getAllSetsCnt() > 1}][{oxmultilang ident="SELECT_SHIPPING_METHOD"}][{else}][{oxmultilang ident="SELECTED_SHIPPING_CARRIER"}][{/if}]</h3>
                        </div>
                        <div class="panel-body">
                            [{block name="act_shipping"}]
                                <div class="form-group">
                                    <select class="form-control selectpicker" name="sShipSet" onchange="this.form.submit();">
                                        [{foreach key=sShipID from=$oView->getAllSets() item=oShippingSet name=ShipSetSelect}]
                                            <option value="[{$sShipID}]" [{if $oShippingSet->blSelected}]SELECTED[{/if}]>[{$oShippingSet->oxdeliveryset__oxtitle->value}]</option>
                                        [{/foreach}]
                                    </select>
                                </div>
                                <noscript>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-success submitButton largeButton">[{oxmultilang ident="UPDATE_SHIPPING_CARRIER"}]</button>
                                    </div>
                                </noscript>
                            [{/block}]

                            [{assign var="oDeliveryCostPrice" value=$oxcmp_basket->getDeliveryCost()}]
                            [{if $oDeliveryCostPrice && $oDeliveryCostPrice->getPrice() > 0}]
                                [{if $oViewConf->isFunctionalityEnabled('blShowVATForDelivery') }]
                                    <div id="shipSetCost">
                                        <b>[{oxmultilang ident="CHARGES" suffix="COLON"}] [{oxprice price=$oDeliveryCostPrice->getNettoPrice() currency=$currency}]
                                            ([{oxmultilang ident="PLUS_VAT"}] [{oxprice price=$oDeliveryCostPrice->getVatValue() currency=$currency}])
                                        </b>
                                    </div>
                                [{else}]
                                    <div id="shipSetCost">
                                        <b>[{oxmultilang ident="CHARGES" suffix="COLON"}] [{oxprice price=$oDeliveryCostPrice->getBruttoPrice() currency=$currency}]</b>
                                    </div>
                                [{/if}]
                            [{/if}]
                        </div>
                    </div>
                </form>
            [{/if}]
        [{/block}]

        [{block name="checkout_payment_errors"}]
            [{assign var="iPayError" value=$oView->getPaymentError()}]

            [{if $iPayError == 1}]
                <div class="alert alert-danger">[{oxmultilang ident="ERROR_MESSAGE_COMPLETE_FIELDS_CORRECTLY"}]</div>
            [{elseif $iPayError == 2}]
                <div class="alert alert-danger">[{oxmultilang ident="MESSAGE_PAYMENT_AUTHORIZATION_FAILED"}]</div>
            [{elseif $iPayError == 4}]
                <div class="alert alert-danger">[{oxmultilang ident="MESSAGE_UNAVAILABLE_SHIPPING_METHOD"}]</div>
            [{elseif $iPayError == 5}]
                <div class="alert alert-danger">[{oxmultilang ident="MESSAGE_PAYMENT_AUTHORIZATION_FAILED"}]</div>
            [{elseif $iPayError >= 6}]
                <!--Add custom error message here-->
                <div class="alert alert-danger">[{oxmultilang ident="MESSAGE_PAYMENT_AUTHORIZATION_FAILED"}]</div>
            [{elseif $iPayError == -1}]
                <div class="alert alert-danger">[{oxmultilang ident="MESSAGE_PAYMENT_UNAVAILABLE_PAYMENT_ERROR"}] "[{$oView->getPaymentErrorText()}]").</div>
            [{elseif $iPayError == -2}]
                <div class="alert alert-danger">[{oxmultilang ident="MESSAGE_NO_SHIPPING_METHOD_FOUND"}]</div>
            [{elseif $iPayError == -3}]
                <div class="alert alert-danger">[{oxmultilang ident="MESSAGE_PAYMENT_SELECT_ANOTHER_PAYMENT"}]</div>
            [{elseif $iPayError == -4}]
                <div class="alert alert-danger">[{oxmultilang ident="MESSAGE_PAYMENT_BANK_CODE_INVALID"}]</div>
            [{elseif $iPayError == -5}]
                <div class="alert alert-danger">[{oxmultilang ident="MESSAGE_PAYMENT_ACCOUNT_NUMBER_INVALID"}]</div>
            [{/if}]
        [{/block}]

        [{block name="change_payment"}]
            [{oxscript include="js/widgets/oxpayment.min.js" priority=10}]
            [{oxscript include="js/libs/jqBootstrapValidation.min.js" priority=10}]
            [{oxscript add="$( '#payment' ).oxPayment();"}]
            [{oxscript add="$('input,select,textarea').not('[type=submit]').jqBootstrapValidation();"}]
            <form action="[{$oViewConf->getSslSelfLink()}]" class="form-horizontal js-oxValidate payment" id="payment" name="order" method="post" novalidate="novalidate">
                <div class="hidden">
                    [{$oViewConf->getHiddenSid()}]
                    [{$oViewConf->getNavFormParams()}]
                    <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
                    <input type="hidden" name="fnc" value="validatepayment">
                </div>

                [{if $oView->getPaymentList()}]
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 id="paymentHeader" class="panel-title">[{oxmultilang ident="PAYMENT_METHOD"}]</h3>
                        </div>
                        <div class="panel-body">
                            [{assign var="inptcounter" value="-1"}]
                            [{foreach key=sPaymentID from=$oView->getPaymentList() item=paymentmethod name=PaymentSelect}]
                                [{assign var="inptcounter" value="`$inptcounter+1`"}]
                                [{block name="select_payment"}]
                                    <div class="well well-sm">
                                        [{if $sPaymentID == "oxidcashondel"}]
                                            [{include file="page/checkout/inc/payment_oxidcashondel.tpl"}]
                                        [{elseif $sPaymentID == "oxidcreditcard"}]
                                            [{include file="page/checkout/inc/payment_oxidcreditcard.tpl"}]
                                        [{elseif $sPaymentID == "oxiddebitnote"}]
                                            [{include file="page/checkout/inc/payment_oxiddebitnote.tpl"}]
                                        [{else}]
                                            [{include file="page/checkout/inc/payment_other.tpl"}]
                                        [{/if}]
                                    </div>
                                [{/block}]
                            [{/foreach}]

                        </div>
                    </div>

                    [{block name="checkout_payment_nextstep"}]
                        [{if $oView->isLowOrderPrice()}]
                            <div class="alert alert-info">
                                <b>[{oxmultilang ident="MIN_ORDER_PRICE"}] [{$oView->getMinOrderPrice()}] [{$currency->sign}]</b>
                            </div>
                        [{else}]
                            <div class="well well-sm cart-buttons">
                                <a href="[{oxgetseourl ident=$oViewConf->getOrderLink()}]" class="btn btn-default pull-left prevStep submitButton largeButton" id="paymentBackStepBottom"><i class="fa fa-caret-left"></i> [{oxmultilang ident="PREVIOUS_STEP"}]</a>
                                <button type="submit" name="userform" class="btn btn-primary pull-right submitButton nextStep largeButton" id="paymentNextStepBottom">[{oxmultilang ident="CONTINUE_TO_NEXT_STEP"}] <i class="fa fa-caret-right"></i></button>
                                <div class="clearfix"></div>
                            </div>
                        [{/if}]
                    [{/block}]

                [{elseif $oView->getEmptyPayment()}]
                    [{block name="checkout_payment_nopaymentsfound"}]
                        <div class="lineBlock"></div>
                        <h3 id="paymentHeader" class="blockHead">[{oxmultilang ident="PAYMENT_INFORMATION"}]</h3>
                        [{oxifcontent ident="oxnopaymentmethod" object="oCont"}]
                            [{$oCont->oxcontents__oxcontent->value}]
                        [{/oxifcontent}]
                        <input type="hidden" name="paymentid" value="oxempty">
                        <div class="lineBox clear">
                            <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=user"}]" class="btn btn-default pull-left prevStep submitButton largeButton"><i class="fa fa-caret-left"></i> [{oxmultilang ident="PREVIOUS_STEP"}]</a>
                            <button type="submit" name="userform" class="btn btn-primary pull-right submitButton nextStep largeButton" id="paymentNextStepBottom">[{oxmultilang ident="CONTINUE_TO_NEXT_STEP"}] <i class="fa fa-caret-right"></i></button>
                        </div>
                    [{/block}]
                [{/if}]
            </form>
        [{/block}]
    [{/block}]
    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]

[{include file="layout/page.tpl"}]
