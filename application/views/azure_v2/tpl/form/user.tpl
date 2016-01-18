[{if $oxcmp_shop->oxshops__oxproductive->value}]
    [{oxscript include="js/libs/jqBootstrapValidation.min.js" priority=10}]
[{else}]
    [{oxscript include="js/libs/jqBootstrapValidation.js" priority=10}]
[{/if}]

[{capture assign="sValidationJS"}]
    [{strip}]
        $('input,select,textarea').not('[type=submit]').jqBootstrapValidation(
            {
                filter: function()
                {
                    if( $( '#shippingAddress' ).css( 'display' ) == 'block' )
                    {
                        return $(this).is(':visible, .selectpicker[required]');
                    }
                    else
                    {
                        return $(this).is(':visible, #addressForm .selectpicker[required]');
                    }
                }
            }
        );
    [{/strip}]
[{/capture}]

[{oxscript add=$sValidationJS}]

<form class="js-oxValidate form-horizontal" action="[{$oViewConf->getSelfActionLink()}]" name="order" method="post" novalidate="novalidate">
    [{assign var="aErrors" value=$oView->getFieldValidationErrors()}]
    <div class="addressCollumns">
        <div class="hidden">
            [{$oViewConf->getHiddenSid()}]
            [{$oViewConf->getNavFormParams()}]
            <input type="hidden" name="fnc" value="changeuser_testvalues">
            <input type="hidden" name="cl" value="account_user">
            <input type="hidden" name="CustomError" value='user'>
            <input type="hidden" name="blshowshipaddress" value="1">
        </div>

        [{* Rechnungsadresse *}]
        <div class="panel panel-default">
            <div class="panel-heading">
                [{oxmultilang ident="FORM_USER_BILLINGADDRESS"}]
                <button id="userChangeAddress" class="btn btn-warning btn-xs hasTooltip pull-right" name="changeBillAddress" type="button" title="[{oxmultilang ident="PAGE_CHECKOUT_BASKET_CHANGE"}]">
                    <i class="fa fa-pencil"></i>
                </button>
            </div>
            <div class="panel-body">
                <div id="addressText">
                    [{include file="widget/address/billing_address.tpl"}]
                </div>
                <div style="display: none;" id="addressForm">
                    [{include file="form/fieldset/user_email.tpl"}]
                    [{include file="form/fieldset/user_billing.tpl" noFormSubmit=true}]
                </div>
            </div>
        </div>

        [{oxscript add="$('#userChangeAddress').click( function() { $('#addressForm, #addressText').toggle();return false;});"}]

        [{* Lieferadresse *}]
        <div class="panel panel-default">
            <div class="panel-heading">[{oxmultilang ident="FORM_USER_SHIPPINGADDRESSES"}]</div>
            <div class="panel-body">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="blshowshipaddress" id="showShipAddress" [{if !$oView->showShipAddress()}]checked[{/if}] value="0"> [{oxmultilang ident="FORM_REGISTER_USE_BILLINGADDRESS_FOR_SHIPPINGADDRESS"}]
                    </label>
                </div>
                <div id="shippingAddress" class="spacer" [{if !$oView->showShipAddress()}] style="display: none;" [{/if}]>
                    [{include file="form/fieldset/user_shipping.tpl" noFormSubmit=true}]
                </div>
            </div>
        </div>
        [{oxscript add="$('#showShipAddress').change( function() { $('#shippingAddress').toggle($(this).is(':not(:checked)')); });"}]
    </div>
    <div class="form-group">
        <div class="col-lg-12">
            <button id="accUserSaveTop" class="btn btn-primary" name="userform" type="submit">[{oxmultilang ident="FORM_FIELDSET_USER_BILLING_SAVE"}]</button>
        </div>
    </div>
</form>

