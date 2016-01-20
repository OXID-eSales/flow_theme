[{if $blSubscribeNews}]
    <div class="form-group">
        [{block name="user_billing_newsletter"}]
            <div class="col-lg-9 col-lg-offset-3">
                <input type="hidden" name="blnewssubscribed" value="0">
                <div class="checkbox">
                    <label for="subscribeNewsletter">
                        <input type="checkbox" name="blnewssubscribed" id="subscribeNewsletter" [{if $oView->isNewsSubscribed()}]checked[{/if}] value="1"> [{oxmultilang ident="NEWSLETTER_SUBSCRIPTION"}]
                    </label>
                </div>
                <span class="help-block">[{oxmultilang ident="MESSAGE_NEWSLETTER_SUBSCRIPTION"}]</span>
            </div>
        [{/block}]
    </div>
[{/if}]