[{assign var="dynvalue" value=$oView->getDynValue()}]
<dl>
    <dt>
        <input id="payment_[{$sPaymentID}]" type="radio" name="paymentid" value="[{$sPaymentID}]" [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]checked[{/if}]>
        <label for="payment_[{$sPaymentID}]"><b>[{$paymentmethod->oxpayments__oxdesc->value}]</b></label>
    </dt>
    <dd class="[{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]activePayment[{/if}]">
        <div class="form-group">
            <label class="req control-label col-lg-3">[{oxmultilang ident="BANK"}]</label>
            <div class="col-lg-9">
                <input id="payment_[{$sPaymentID}]_1" class="form-control js-oxValidate js-oxValidate_notEmpty" type="text" size="20" maxlength="64" name="dynvalue[lsbankname]" value="[{$dynvalue.lsbankname}]" required="required">
            </div>
        </div>
        <div class="form-group">
            <label class="req control-label col-lg-3">[{oxmultilang ident="BANK_CODE"}]</label>
            <div class="col-lg-9">
                <input type="text" class="form-control js-oxValidate js-oxValidate_notEmpty" size="20" maxlength="64" name="dynvalue[lsblz]" value="[{$dynvalue.lsblz}]" required="required">
            </div>
        </div>
        <div class="form-group">
            <label class="req control-label col-lg-3">[{oxmultilang ident="BANK_ACCOUNT_NUMBER"}]</label>
            <div class="col-lg-9">
                <input type="text" class="form-control js-oxValidate js-oxValidate_notEmpty" size="20" maxlength="64" name="dynvalue[lsktonr]" value="[{$dynvalue.lsktonr}]" required="required">
            </div>
        </div>
        <div class="form-group">
            <label class="req control-label col-lg-3">[{oxmultilang ident="BANK_ACCOUNT_HOLDER"}]</label>
            <div class="col-lg-9">
                <input type="text" class="form-control js-oxValidate js-oxValidate_notEmpty" size="20" maxlength="64" name="dynvalue[lsktoinhaber]" value="[{if $dynvalue.lsktoinhaber}][{$dynvalue.lsktoinhaber}][{else}][{$oxcmp_user->oxuser__oxfname->value}] [{$oxcmp_user->oxuser__oxlname->value}][{/if}]" required="required">
            </div>
        </div>

        [{block name="checkout_payment_longdesc"}]
            [{if $paymentmethod->oxpayments__oxlongdesc->value}]
				<div class="row">
					<div class="col-xs-12 col-lg-9 col-lg-offset-3">
						<div class="alert alert-info desc">
							[{$paymentmethod->oxpayments__oxlongdesc->getRawValue()}]
						</div>
					</div>
                </div>
            [{/if}]
        [{/block}]
    </dd>
</dl>
