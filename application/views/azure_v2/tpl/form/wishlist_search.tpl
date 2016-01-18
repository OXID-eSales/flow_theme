<form name="wishlist_searchbox" action="[{$oViewConf->getSelfActionLink()}]" method="post" class="form-horizontal">
    <div class="hidden">
        [{$oViewConf->getHiddenSid()}]
        <input type="hidden" name="cl" value="[{$searchClass}]">
        <input type="hidden" name="fnc" value="searchforwishlist">
    </div>

    <div class="form-group">
        <label class="control-label col-lg-3" for="input_[{$searchClass}]">[{oxmultilang ident="FORM_WISHLIST_SEARCH_SEARCHWISHLIST"}]</label>
        <div class="col-lg-9">
            <div class="input-group">
                <input type="text" name="search" id="input_[{$searchClass}]" value="[{$oView->getWishListSearchParam()}]" class="form-control" placeholder="[{oxmultilang ident="FORM_WISHLIST_SEARCH_ENTEREMAILORNAME"}]">
                <span class="input-group-btn">
                    <button class="btn btn-primary" type="submit">[{oxmultilang ident="FORM_WISHLIST_SEARCH_SEARCH"}]</button>
                </span>
            </div>
        </div>
    </div>
</form>

[{if $oView->getWishListUsers()}]
    <hr>

    <p class="lead">[{oxmultilang ident="FORM_WISHLIST_SEARCH_RESULTS"}]</p>
    <ul class="wishlistResults">
        [{foreach from=$oView->getWishListUsers() item=wishres}]
            <li>
                <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=wishlist" params="wishid=`$wishres->oxuser__oxid->value`"}]">
                    [{oxmultilang ident="FORM_WISHLIST_SEARCH_WISHLISTOFF"}] [{$wishres->oxuser__oxfname->value}]&nbsp;[{$wishres->oxuser__oxlname->value}]
                </a>
            </li>
        [{/foreach}]
    </ul>
[{/if}]