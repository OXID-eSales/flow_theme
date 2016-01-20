[{if $oView->getWishList()}]
    <form name="wishlist_wishlist_status" action="[{$oViewConf->getSelfActionLink()}]" method="post" class="form-horizontal">
        <div class="wishlistPublish clear">
            <div class="hidden">
                [{$oViewConf->getHiddenSid()}]
                <input type="hidden" name="fnc" value="togglepublic">
                <input type="hidden" name="cl" value="account_wishlist">
            </div>

            <div class="form-group">
                <label class="control-label col-lg-3" for="wishlist_blpublic">[{oxmultilang ident="MESSAGE_MAKE_GIFT_REGISTRY_PUBLISH"}]</label>
                <div class="col-lg-9">
                    <select name="blpublic" id="wishlist_blpublic" class="form-control">
                        <option value="0">[{oxmultilang ident="NO"}]</option>
                        [{assign var="wishlist" value=$oView->getWishList()}]
                        <option value="1"[{if $wishlist->oxuserbaskets__oxpublic->value}] selected="selected"[{/if}]>[{oxmultilang ident="YES"}]</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-offset-3 col-lg-9">
                    <button class="btn btn-primary" type="submit">[{oxmultilang ident="SAVE"}]</button>

                    <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_wishlist" params="blshowsuggest=1"}]" class="btn btn-default">
                        <i class="fa fa-share"></i> [{oxmultilang ident="MESSAGE_SEND_GIFT_REGISTRY"}]
                    </a>
                </div>
            </div>
        </div>
    </form>
[{/if}]