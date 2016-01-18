<div class="topPopList">
    [{block name="widget_header_servicebox_flyoutbox"}]
        <span class="lead">[{oxmultilang ident="WIDGET_SERVICES_ACCOUNT"}]</span>
        <div class="flyoutBox">
            <ul id="services" class="list-unstyled">
                [{block name="widget_header_servicebox_items"}]
                    <li>
                        <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account"}]">[{oxmultilang ident="LAYOUT_HEADER_ACCOUNT_LINK"}]</a>
                    </li>
                    [{if $oViewConf->getShowCompareList()}]
                        <li>
                            <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=compare"}]">[{oxmultilang ident="LAYOUT_HEADER_COMPARE_LINK"}]</a> [{if $oView->getCompareItemsCnt()}]<span class="badge">[{$oView->getCompareItemsCnt()}]</span>[{/if}]
                        </li>
                    [{/if}]
                    <li>
                        <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_noticelist"}]"><span>[{oxmultilang ident="LAYOUT_HEADER_NOTICELIST_LINK"}]</span></a>
                        [{if $oxcmp_user && $oxcmp_user->getNoticeListArtCnt()}] <span class="badge">[{$oxcmp_user->getNoticeListArtCnt()}]</span>[{/if}]
                    </li>
                    [{if $oViewConf->getShowWishlist()}]
                        <li>
                            <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_wishlist"}]"><span>[{oxmultilang ident="LAYOUT_HEADER_WISHLIST_LINK"}]</span></a>
                            [{if $oxcmp_user && $oxcmp_user->getWishListArtCnt()}] <span class="badge">[{$oxcmp_user->getWishListArtCnt()}]</span>[{/if}]
                        </li>
                    [{/if}]
                    [{if $oViewConf->getShowListmania()}]
                        <li>
                            <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_recommlist"}]"><span>[{oxmultilang ident="LAYOUT_HEADER_LISTMANIA_LINK"}]</span></a>
                            [{if $oxcmp_user && $oxcmp_user->getRecommListsCount()}] <span class="badge">[{$oxcmp_user->getRecommListsCount()}]</span>[{/if}]
                        </li>
                    [{/if}]
                    [{if $oViewConf->isFunctionalityEnabled( "blEnableDownloads" )}]
                        <li>
                            <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_downloads"}]"><span>[{oxmultilang ident="MY_DOWNLOADS"}]</span></a>
                        </li>
                    [{/if}]
                [{/block}]
            </ul>
        </div>
    [{/block}]
</div>