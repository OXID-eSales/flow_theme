[{block name="widget_product_listitem_grid"}]
    [{assign var="product"         value=$oView->getProduct()}]
    [{assign var="blDisableToCart" value=$oView->getDisableToCart()}]
    [{assign var="iIndex"          value=$oView->getIndex()}]
    [{assign var="showMainLink"    value=$oView->getShowMainLink()}]

    [{assign var="currency" value=$oView->getActCurrency()}]
    [{if $showMainLink}]
        [{assign var='_productLink' value=$product->getMainLink()}]
    [{else}]
        [{assign var='_productLink' value=$product->getLink()}]
    [{/if}]
    [{assign var="aVariantSelections" value=$product->getVariantSelections(null,null,1)}]
    [{assign var="blShowToBasket" value=true}] [{* tobasket or more info ? *}]
    [{if $blDisableToCart || $product->isNotBuyable() || ($aVariantSelections&&$aVariantSelections.selections) || $product->hasMdVariants() || ($oViewConf->showSelectListsInList() && $product->getSelections(1)) || $product->getVariants()}]
        [{assign var="blShowToBasket" value=false}]
    [{/if}]

    [{if !$testid }]
        [{assign var=testid value=$oView->getViewParameter('testid')}]
    [{/if}]
    [{if !$listId }]
        [{assign var=listId value=$oView->getViewParameter('listId')}]
    [{/if}]

    <form name="tobasket[{$testid}]" [{if $blShowToBasket}]action="[{$oViewConf->getSelfActionLink()}]" method="post"[{else}]action="[{$_productLink}]" method="get"[{/if}]>
        <div class="hidden">
            [{$oViewConf->getNavFormParams()}]
            [{$oViewConf->getHiddenSid()}]
            <input type="hidden" name="pgNr" value="[{$oView->getActPage()}]">
            [{if $recommid}]
                <input type="hidden" name="recommid" value="[{$recommid}]">
            [{/if}]
            [{if $blShowToBasket}]
            [{oxhasrights ident="TOBASKET"}]
                <input type="hidden" name="cl" value="[{$oViewConf->getTopActiveClassName()}]">
                [{if $owishid}]
                    <input type="hidden" name="owishid" value="[{$owishid}]">
                [{/if}]
                [{if $toBasketFunction}]
                    <input type="hidden" name="fnc" value="[{$toBasketFunction}]">
                [{else}]
                    <input type="hidden" name="fnc" value="tobasket">
                [{/if}]
                <input type="hidden" name="aid" value="[{$product->oxarticles__oxid->value}]">
                [{if $altproduct}]
                    <input type="hidden" name="anid" value="[{$altproduct}]">
                [{else}]
                    <input type="hidden" name="anid" value="[{$product->oxarticles__oxnid->value}]">
                [{/if}]
                <input type="hidden" name="am" value="1">
            [{/oxhasrights}]
            [{else}]
                <input type="hidden" name="cl" value="details">
                <input type="hidden" name="anid" value="[{$product->oxarticles__oxnid->value}]">
            [{/if}]
        </div>

        [{block name="widget_product_listitem_infogrid_gridpicture"}]
        <div class="picture text-center">
            <a href="[{$_productLink}]" title="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">
                <img src="[{$oViewConf->getImageUrl('spinner.gif')}]" data-src="[{$product->getThumbnailUrl()}]" alt="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]" class="img-responsive">
            </a>
        </div>
        [{/block}]

        <div class="listDetails text-center">
            [{block name="widget_product_listitem_infogrid_titlebox"}]
                <div class="title">
                    <a id="[{$testid}]" href="[{$_productLink}]" class="title" title="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">
                        <span>[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]</span>
                    </a>
                </div>
            [{/block}]

            <div class="price text-center">
                <div class="content">
                    [{block name="widget_product_listitem_grid_price"}]
                        [{oxhasrights ident="SHOWARTICLEPRICE"}]
                            [{assign var="oUnitPrice" value=$product->getUnitPrice()}]
                            [{assign var="tprice"     value=$product->getTPrice()}]
                            [{assign var="price"      value=$product->getPrice()}]

                            [{if $tprice && $tprice->getBruttoPrice() > $price->getBruttoPrice()}]
                                <span class="oldPrice text-muted">
                                    <del>[{$product->getFTPrice()}] [{$currency->sign}]</del>
                                </span>
                            [{/if}]

                            [{block name="widget_product_listitem_grid_price_value"}]
                                [{if $product->getFPrice()}]
                                    <span class="lead text-nowrap">
                                        [{if $product->isRangePrice()}]
                                            [{oxmultilang ident="PRICE_FROM"}]
                                            [{if !$product->isParentNotBuyable()}]
                                                [{$product->getFMinPrice()}]
                                            [{else}]
                                                [{$product->getFVarMinPrice()}]
                                            [{/if}]
                                        [{else}]
                                            [{if !$product->isParentNotBuyable()}]
                                                [{$product->getFPrice()}]
                                            [{else}]
                                                [{$product->getFVarMinPrice()}]
                                            [{/if}]
                                        [{/if}]
                                        [{$currency->sign}]
                                        [{if $oView->isVatIncluded()}]
                                             [{if !($product->hasMdVariants() || ($oViewConf->showSelectListsInList() && $product->getSelections(1)) || $product->getVariants())}]*[{/if}]
                                        [{/if}]
                                    </span>
                                [{/if}]
                            [{/block}]
                            [{if $oUnitPrice}]
                                <span id="productPricePerUnit_[{$testid}]" class="pricePerUnit">
                                    [{$product->oxarticles__oxunitquantity->value}] [{$product->getUnitName()}] | [{oxprice price=$oUnitPrice currency=$currency}]/[{$product->getUnitName()}]
                                </span>
                            [{elseif $product->oxarticles__oxweight->value }]
                                <span id="productPricePerUnit_[{$testid}]" class="pricePerUnit">
                                    <span title="weight">[{oxmultilang ident="WEIGHT"}]</span>
                                    <span class="value">[{$product->oxarticles__oxweight->value}] [{oxmultilang ident="KG"}]</span>
                                </span>
                            [{/if}]
                        [{/oxhasrights}]
                    [{/block}]
                </div>
            </div>
            [{block name="widget_product_listitem_grid_tobasket"}]
                <div class="actions text-center">
                    <div class="btn-group">
                        [{if $blShowToBasket}]
                            [{oxhasrights ident="TOBASKET"}]
                                <button type="submit" class="btn btn-default hasTooltip" data-placement="bottom" title="[{oxmultilang ident="TO_CART"}]" data-container="body">
                                    <i class="fa fa-shopping-cart"></i>
                                </button>
                            [{/oxhasrights}]
                            <a class="btn btn-primary" href="[{$_productLink}]" >[{oxmultilang ident="MORE_INFO"}]</a>
                        [{else}]
                            <a class="btn btn-primary" href="[{$_productLink}]" >[{oxmultilang ident="MORE_INFO"}]</a>
                        [{/if}]
                    </div>
                </div>
            [{/block}]
        </div>
    </form>
[{/block}]
