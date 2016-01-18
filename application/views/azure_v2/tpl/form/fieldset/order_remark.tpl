[{if $blOrderRemark}]
    <div class="form-group">
        <label for="orderRemark" class="control-label col-lg-3">[{oxmultilang ident="FORM_FIELDSET_USER_YOURMESSAGE"}]</label>
        <div class="col-lg-9">
            <textarea id="orderRemark" rows="7" name="order_remark" class="form-control" placeholder="[{oxmultilang ident="FORM_FIELDSET_USER_MESSAGEHERE"}]">[{$oView->getOrderRemark()}]</textarea>
        </div>
    </div>
[{/if}]