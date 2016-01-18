<nav id="account_menu">
    <ul class="nav nav-pills nav-stacked">
        [{block name="account_menu"}]
            <li [{if $active_link == "password"}]class="active"[{/if}]>
                <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_password"}]" title="[{oxmultilang ident="CHANGE_PASSWORD"}]">[{oxmultilang ident="CHANGE_PASSWORD"}]</a>
            </li>
            <li [{if $active_link == "newsletter"}]class="active"[{/if}]>
                <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_newsletter"}]" title="[{oxmultilang ident="PAGE_ACCOUNT_INC_ACCOUNT_MENU_NEWSLETTERSETTINGS"}]">[{oxmultilang ident="PAGE_ACCOUNT_INC_ACCOUNT_MENU_NEWSLETTERSETTINGS"}]</a>
            </li>
            <li [{if $active_link == "billship"}]class="active"[{/if}]>
                <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_user"}]" title="[{oxmultilang ident="PAGE_ACCOUNT_INC_ACCOUNT_MENU_BILLINGSHIPPINGSET"}]">[{oxmultilang ident="PAGE_ACCOUNT_INC_ACCOUNT_MENU_BILLINGSHIPPINGSET"}]</a>
            </li>
            <li [{if $active_link == "orderhistory"}]class="active"[{/if}]>
                <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_order"}]" title="[{oxmultilang ident="PAGE_ACCOUNT_INC_ACCOUNT_MENU_ORDERHISTORY"}]">[{oxmultilang ident="PAGE_ACCOUNT_INC_ACCOUNT_MENU_ORDERHISTORY"}]</a>
            </li>
            [{if $oViewConf->getShowCompareList()}]
                <li [{if $active_link == "compare"}]class="active"[{/if}]>
                    <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=compare"}]" title="[{oxmultilang ident="PAGE_ACCOUNT_INC_ACCOUNT_MENU_COMPARE"}]">[{oxmultilang ident="PAGE_ACCOUNT_INC_ACCOUNT_MENU_COMPARE"}]</a>
                </li>
            [{/if}]
            <li [{if $active_link == "noticelist"}]class="active"[{/if}]>
                <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_noticelist"}]" title="[{oxmultilang ident="PAGE_ACCOUNT_INC_ACCOUNT_MENU_NOTICELIST"}]">[{oxmultilang ident="PAGE_ACCOUNT_INC_ACCOUNT_MENU_NOTICELIST"}]</a>
            </li>
            [{if $oViewConf->getShowWishlist()}]
                <li [{if $active_link == "wishlist"}]class="active"[{/if}]>
                    <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_wishlist"}]" title="[{oxmultilang ident="PAGE_ACCOUNT_INC_ACCOUNT_MENU_WISHLIST"}]">[{oxmultilang ident="PAGE_ACCOUNT_INC_ACCOUNT_MENU_WISHLIST"}]</a>
                </li>
            [{/if}]
            [{if $oViewConf->getShowListmania()}]
                <li [{if $active_link == "recommendationlist"}]class="active"[{/if}]>
                    <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_recommlist"}]" title="[{oxmultilang ident="PAGE_ACCOUNT_INC_ACCOUNT_MENU_RECOMMENDLIST"}]">[{oxmultilang ident="PAGE_ACCOUNT_INC_ACCOUNT_MENU_RECOMMENDLIST"}]</a>
                </li>
            [{/if}]
            [{if $oView->isEnabledDownloadableFiles()}]
                <li [{if $active_link == "downloads"}]class="active"[{/if}]>
                    <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_downloads"}]" title="[{oxmultilang ident="MY_DOWNLOADS"}]">[{oxmultilang ident="MY_DOWNLOADS"}]</a>
                </li>
            [{/if}]
        [{/block}]
    </ul>
</nav>