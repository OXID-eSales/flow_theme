[{if !$blWorkaroundInclude}]
    [{capture append="oxidBlock_content"}]
        [{if $oxcmp_user}]
            [{assign var="force_sid" value=$oView->getSidForWidget()}]
        [{/if}]
        [{oxid_include_widget cl="oxwArticleDetails" _parent=$oView->getClassName() nocookie=1 force_sid=$force_sid _navurlparams=$oViewConf->getNavUrlParams() _object=$oView->getProduct() anid=$oViewConf->getActArticleId() iPriceAlarmStatus=$oView->getPriceAlarmStatus() sorting=$oView->getSortingParameters() skipESIforUser=1}]
    [{/capture}]
    [{include file="layout/page.tpl"}]
[{else}]
    [{assign var="oDetailsProduct" value=$oView->getProduct()}]
    [{assign var="oPictureProduct" value=$oView->getPicturesProduct()}]
    [{assign var="currency" value=$oView->getActCurrency()}]
    [{assign var="sPageHeadTitle" value=$oDetailsProduct->oxarticles__oxtitle->value|cat:' '|cat:$oDetailsProduct->oxarticles__oxvarselect->value}]
    [{assign var="blFullwidth" value=$oViewConf->getViewThemeParam('blFullwidthLayout')}]

    [{if $oView->getPriceAlarmStatus() == 1}]
        [{assign var="_statusMessage1" value="PAGE_DETAILS_THANKYOUMESSAGE1"|oxmultilangassign|cat:" "|cat:$oxcmp_shop->oxshops__oxname->value}]
        [{assign var="_statusMessage2" value="PAGE_DETAILS_THANKYOUMESSAGE2"|oxmultilangassign|cat:" "}]
        [{assign var="_statusMessage3" value="PAGE_DETAILS_THANKYOUMESSAGE3"|oxmultilangassign|cat:" "|cat:$oView->getBidPrice()|cat:" "|cat:$currency->sign|cat:" "}]
        [{assign var="_statusMessage4" value="PAGE_DETAILS_THANKYOUMESSAGE4"|oxmultilangassign}]
        [{include file="message/success.tpl" statusMessage=`$_statusMessage1``$_statusMessage2``$_statusMessage3``$_statusMessage4`}]
    [{elseif $oView->getPriceAlarmStatus() == 2}]
        [{assign var="_statusMessage" value="MESSAGE_WRONG_VERIFICATION_CODE"|oxmultilangassign}]
        [{include file="message/error.tpl" statusMessage=$_statusMessage}]
    [{elseif $oView->getPriceAlarmStatus() === 0}]
        [{assign var="_statusMessage1" value="MESSAGE_NOT_ABLE_TO_SEND_EMAIL"|oxmultilangassign|cat:"<br> "}]
        [{assign var="_statusMessage2" value="MESSAGE_VERIFY_YOUR_EMAIL"|oxmultilangassign}]
        [{include file="message/error.tpl" statusMessage=`$_statusMessage1``$_statusMessage2`}]
    [{/if}]

    <div id="details_container">
        <div id="details">
            [{if $oView->getSearchTitle()}]
                [{assign var="detailsLocation" value=$oView->getSearchTitle()}]
            [{else}]
                [{foreach from=$oView->getCatTreePath() item=oCatPath name="detailslocation"}]
                    [{if $smarty.foreach.detailslocation.last}]
                        [{assign var="detailsLocation" value=$oCatPath->oxcategories__oxtitle->value}]
                    [{/if}]
                [{/foreach}]
            [{/if}]

            [{* details locator *}]
            [{assign var="actCategory" value=$oView->getActiveCategory()}]
            <div class="detailsParams listRefine bottomRound">
                <div class="row refineParams clear" id="detailsItemsPager">
                    <div class="col-xs-3 text-left pager-overview-link">
                        <i class="fa fa-bars"></i> <a href="[{$actCategory->toListLink}]">[{oxmultilang ident="BACK_TO_OVERVIEW"}]</a>
                    </div>
                    <div class="col-xs-3 text-left pager-prev">
                        [{if $actCategory->prevProductLink}]
                            <i class="fa fa-angle-left"></i> <a id="linkPrevArticle" class="" href="[{$actCategory->prevProductLink}]">[{oxmultilang ident="PREVIOUS_PRODUCT"}]</a>
                        [{/if}]
                    </div>
                    <div class="col-xs-3 text-center pager-current-page">
                        [{if $actCategory->iProductPos}]
                            [{oxmultilang ident="PRODUCT"}] [{$actCategory->iProductPos}] [{oxmultilang ident="OF"}] [{$actCategory->iCntOfProd}]
                        [{/if}]
                    </div>
                    <div class="col-xs-3 text-right pager-next">
                        [{if $actCategory->nextProductLink}]
                            <a id="linkNextArticle" href="[{$actCategory->nextProductLink}]">[{oxmultilang ident="NEXT_PRODUCT"}]</a> <i class="fa fa-angle-right"></i>
                        [{/if}]
                    </div>
                </div>
                [{if $blFullwidth}]
                    <hr>
                [{/if}]
            </div>

            [{* RDFa offering*}]
            <div id="productinfo">
                [{include file="page/details/inc/fullproductinfo.tpl"}]
            </div>
        </div>
    </div>
[{/if}]
