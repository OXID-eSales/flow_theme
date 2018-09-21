[{assign var="blFullwidth" value=$oViewConf->getViewThemeParam('blFullwidthLayout')}]

<div id="detailsMain">
    [{include file="page/details/inc/productmain.tpl"}]
</div>

<div id="detailsRelated" class="detailsRelated clear">
    <div class="relatedInfo[{if !$oView->getSimilarProducts() && !$oView->getCrossSelling() && !$oView->getAccessoires()}] relatedInfoFull[{/if}]">
        <div class="row">
            <div class="col-xs-12">
                [{include file="page/details/inc/tabs.tpl"}]

                [{if $oView->isReviewActive()}]
                    <div class="spacer"></div>
                    <div class="widgetBox reviews">
                        <div class="h2 page-header">[{oxmultilang ident="WRITE_PRODUCT_REVIEW"}]</div>
                        [{include file="widget/reviews/reviews.tpl"}]
                    </div>
                [{/if}]
            </div>
        </div>
    </div>

    <div class="row">
        [{if $blFullwidth}]
            <div class="col-xs-12"><hr></div>
        [{else}]
            <hr>
        [{/if}]
</div>

[{include file="page/details/inc/related_products.tpl"}]
</div>
