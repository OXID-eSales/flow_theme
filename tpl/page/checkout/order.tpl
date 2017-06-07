[{capture append="oxidBlock_content"}]

    [{block name="checkout_order_errors"}]
        [{if $oView->isConfirmAGBActive() && $oView->isConfirmAGBError() == 1}]
            [{include file="message/error.tpl" statusMessage="READ_AND_CONFIRM_TERMS"|oxmultilangassign}]
        [{/if}]
        [{assign var="iError" value=$oView->getAddressError()}]
        [{if $iError == 1}]
           [{include file="message/error.tpl" statusMessage="ERROR_DELIVERY_ADDRESS_WAS_CHANGED_DURING_CHECKOUT"|oxmultilangassign}]
        [{/if}]
    [{/block}]

    [{* ordering steps *}]
    [{include file="page/checkout/inc/steps.tpl" active=4}]

    [{block name="checkout_order_main"}]
        [{if !$oView->showOrderButtonOnTop()}]
            <div class="alert alert-info">[{oxmultilang ident="MESSAGE_SUBMIT_BOTTOM"}]</div>
        [{/if}]

        [{block name="checkout_order_details"}]
            [{if !$oxcmp_basket->getProductsCount() }]
                [{block name="checkout_order_emptyshippingcart"}]
                    <div class="alert alert-danger">[{oxmultilang ident="BASKET_EMPTY"}]</div>
                [{/block}]
            [{else}]
                [{assign var="currency" value=$oView->getActCurrency()}]

                [{block name="checkout_order_next_step_top"}]
                    [{if $oView->isLowOrderPrice()}]
                        [{block name="checkout_order_loworderprice_top"}]
                            <div class="alert alert-info">[{oxmultilang ident="MIN_ORDER_PRICE"}] [{$oView->getMinOrderPrice()}] [{$currency->sign}]</div>
                        [{/block}]
                    [{else}]
                        [{if $oView->showOrderButtonOnTop()}]
                            <div class="well well-sm">
                                <a href="[{oxgetseourl ident=$oViewConf->getPaymentLink()}]" class="btn btn-default prevStep submitButton largeButton">[{oxmultilang ident="PREVIOUS_STEP"}]</a>
                            </div>
                        [{/if}]
                    [{/if}]
                [{/block}]

                [{block name="checkout_order_vouchers"}]
                    [{if $oViewConf->getShowVouchers() && $oxcmp_basket->getVouchers()}]
                        [{oxmultilang ident="USED_COUPONS"}]
                        [{foreach from=$Errors.basket item=oEr key=key}]
                            [{if $oEr->getErrorClassType() == 'oxVoucherException'}]
                                <div class="alert alert-danger">
                                    [{oxmultilang ident="PAGE_CHECKOUT_ORDER_COUPONNOTACCEPTED1"}] [{$oEr->getValue('voucherNr')}] [{oxmultilang ident="PAGE_CHECKOUT_ORDER_COUPONNOTACCEPTED2"}]<br>
                                    [{oxmultilang ident="REASON"}]
                                    [{$oEr->getOxMessage()}]
                                </div>
                            [{/if}]
                        [{/foreach}]
                        <div class="alert alert-info">
                            [{foreach from=$oxcmp_basket->getVouchers() item=sVoucher key=key name=aVouchers}]
                                [{$sVoucher->sVoucherNr}]<br>
                            [{/foreach}]
                        </div>
                    [{/if}]
                [{/block}]

                [{block name="checkout_order_address"}]
                    <div id="orderAddress" class="row">
                        <div class="col-xs-12 col-md-6">
                            <form action="[{$oViewConf->getSslSelfLink()}]" method="post">
                                <div class="hidden">
                                    [{$oViewConf->getHiddenSid()}]
                                    <input type="hidden" name="cl" value="user">
                                    <input type="hidden" name="fnc" value="">
                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">
                                            [{oxmultilang ident="BILLING_ADDRESS"}]
                                            <button type="submit" class="btn btn-xs btn-warning pull-right submitButton largeButton" title="[{oxmultilang ident="EDIT"}]">
                                                <i class="fa fa-pencil"></i>
                                            </button>
                                        </h3>
                                    </div>
                                    <div class="panel-body">
                                        [{include file="widget/address/billing_address.tpl"}]
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-xs-12 col-md-6">
                            <form action="[{$oViewConf->getSslSelfLink()}]" method="post">
                                <div class="hidden">
                                    [{$oViewConf->getHiddenSid()}]
                                    <input type="hidden" name="cl" value="user">
                                    <input type="hidden" name="fnc" value="">
                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">
                                            [{oxmultilang ident="SHIPPING_ADDRESS"}]
                                            <button type="submit" class="btn btn-xs btn-warning pull-right submitButton largeButton" title="[{oxmultilang ident="EDIT"}]">
                                                <i class="fa fa-pencil"></i>
                                            </button>
                                        </h3>
                                    </div>
                                    <div class="panel-body">
                                        [{assign var="oDelAdress" value=$oView->getDelAddress()}]
                                        [{if $oDelAdress}]
                                            [{include file="widget/address/shipping_address.tpl" delivadr=$oDelAdress}]
                                        [{else}]
                                            [{include file="widget/address/billing_address.tpl"}]
                                        [{/if}]
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                [{/block}]

                [{block name="shippingAndPayment"}]
                    <div class="row">
                        <div class="col-xs-12 col-md-6" id="orderShipping">
                            <form action="[{$oViewConf->getSslSelfLink()}]" method="post">
                                <div class="hidden">
                                    [{$oViewConf->getHiddenSid()}]
                                    <input type="hidden" name="cl" value="payment">
                                    <input type="hidden" name="fnc" value="">
                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">
                                            [{oxmultilang ident="SHIPPING_CARRIER"}]
                                            <button type="submit" class="btn btn-xs btn-warning pull-right submitButton largeButton" title="[{oxmultilang ident="EDIT"}]">
                                                <i class="fa fa-pencil"></i>
                                            </button>
                                        </h3>
                                    </div>
                                    <div class="panel-body">
                                        [{assign var="oShipSet" value=$oView->getShipSet()}]
                                        [{$oShipSet->oxdeliveryset__oxtitle->value}]
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-xs-12 col-md-6" id="orderPayment">
                            <form action="[{$oViewConf->getSslSelfLink()}]" method="post">
                                <div class="hidden">
                                    [{$oViewConf->getHiddenSid()}]
                                    <input type="hidden" name="cl" value="payment">
                                    <input type="hidden" name="fnc" value="">
                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">
                                            [{oxmultilang ident="PAYMENT_METHOD"}]
                                            <button type="submit" class="btn btn-xs btn-warning pull-right submitButton largeButton" title="[{oxmultilang ident="EDIT"}]">
                                                <i class="fa fa-pencil"></i>
                                            </button>
                                        </h3>
                                    </div>
                                    <div class="panel-body">
                                        [{assign var="payment" value=$oView->getPayment()}]
                                        [{$payment->oxpayments__oxdesc->value}]
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                [{/block}]

                [{block name="checkout_order_remark"}]
                    [{if $oView->getOrderRemark()}]
                        <form action="[{$oViewConf->getSslSelfLink()}]" method="post">
                            <div class="hidden">
                                [{$oViewConf->getHiddenSid()}]
                                <input type="hidden" name="cl" value="user">
                                <input type="hidden" name="fnc" value="">
                            </div>

                            <div class="panel panel-default orderRemarks">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        [{oxmultilang ident="WHAT_I_WANTED_TO_SAY"}]
                                        <button type="submit" class="btn btn-xs btn-warning pull-right submitButton largeButton" title="[{oxmultilang ident="EDIT"}]">
                                            <i class="fa fa-pencil"></i>
                                        </button>
                                    </h3>
                                </div>
                                <div class="panel-body">
                                    [{$oView->getOrderRemark()|@nl2br}]
                                </div>
                            </div>
                        </form>
                    [{/if}]
                [{/block}]

                [{if !$oView->isLowOrderPrice()}]
                    <div id="orderAgbTop">
                        <form action="[{$oViewConf->getSslSelfLink()}]" method="post" id="orderConfirmAgbTop">
                            [{$oViewConf->getHiddenSid()}]
                            [{$oViewConf->getNavFormParams()}]
                            <input type="hidden" name="cl" value="order">
                            <input type="hidden" name="fnc" value="[{$oView->getExecuteFnc()}]">
                            <input type="hidden" name="challenge" value="[{$challenge}]">
                            <input type="hidden" name="sDeliveryAddressMD5" value="[{$oView->getDeliveryAddressMD5()}]">

                            [{include file="page/checkout/inc/agb.tpl"}]
                        </form>
                    </div>
                [{/if}]

                <div id="orderEditCart">
                    <form action="[{$oViewConf->getSslSelfLink()}]" method="post">
                        <div class="hidden">
                            [{$oViewConf->getHiddenSid()}]
                            <input type="hidden" name="cl" value="basket">
                            <input type="hidden" name="fnc" value="">
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    [{oxmultilang ident="CART"}]
                                    <button type="submit" class="btn btn-xs btn-warning pull-right submitButton largeButton" title="[{oxmultilang ident="EDIT"}]">
                                        <i class="fa fa-pencil"></i>
                                    </button>
                                </h3>
                            </div>
                            <div class="panel-body">
                                [{block name="order_basket"}]
                                    <div class="lineBox">
                                        [{include file="page/checkout/inc/basketcontents.tpl" editable=false}]
                                    </div>
                                [{/block}]
                            </div>
                        </div>
                    </form>
                </div>
            [{/if}]

            [{block name="checkout_order_next_step_bottom"}]
                [{if $oView->isLowOrderPrice()}]
                    [{block name="checkout_order_loworderprice_bottom"}]
                        <div class="alert alert-info">
                            <div>[{oxmultilang ident="MIN_ORDER_PRICE"}] [{$oView->getMinOrderPrice()}] [{$currency->sign}]</div>
                        </div>
                    [{/block}]
                [{else}]
                    [{block name="checkout_order_btn_confirm_bottom"}]
                        <form action="[{$oViewConf->getSslSelfLink()}]" method="post" id="orderConfirmAgbBottom" class="form-horizontal">
                            <div class="hidden">
                                [{$oViewConf->getHiddenSid()}]
                                [{$oViewConf->getNavFormParams()}]
                                <input type="hidden" name="cl" value="order">
                                <input type="hidden" name="fnc" value="[{$oView->getExecuteFnc()}]">
                                <input type="hidden" name="challenge" value="[{$challenge}]">
                                <input type="hidden" name="sDeliveryAddressMD5" value="[{$oView->getDeliveryAddressMD5()}]">

                                [{if $oView->isActive('PsLogin') || !$oView->isConfirmAGBActive()}]
                                    <input type="hidden" name="ord_agb" value="1">
                                [{else}]
                                    <input type="hidden" name="ord_agb" value="0">
                                [{/if}]
                                <input type="hidden" name="oxdownloadableproductsagreement" value="0">
                                <input type="hidden" name="oxserviceproductsagreement" value="0">
                            </div>

                            <div class="well well-sm cart-buttons">
                                [{block name="checkout_order_btn_submit_bottom"}]
                                <button type="submit" class="btn btn-lg btn-primary pull-right submitButton nextStep largeButton">
                                    <i class="fa fa-check"></i> [{oxmultilang ident="SUBMIT_ORDER"}]
                                </button>
                                [{/block}]

                                <div class="clearfix"></div>
                            </div>
                        </form>
                    [{/block}]
                [{/if}]
            [{/block}]
        [{/block}]
    [{/block}]
    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]

[{assign var="template_title" value="REVIEW_YOUR_ORDER"|oxmultilangassign}]
[{include file="layout/page.tpl" title=$template_title location=$template_title}]
