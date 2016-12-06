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
                        [{assign var="product" value=$oView->getProduct()}]
                        [{if $oxcmp_user}]
                            [{assign var="force_sid" value=$oView->getSidForWidget()}]
                        [{/if}]
                        [{oxid_include_widget cl="oxwReview" nocookie=1 force_sid=$force_sid _parent=$oViewConf->getTopActiveClassName() type=oxarticle anid=$product->oxarticles__oxnid->value aid=$product->oxarticles__oxid->value canrate=$oView->canRate() skipESIforUser=1}]
                    </div>
                [{/if}]
            </div>
        </div>
    </div>

    <div class="row">
        <hr>
    </div>

    [{include file="page/details/inc/related_products.tpl"}]
</div>
