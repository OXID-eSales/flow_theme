<div class="wishlistSuggest clear">
    [{if $oView->getWishList() && $oView->showSuggest()}]
        [{if count($Errors.account_whishlist)>0}]
            [{foreach from=$Errors.account_whishlist item=oEr key=key}]
                <p class="alert alert-danger">[{$oEr->getOxMessage()}]</p>
            [{/foreach}]
        [{/if}]
        [{assign var="editval" value=$oView->getEnteredData()}]
        <form action="[{$oViewConf->getSelfActionLink()}]" method="post" class="form-horizontal">
            <div class="hidden">
                [{$oViewConf->getHiddenSid()}]
                <input type="hidden" name="fnc" value="sendwishlist">
                <input type="hidden" name="cl" value="account_wishlist">
                <input type="hidden" name="blshowsuggest" value="1">
                <input type="hidden" name="editval[send_subject]" value="[{oxmultilang ident="FORM_WISHLIST_SUGGEST_GIFTREGISTRYAT"}] [{$oxcmp_shop->oxshops__oxname->value}]">
                <input type="hidden" name="CustomError" value='account_whishlist'>
            </div>
                <span class="lead">[{oxmultilang ident="FORM_WISHLIST_SUGGEST_SENDWISHLIST"}]</span>

                <div class="form-group">
                    <label class="control-label col-lg-3">[{oxmultilang ident="FORM_WISHLIST_SUGGEST_RECIPIENTSNAME"}]</label>
                    <div class="col-lg-9">
                        <input type="text" name="editval[rec_name]" class="form-control" maxlength="70" value="[{$editval->rec_name}]">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-3">[{oxmultilang ident="FORM_WISHLIST_SUGGEST_RECIPIENTSEMAIL"}]</label>
                    <div class="col-lg-9">
                        <input type="email" name="editval[rec_email]" class="form-control" maxlength="70" value="[{$editval->rec_email}]">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-3">[{oxmultilang ident="MESSAGE"}]</label>
                    <div class="col-lg-9">
                        <textarea rows="6" class="form-control" name="editval[send_message]">[{if $editval->send_message}][{$editval->send_message}][{else}][{oxmultilang ident="FORM_WISHLIST_SUGGEST_BUYFORME1"}] [{$oxcmp_shop->oxshops__oxname->value}] [{oxmultilang ident="FORM_WISHLIST_SUGGEST_BUYFORME2"}][{/if}]</textarea>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-offset-3 col-lg-9">
                        <button class="btn btn-primary" type="submit">[{oxmultilang ident="FORM_WISHLIST_SUGGEST_SEND2"}]</button>
                    </div>
                </div>
        </form>
        <hr>
    [{/if}]
</div>