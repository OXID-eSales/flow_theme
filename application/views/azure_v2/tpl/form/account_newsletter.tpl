<form action="[{$oViewConf->getSelfActionLink()}]" name="newsletter" class="form-horizontal" method="post">
    <div class="hidden">
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="fnc" value="subscribe">
        <input type="hidden" name="cl" value="account_newsletter">
    </div>

    <div class="form-group">
        <label class="control-label col-lg-3" for="status">[{oxmultilang ident="NEWSLETTER_SUBSCRIPTION"}]</label>
        <div class="col-lg-4">
            <select name="status" id="status" class="form-control selectpicker">
                <option value="1"[{if $oView->isNewsletter()}] selected[{/if}] >[{oxmultilang ident="YES"}]</option>
                <option value="0"[{if !$oView->isNewsletter()}] selected[{/if}] >[{oxmultilang ident="NO"}]</option>
            </select>
        </div>
    </div>

    <div class="form-group">
        <div class="col-lg-offset-3 col-lg-7">
            <p>[{oxmultilang ident="MESSAGE_NEWSLETTER_SUBSCRIPTION"}]</p>
            <button id="newsletterSettingsSave" type="submit" class="btn btn-primary">[{oxmultilang ident="SAVE"}]</button>
        </div>
    </div>
</form>