[{capture append="oxidBlock_content"}]
    [{assign var="oConfig" value=$oViewConf->getConfig()}]
    [{assign var='rsslinks' value=$oView->getRssLinks()}]
    [{oxscript include="js/pages/start.min.js"}]

    [{oxifcontent ident="oxstartwelcome" object="oCont"}]
        <div class="welcome-teaser">[{$oCont->oxcontents__oxcontent->value}]</div>
    [{/oxifcontent}]

    [{if $oView->getBargainArticleList()|@count > 0}]
        [{assign var="oAction" value="oxactions"|oxNew}]
        [{assign var="blActionLoaded" value=$oAction->load('oxbargain')}]

        [{if $blActionLoaded}]
            [{include file="widget/product/list.tpl" type=$oViewConf->getViewThemeParam('sStartPageListDisplayType') head=$oAction->oxactions__oxtitle->value subhead="START_BARGAIN_SUBHEADER"|oxmultilangassign listId="bargainItems" products=$oView->getBargainArticleList() rsslink=$rsslinks.bargainArticles rssId="rssBargainProducts" showMainLink=true iProductsPerLine=4}]
        [{/if}]
    [{/if}]

    [{if $oViewConf->getViewThemeParam('bl_showManufacturerSlider')}]
        [{include file="widget/manufacturersslider.tpl"}]
    [{/if}]

    [{if $oView->getNewestArticles()}]
        [{assign var="oAction" value="oxactions"|oxNew}]
        [{assign var="blActionLoaded" value=$oAction->load('oxnewest')}]

        [{if $blActionLoaded}]
            [{include file="widget/product/list.tpl" type=$oViewConf->getViewThemeParam('sStartPageListDisplayType') head=$oAction->oxactions__oxtitle->value subhead="START_NEWEST_SUBHEADER"|oxmultilangassign listId="newItems" products=$oView->getNewestArticles() rsslink=$rsslinks.newestArticles rssId="rssNewestProducts" showMainLink=true iProductsPerLine=4}]
        [{/if}]
    [{/if}]

    [{if $oView->getNewestArticles() && $oView->getTop5ArticleList()}]
        <div class="row">
            <hr>
        </div>
    [{/if}]

    [{if $oView->getTop5ArticleList()}]
        [{assign var="oAction" value="oxactions"|oxNew}]
        [{assign var="blActionLoaded" value=$oAction->load('oxtop5')}]

        [{if $blActionLoaded}]
            [{include file="widget/product/list.tpl" type="infogrid" head=$oAction->oxactions__oxtitle->value subhead="START_TOP_PRODUCTS_SUBHEADER"|oxmultilangassign listId="topBox" products=$oView->getTop5ArticleList() rsslink=$rsslinks.topArticles rssId="rssTopProducts" showMainLink=true iProductsPerLine=2}]
        [{/if}]
    [{/if}]


    [{insert name="oxid_tracker"}]
[{/capture}]
[{include file="layout/page.tpl"}]