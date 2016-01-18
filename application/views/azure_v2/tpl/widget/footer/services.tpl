[{block name="footer_services"}]
    <ul class="services list-unstyled">
        <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=contact"}]">[{oxmultilang ident="CONTACT"}]</a></li>
        [{if $oViewConf->getViewThemeParam('blFooterShowHelp')}]
            <li><a href="[{$oViewConf->getHelpPageLink()}]">[{oxmultilang ident="WIDGET_SERVICES_HELP"}]</a></li>
        [{/if}]
        [{if $oViewConf->getViewThemeParam('blFooterShowLinks')}]
            <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=links"}]">[{oxmultilang ident="WIDGET_SERVICES_LINKS"}]</a></li>
        [{/if}]
        [{if $oViewConf->getViewThemeParam('blFooterShowGuestbook')}]
            <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=guestbook"}]">[{oxmultilang ident="WIDGET_SERVICES_GUESTBOOK"}]</a></li>
        [{/if}]
        [{if $oView->isActive('Invitations')}]
            <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=invite"}]">[{oxmultilang ident="WIDGET_SERVICES_INVITEFRIENDS"}]</a></li>
        [{/if}]
        [{oxhasrights ident="TOBASKET"}]
            <li>
                <a href="[{oxgetseourl ident=$oViewConf->getBasketLink()}]">
                    [{oxmultilang ident="WIDGET_SERVICES_BASKET"}]
                </a>
                [{if $oxcmp_basket->getItemsCount() > 0}] <span class="badge">[{$oxcmp_basket->getItemsCount()}]</span>[{/if}]
            </li>
        [{/oxhasrights}]
        <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account"}]">[{oxmultilang ident="WIDGET_SERVICES_ACCOUNT"}]</a></li>
        <li>
            <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_noticelist"}]">
                [{oxmultilang ident="WIDGET_SERVICES_NOTICELIST"}]
            </a>
            [{if $oxcmp_user && $oxcmp_user->getNoticeListArtCnt()}] <span class="badge">[{$oxcmp_user->getNoticeListArtCnt()}]</span>[{/if}]
        </li>
        [{if $oViewConf->getShowWishlist()}]
            <li>
                <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_wishlist"}]">
                    [{oxmultilang ident="WIDGET_SERVICES_MYWISHLIST"}]
                </a>
                [{if $oxcmp_user && $oxcmp_user->getWishListArtCnt()}] <span class="badge">[{$oxcmp_user->getWishListArtCnt()}]</span>[{/if}]
            </li>
            <li>
                <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=wishlist" params="wishid="|cat:$oView->getWishlistUserId()}]">
                    [{oxmultilang ident="WIDGET_SERVICES_PUBLICWISHLIST"}]
                </a>
            </li>
        [{/if}]
        [{if $oView->isEnabledDownloadableFiles()}]
            <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_downloads"}]">[{oxmultilang ident="MY_DOWNLOADS"}]</a></li>
        [{/if}]
    </ul>
[{/block}]