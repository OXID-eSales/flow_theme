[{assign var="template_title" value="MY_ACCOUNT"|oxmultilangassign}]
[{capture append="oxidBlock_content"}]
    <div class="accountDashboardView">
        <h1 id="accountMain" class="page-header">[{oxmultilang ident="MY_ACCOUNT"}]
            "[{$oxcmp_user->oxuser__oxusername->value}]"</h1>

        [{if $oView->getAccountDeletionStatus() === false}]
            [{assign var="statusMessage" value="DD_DELETE_MY_ACCOUNT_ERROR"|oxmultilangassign}]
            [{include file="message/error.tpl" statusMessage=$statusMessage}]
        [{/if}]

        <div class="row">
            <div class="col-xs-12 col-md-6">
                [{block name="account_dashboard_col1"}]
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a id="linkAccountPassword" href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_password"}]">[{oxmultilang ident="CHANGE_PASSWORD"}]</a>
                            <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_password"}]" class="btn btn-default btn-xs pull-right">
                                <i class="fa fa-arrow-right"></i>
                            </a>
                        </div>
                        <div class="panel-body">[{oxmultilang ident="CHANGE_PASSWORD"}]</div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a id="linkAccountNewsletter" href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_newsletter"}]">[{oxmultilang ident="NEWSLETTER_SETTINGS"}]</a>
                            <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_newsletter"}]" class="btn btn-default btn-xs pull-right">
                                <i class="fa fa-arrow-right"></i>
                            </a>
                        </div>
                        <div class="panel-body">[{oxmultilang ident="NEWSLETTER_SUBSCRIBE_CANCEL"}]</div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a id="linkAccountBillship" href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_user"}]">[{oxmultilang ident="BILLING_SHIPPING_SETTINGS"}]</a>
                            <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_user"}]" class="btn btn-default btn-xs pull-right">
                                <i class="fa fa-arrow-right"></i>
                            </a>
                        </div>
                        <div class="panel-body">[{oxmultilang ident="UPDATE_YOUR_BILLING_SHIPPING_SETTINGS"}]</div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a id="linkAccountOrder" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_order"}]">[{oxmultilang ident="ORDER_HISTORY"}]</a>
                            <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_order"}]" class="btn btn-default btn-xs pull-right">
                                <i class="fa fa-arrow-right"></i>
                            </a>
                        </div>
                        <div class="panel-body">[{oxmultilang ident="ORDERS"}] [{$oView->getOrderCnt()}]</div>
                    </div>
                    [{if $oView->isEnabledDownloadableFiles()}]
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <a id="linkAccountDownloads" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_downloads"}]">[{oxmultilang ident="MY_DOWNLOADS"}]</a>
                                <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_downloads"}]" class="btn btn-default btn-xs pull-right">
                                    <i class="fa fa-arrow-right"></i>
                                </a>
                            </div>
                            <div class="panel-body">[{oxmultilang ident="MY_DOWNLOADS_DESC"}]</div>
                        </div>
                    [{/if}]
                [{/block}]
            </div>
            <div class="col-xs-12 col-md-6">
                [{block name="account_dashboard_col2"}]
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_noticelist"}]">[{oxmultilang ident="MY_WISH_LIST"}]</a>
                            <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_noticelist"}]" class="btn btn-default btn-xs pull-right">
                                <i class="fa fa-arrow-right"></i>
                            </a>
                        </div>
                        <div class="panel-body">[{oxmultilang ident="PRODUCT"}] [{if $oxcmp_user}][{$oxcmp_user->getNoticeListArtCnt()}][{else}]0[{/if}]</div>
                    </div>
                    [{if $oViewConf->getShowWishlist()}]
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_wishlist"}]">[{oxmultilang ident="MY_GIFT_REGISTRY"}]</a>
                                <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_wishlist"}]" class="btn btn-default btn-xs pull-right">
                                    <i class="fa fa-arrow-right"></i>
                                </a>
                            </div>
                            <div class="panel-body">[{oxmultilang ident="PRODUCT"}] [{if $oxcmp_user}][{$oxcmp_user->getWishListArtCnt()}][{else}]0[{/if}]</div>
                        </div>
                    [{/if}]
                    [{if $oViewConf->getShowCompareList()}]
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=compare"}]">[{oxmultilang ident="MY_PRODUCT_COMPARISON"}]</a>
                                <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=compare"}]" class="btn btn-default btn-xs pull-right">
                                    <i class="fa fa-arrow-right"></i>
                                </a>
                            </div>
                            <div class="panel-body">[{oxmultilang ident="PRODUCT"}] [{if $oView->getCompareItemsCnt()}][{$oView->getCompareItemsCnt()}][{else}]0[{/if}]</div>
                        </div>
                    [{/if}]
                    [{if $oViewConf->getShowListmania()}]
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_recommlist"}]">[{oxmultilang ident="MY_LISTMANIA"}]</a>
                                <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_recommlist"}]" class="btn btn-default btn-xs pull-right">
                                    <i class="fa fa-arrow-right"></i>
                                </a>
                            </div>
                            <div class="panel-body">[{oxmultilang ident="LISTS"}] [{if $oxcmp_user->getRecommListsCount()}][{$oxcmp_user->getRecommListsCount()}][{else}]0[{/if}]</div>
                        </div>
                    [{/if}]
                    [{if $oView->isUserAllowedToManageOwnReviews()}]
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_reviewlist"}]">[{oxmultilang ident="MY_REVIEWS"}]</a>
                                <a href="[{oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_reviewlist"}]" class="btn btn-default btn-xs pull-right">
                                    <i class="fa fa-arrow-right"></i>
                                </a>
                            </div>
                            <div class="panel-body">[{oxmultilang ident="MY_REVIEWS"}] [{if $oView->getReviewAndRatingItemsCount()}][{$oView->getReviewAndRatingItemsCount()}][{else}]0[{/if}]</div>
                        </div>
                    [{/if}]
                [{/block}]
            </div>
        </div>
    </div>

    <div class="row">
        [{block name="account_dashboard_delete_my_account"}]
            <div class="col-xs-6">
                [{if $oView->isUserAllowedToDeleteOwnAccount()}]
                <button
                        class="btn btn-danger"
                        data-toggle="modal"
                        data-target="#delete_my_account_confirmation"
                >
                    <i class="fa fa-trash"></i>
                    [{oxmultilang ident="DD_DELETE_MY_ACCOUNT"}]
                </button>
                [{include file="page/account/delete_my_account_confirmation.tpl"}]
                [{/if}]
            </div>
        [{/block}]
        <div class="col-xs-6 text-right">
            <a href="[{$oViewConf->getLogoutLink()}]" class="btn btn-warning" role="getLogoutLink">
                <i class="fa fa-power-off"></i> [{oxmultilang ident="LOGOUT"}]
            </a>
        </div>
        <p>&nbsp;</p>
    </div>
    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]


[{capture append="oxidBlock_sidebar"}]
    [{include file="page/account/inc/account_menu.tpl"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]
