[{capture append="oxidBlock_content"}]
    [{oxscript include="js/pages/review.min.js" priority=10}]

    [{if $oView->getProduct()}]
        [{assign var="product" value=$oView->getProduct()}]
        [{assign var="_productLink" value=$product->getLink()}]

        <div class="list-container" id="[{$listId}]">
            <div class="row lineView newItems">
                [{block name="widget_product_listitem_line_picturebox"}]
                    <div class="productData col-xs-12 productBox">
                        [{oxid_include_widget cl="oxwArticleBox" _parent=$oView->getClassName() nocookie=1 iLinkType=$product->getLinkType() _object=$product anid=$product->getId() sWidgetType="product" sListType="listitem_line" iIndex="list_1" blDisableToCart=true isVatIncluded=$oView->isVatIncluded() showMainLink=true toBasketFunction=false removeFunction=false skipESIforUser=1}]
                    </div>
                [{/block}]
            </div>
        </div>
    [{/if}]

    [{if $oView->isReviewActive()}]
        <div class="widgetBox reviews">
            <h4>[{oxmultilang ident="WRITE_PRODUCT_REVIEW"}]</h4>
            [{include file="widget/reviews/reviews.tpl" sReviewUserHash=$oView->getReviewUserHash() oDetailsProduct=$oView->getProduct() oReviewUser=$oView->getReviewUser()}]
        </div>
    [{/if}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]

