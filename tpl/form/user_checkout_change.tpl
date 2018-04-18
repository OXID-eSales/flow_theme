[{oxscript include="js/libs/jqBootstrapValidation.min.js" priority=10}]

[{capture assign="sValidationJS"}]
    [{strip}]
    $('input,select,textarea').not('[type=submit]').jqBootstrapValidation(
        {
            filter: function()
            {
                if( $( '#shippingAddress' ).css( 'display' ) == 'block' )
                {
                    return $(this).is(':visible, .selectpicker');
                }
                else
                {
                    return $(this).is(':visible, #addressForm .selectpicker');
                }
            }
        }
    );
    [{/strip}]
[{/capture}]

[{oxscript add=$sValidationJS}]

[{block name="user_checkout_change"}]
    <form class="form-horizontal" action="[{$oViewConf->getSslSelfLink()}]" name="order" method="post" novalidate="novalidate">
        [{block name="user_checkout_change_form"}]
            [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
            [{$oViewConf->getHiddenSid()}]
            [{$oViewConf->getNavFormParams()}]
            <input type="hidden" name="cl" value="user">
            <input type="hidden" name="option" value="[{$oView->getLoginOption()}]">
            <input type="hidden" name="fnc" value="changeuser">
            <input type="hidden" name="lgn_cook" value="0">
            <input type="hidden" name="blshowshipaddress" value="1">

            [{block name="user_checkout_change_next_step_top"}]
                <div class="well well-sm cart-buttons">
                    <a href="[{oxgetseourl ident=$oViewConf->getBasketLink()}]" class="btn btn-default pull-left prevStep submitButton largeButton" id="userBackStepTop"><i class="fa fa-caret-left"></i> [{oxmultilang ident="PREVIOUS_STEP"}]</a>
                    <button id="userNextStepTop" class="btn btn-primary pull-right submitButton largeButton nextStep" name="userform" type="submit">[{oxmultilang ident="CONTINUE_TO_NEXT_STEP"}] <i class="fa fa-caret-right"></i></button>
                    <div class="clearfix"></div>
                </div>
            [{/block}]

            <div class="checkoutCollumns clear">
                <div class="panel panel-default">
                    [{block name="user_checkout_billing"}]
                        <div class="panel-heading">
                            [{block name="user_checkout_billing_head"}]
                                <h3 class="panel-title">
                                    [{oxmultilang ident="BILLING_ADDRESS"}]
                                    <button id="userChangeAddress" class="btn btn-xs btn-warning pull-right submitButton largeButton" name="changeBillAddress" type="submit" title="[{oxmultilang ident="CHANGE"}]">
                                        <i class="fa fa-pencil"></i>
                                    </button>
                                </h3>
                                [{oxscript add="$('#userChangeAddress').click( function() { $('#addressForm').show();$('#addressText').hide();$('#userChangeAddress').hide();return false;});"}]
                            [{/block}]
                        </div>
                    [{/block}]
                    <div class="panel-body">
                        [{block name="user_checkout_billing_form"}]
                            <div [{if !$aErrors|@count }]style="display: none;"[{/if}] id="addressForm">
                                [{if not $oxcmp_user->oxuser__oxpassword->value}]
                                    [{include file="form/fieldset/user_email.tpl"}]
                                [{/if}]
                                [{include file="form/fieldset/user_billing.tpl" noFormSubmit=true blSubscribeNews=true blOrderRemark=true}]
                            </div>
                        [{/block}]
                        [{block name="user_checkout_billing_feedback"}]
                            <div class="col-lg-9 col-lg-offset-3" id="addressText">
                                [{include file="widget/address/billing_address.tpl" noFormSubmit=true blSubscribeNews=true blOrderRemark=true}]
                            </div>
                        [{/block}]
                    </div>
                </div>

                <div class="panel panel-default">
                    [{block name="user_checkout_shipping"}]
                        <div class="panel-heading">
                            [{block name="user_checkout_shipping_head"}]
                                <h3 class="panel-title">
                                    [{oxmultilang ident="SHIPPING_ADDRESS"}]
                                    [{if $oView->showShipAddress() and $oxcmp_user->getSelectedAddress()}]
                                        <button id="userChangeShippingAddress" class="btn btn-xs btn-warning pull-right submitButton largeButton" name="changeShippingAddress" type="submit" [{if !$oView->showShipAddress() and $oxcmp_user->getSelectedAddress()}] style="display: none;" [{/if}] title="[{oxmultilang ident="CHANGE"}]">
                                            <i class="fa fa-pencil"></i>
                                        </button>
                                    [{/if}]
                                </h3>
                                [{oxscript add="$('#userChangeShippingAddress').toggle($(this).is(':not(:checked)'));"}]
                            [{/block}]
                        </div>
                    [{/block}]
                    <div class="panel-body">
                        [{block name="user_checkout_shipping_change"}]
                            <div class="form-group">
                                <div class="col-lg-9 col-lg-offset-3">
                                    <div class="checkbox">
                                        <label for="showShipAddress">
                                            <input type="checkbox" name="blshowshipaddress" id="showShipAddress" [{if !$oView->showShipAddress()}]checked[{/if}] value="0"> [{oxmultilang ident="USE_BILLINGADDRESS_FOR_SHIPPINGADDRESS"}]
                                        </label>
                                    </div>
                                </div>
                            </div>
                            [{oxscript add="$('#showShipAddress').change( function() { $('#shippingAddress').toggle($(this).is(':not(:checked)'));});"}]
                        [{/block}]
                        [{block name="user_checkout_shipping_form"}]
                            <div id="shippingAddress" [{if !$oView->showShipAddress()}]style="display: none;"[{/if}]>
                                [{include file="form/fieldset/user_shipping.tpl" noFormSubmit=true onChangeClass='user'}]
                            </div>
                        [{/block}]
                        [{block name="user_checkout_shipping_feedback"}]
                            [{include file="form/fieldset/order_newsletter.tpl" blSubscribeNews=true}]
                            [{include file="form/fieldset/order_remark.tpl" blOrderRemark=true}]
                        [{/block}]
                    </div>
                </div>
            </div>

            [{block name="user_checkout_change_next_step_bottom"}]
                <div class="well well-sm cart-buttons">
                    <a href="[{oxgetseourl ident=$oViewConf->getBasketLink()}]" class="btn btn-default pull-left prevStep submitButton largeButton" id="userBackStepBottom"><i class="fa fa-caret-left"></i> [{oxmultilang ident="PREVIOUS_STEP"}]</a>
                    <button id="userNextStepBottom" class="btn btn-primary pull-right submitButton largeButton nextStep" name="userform" type="submit">[{oxmultilang ident="CONTINUE_TO_NEXT_STEP"}] <i class="fa fa-caret-right"></i></button>
                    <div class="clearfix"></div>
                </div>
            [{/block}]
        [{/block}]
    </form>
    [{include file="form/fieldset/delete_shipping_address_modal.tpl"}]
[{/block}]
