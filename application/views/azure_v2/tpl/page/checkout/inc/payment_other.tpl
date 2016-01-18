<dl>
    <dt>
        <input id="payment_[{$sPaymentID}]" type="radio" name="paymentid" value="[{$sPaymentID}]" [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]checked[{/if}]>
        <label for="payment_[{$sPaymentID}]"><b>[{$paymentmethod->oxpayments__oxdesc->value}]
        [{if $paymentmethod->getPrice()}]
            [{if $oxcmp_basket->getPayCostNet()}]
                ([{$paymentmethod->getFNettoPrice()}] [{$currency->sign}] [{oxmultilang ident="PAGE_CHECKOUT_BASKETCONTENTS_PLUSTAX1"}] [{$paymentmethod->getFPriceVat()}] )
            [{else}]
                ([{$paymentmethod->getFBruttoPrice()}] [{$currency->sign}])
            [{/if}]
        [{/if}]
        </b></label>
    </dt>
    <dd class="[{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]activePayment[{/if}]">
        [{foreach from=$paymentmethod->getDynValues() item=value name=PaymentDynValues}]
            <div class="form-group">
                <label class="control-label col-lg-3" for="[{$sPaymentID}]_[{$smarty.foreach.PaymentDynValues.iteration}]">[{$value->name}]</label>
                <div class="col-lg-9">
                    <input id="[{$sPaymentID}]_[{$smarty.foreach.PaymentDynValues.iteration}]" type="text" class="form-control textbox" size="20" maxlength="64" name="dynvalue[[{$value->name}]]" value="[{$value->value}]">
                </div>
            </div>
        [{/foreach}]

        <div class="clearfix"></div>

        [{block name="checkout_payment_longdesc"}]
            [{if $paymentmethod->oxpayments__oxlongdesc->value}]
                <div class="alert alert-info col-lg-offset-3 desc">
                    [{$paymentmethod->oxpayments__oxlongdesc->getRawValue()}]
                </div>
            [{/if}]
        [{/block}]
    </dd>
</dl>