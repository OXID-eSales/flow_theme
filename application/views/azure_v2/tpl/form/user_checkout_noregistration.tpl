[{assign var="aErrors" value=$oView->getFieldValidationErrors()}]

[{block name="user_checkout_noregistration"}]
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

    <form class="form-horizontal js-oxValidate" action="[{$oViewConf->getSslSelfLink()}]" name="order" method="post" role="form" novalidate="novalidate">
        [{block name="user_checkout_noregistration_form"}]
            <div class="hidden">
                [{$oViewConf->getHiddenSid()}]
                [{$oViewConf->getNavFormParams()}]
                <input type="hidden" name="cl" value="user">
                <input type="hidden" name="option" value="1">
                [{if !$oxcmp_user->oxuser__oxpassword->value}]
                    <input type="hidden" name="fnc" value="createuser">
                [{else}]
                    <input type="hidden" name="fnc" value="changeuser">
                    <input type="hidden" name="lgn_cook" value="0">
                [{/if}]
                <input type="hidden" id="reloadAddress" name="reloadaddress" value="">
                <input type="hidden" name="blshowshipaddress" value="1">
            </div>

            <div class="well well-sm">
                <a href="[{oxgetseourl ident=$oViewConf->getBasketLink()}]" class="btn btn-default prevStep submitButton largeButton" id="userBackStepTop">[{oxmultilang ident="FORM_USER_CHECKOUT_NOREGISTRATION_BACKSTEP"}]</a>
                <div class="clearfix"></div>
            </div>

            <div class="checkoutCollumns">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">[{oxmultilang ident="NOTREGISTERED_ACCOUNTINFO"}]</h3>
                    </div>
                    <div class="panel-body">
                        [{include file="form/fieldset/user_noaccount.tpl"}]
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">[{oxmultilang ident="FORM_REGISTER_BILLINGADDRESS"}]</h3>
                    </div>
                    <div class="panel-body">
                        [{include file="form/fieldset/user_billing.tpl" noFormSubmit=true blOrderRemark=true}]
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">[{oxmultilang ident="FORM_REGISTER_SHIPPINGADDRESS"}]</h3>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <div class="col-lg-9 col-lg-offset-3">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="blshowshipaddress" id="showShipAddress" [{if !$oView->showShipAddress()}]checked[{/if}] value="0"> [{oxmultilang ident="FORM_REGISTER_USE_BILLINGADDRESS_FOR_SHIPPINGADDRESS"}]
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div id="shippingAddress"[{if !$oView->showShipAddress()}] style="display: none;"[{/if}]>
                            [{include file="form/fieldset/user_shipping.tpl" noFormSubmit=true}]
                        </div>

                        [{include file="form/fieldset/order_remark.tpl" blOrderRemark=true}]
                    </div>
                </div>
            </div>

            [{oxscript add="$('#showShipAddress').change( function() { $('#shippingAddress').toggle($(this).is(':not(:checked)'));});"}]

            <div class="well well-sm">
                <a href="[{oxgetseourl ident=$oViewConf->getBasketLink()}]" class="btn btn-default pull-left prevStep submitButton largeButton" id="userBackStepBottom">[{oxmultilang ident="FORM_USER_CHECKOUT_NOREGISTRATION_BACKSTEP"}]</a>
                <button id="userNextStepBottom" class="btn btn-primary pull-right submitButton largeButton nextStep" name="userform" type="submit">[{oxmultilang ident="FORM_USER_CHECKOUT_NOREGISTRATION_NEXTSTEP"}]</button>
                <div class="clearfix"></div>
            </div>
        [{/block}]
    </form>
[{/block}]