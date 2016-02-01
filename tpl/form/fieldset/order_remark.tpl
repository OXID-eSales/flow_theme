[{if $blOrderRemark}]
    <div class="form-group">
        <label for="orderRemark" class="control-label col-lg-3">[{oxmultilang ident="WHAT_I_WANTED_TO_SAY"}]</label>
        <div class="col-lg-9">
            <textarea id="orderRemark" rows="7" name="order_remark" class="form-control" placeholder="[{oxmultilang ident="HERE_YOU_CAN_ENETER_MESSAGE"}]">[{$oView->getOrderRemark()}]</textarea>
        </div>
    </div>
[{/if}]