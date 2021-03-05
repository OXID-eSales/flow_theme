<div class="wishlistSuggest clear">
    [{if $oView->getWishList() && $oView->showSuggest()}]
        [{if !empty($Errors.account_whishlist) && $Errors.account_whishlist|is_array}]
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
                <input type="hidden" name="editval[send_subject]" value="[{oxmultilang ident="GIFT_REGISTRY_OF"}] [{$oxcmp_shop->oxshops__oxname->value}]">
                <input type="hidden" name="CustomError" value='account_whishlist'>
            </div>
                <span class="lead">[{oxmultilang ident="SEND_GIFT_REGISTRY"}]</span>

                <div class="form-group">
                    <label class="control-label col-lg-3">[{oxmultilang ident="RECIPIENT_NAME"}]</label>
                    <div class="col-lg-9">
                        <input type="text" name="editval[rec_name]" class="form-control" maxlength="70" value="[{if isset($editval->rec_name)}][{$editval->rec_name}][{/if}]">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-3">[{oxmultilang ident="RECIPIENT_EMAIL"}]</label>
                    <div class="col-lg-9">
                        <input type="email" name="editval[rec_email]" class="form-control" maxlength="70" value="[{if isset($editval->rec_email)}][{$editval->rec_email}][{/if}]">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-lg-3">[{oxmultilang ident="MESSAGE"}]</label>
                    <div class="col-lg-9">
                        <textarea rows="6" class="form-control" name="editval[send_message]">[{if isset($editval->send_message) && $editval->send_message}][{$editval->send_message}][{else}][{oxmultilang ident="SHOP_SUGGEST_BUY_FOR_ME" args=$oxcmp_shop->oxshops__oxname->value}][{/if}]</textarea>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-offset-3 col-lg-9">
                        <button class="btn btn-primary" type="submit">[{oxmultilang ident="SUBMIT"}]</button>
                    </div>
                </div>
        </form>
        <hr>
    [{/if}]
</div>