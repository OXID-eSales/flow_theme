[{assign var="dynvalue" value=$oView->getDynValue()}]
<dl>
    <dt>
        <input id="payment_[{$sPaymentID}]" type="radio" name="paymentid" value="[{$sPaymentID}]" [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]checked[{/if}]>
        <label for="payment_[{$sPaymentID}]"><b>[{$paymentmethod->oxpayments__oxdesc->value}]</b></label>
    </dt>
    <dd class="[{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]activePayment[{/if}]">

        <div class="form-group">
            <label class="req control-label col-lg-3">[{oxmultilang ident="CREDITCARD"}]</label>
            <div class="col-lg-9">
                <select name="dynvalue[kktype]" class="form-control selectpicker" required="required">
                    <option value="mcd" [{if ($dynvalue.kktype == "mcd" || !$dynvalue.kktype)}]selected[{/if}]>[{oxmultilang ident="CARD_MASTERCARD"}]</option>
                    <option value="vis" [{if $dynvalue.kktype == "vis"}]selected[{/if}]>[{oxmultilang ident="CARD_VISA"}]</option>
                    <!--
                    <option value="amx" [{if $dynvalue.kktype == "amx"}]selected[{/if}]>American Express</option>
                    <option value="dsc" [{if $dynvalue.kktype == "dsc"}]selected[{/if}]>Discover</option>
                    <option value="dnc" [{if $dynvalue.kktype == "dnc"}]selected[{/if}]>Diners Club</option>
                    <option value="jcb" [{if $dynvalue.kktype == "jcb"}]selected[{/if}]>JCB</option>
                    <option value="swi" [{if $dynvalue.kktype == "swi"}]selected[{/if}]>Switch</option>
                    <option value="dlt" [{if $dynvalue.kktype == "dlt"}]selected[{/if}]>Delta</option>
                    <option value="enr" [{if $dynvalue.kktype == "enr"}]selected[{/if}]>EnRoute</option>
                    -->
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="req control-label col-lg-3">[{oxmultilang ident="NUMBER"}]</label>
            <div class="col-lg-9">
                <input type="text" class="form-control js-oxValidate js-oxValidate_notEmpty" size="20" maxlength="64" name="dynvalue[kknumber]" value="[{$dynvalue.kknumber}]" required="required">
            </div>
        </div>

        <div class="form-group">
            <label class="req control-label col-lg-3">[{oxmultilang ident="BANK_ACCOUNT_HOLDER"}]</label>
            <div class="col-lg-9">
                <input type="text" size="20" class="form-control js-oxValidate js-oxValidate_notEmpty" maxlength="64" name="dynvalue[kkname]" value="[{if $dynvalue.kkname}][{$dynvalue.kkname}][{else}][{$oxcmp_user->oxuser__oxfname->value}] [{$oxcmp_user->oxuser__oxlname->value}][{/if}]" required="required">
                <span class="help-block">[{oxmultilang ident="IF_DIFFERENT_FROM_BILLING_ADDRESS"}]</span>
            </div>
        </div>

        <div class="form-group">
            <label class="req control-label col-xs-12 col-lg-3">[{oxmultilang ident="VALID_UNTIL"}]</label>
            <div class="col-xs-6 col-lg-2">
                <select name="dynvalue[kkmonth]" class="form-control selectpicker" required="required">
                    <option [{if $dynvalue.kkmonth == "01"}]selected[{/if}]>01</option>
                    <option [{if $dynvalue.kkmonth == "02"}]selected[{/if}]>02</option>
                    <option [{if $dynvalue.kkmonth == "03"}]selected[{/if}]>03</option>
                    <option [{if $dynvalue.kkmonth == "04"}]selected[{/if}]>04</option>
                    <option [{if $dynvalue.kkmonth == "05"}]selected[{/if}]>05</option>
                    <option [{if $dynvalue.kkmonth == "06"}]selected[{/if}]>06</option>
                    <option [{if $dynvalue.kkmonth == "07"}]selected[{/if}]>07</option>
                    <option [{if $dynvalue.kkmonth == "08"}]selected[{/if}]>08</option>
                    <option [{if $dynvalue.kkmonth == "09"}]selected[{/if}]>09</option>
                    <option [{if $dynvalue.kkmonth == "10"}]selected[{/if}]>10</option>
                    <option [{if $dynvalue.kkmonth == "11"}]selected[{/if}]>11</option>
                    <option [{if $dynvalue.kkmonth == "12"}]selected[{/if}]>12</option>
                </select>
            </div>
            <div class="col-xs-6 col-lg-2">
                <select name="dynvalue[kkyear]" class="form-control selectpicker">
                    [{foreach from=$oView->getCreditYears() item=year}]
                        <option [{if $dynvalue.kkyear == $year}]selected[{/if}]>[{$year}]</option>
                    [{/foreach}]
                </select>
            </div>
            <div class="col-sm-3"></div>
        </div>

        <div class="form-group">
            <label class="req control-label col-lg-3">[{oxmultilang ident="CARD_SECURITY_CODE"}]</label>
            <div class="col-lg-9">
                <input type="text" class="form-control js-oxValidate js-oxValidate_notEmpty" size="20" maxlength="64" name="dynvalue[kkpruef]" value="[{$dynvalue.kkpruef}]" required="required">
                <span class="help-block">[{oxmultilang ident="CARD_SECURITY_CODE_DESCRIPTION"}]</span>
            </div>
        </div>

        <div class="clearfix"></div>

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
