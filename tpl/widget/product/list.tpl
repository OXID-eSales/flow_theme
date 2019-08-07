[{if !$type}]
    [{assign var="type" value="infogrid"}]
[{/if}]

[{if !$iProductsPerLine}]
    [{assign var="iProductsPerLine" value=4}]
[{/if}]

[{if $type == 'infogrid'}]
    [{assign var="iProductsPerLine" value=2}]
[{elseif $type == 'grid'}]
    [{assign var="iProductsPerLine" value=4}]
[{elseif $type == 'line'}]
    [{assign var="iProductsPerLine" value=1}]
[{/if}]

[{if !$testid }]
    [{assign var=testid value=$oView->getViewParameter('testid')}]
[{/if}]
[{if !$listId }]
    [{assign var=listId value=$oView->getViewParameter('listId')}]
[{/if}]

<div class="boxwrapper" id="boxwrapper_[{$listId}]">
    [{if $head}]
        [{if $header == "light"}]
            <div class="page-header">
                <span class="h3">[{$head}]</span>

                [{if $subhead}]
                    <small class="subhead">[{$subhead}]</small>
                [{/if}]
            </div>
        [{else}]
            <div class="page-header">
                <h2>
                    [{$head}]
                    [{if $rsslink}]
                        <a class="rss" id="[{$rssId}]" href="[{$rsslink.link}]" target="_blank">
                            <i class="fa fa-rss"></i>
                        </a>
                    [{/if}]
                </h2>

                [{if $subhead}]
                    <small class="subhead">[{$subhead}]</small>
                [{/if}]
            </div>
        [{/if}]
    [{/if}]

    [{if $products && !empty($products)}]
        [{assign var="productsCount" value=$products|@count}]
        [{math equation="x / y" x=12 y=$iProductsPerLine assign="iColIdent"}]

        <div class="list-container" id="[{$listId}]">
            [{foreach from=$products item="_product" name="productlist"}]
                [{counter print=false assign="productlistCounter"}]
                [{assign var="testid" value=$listId|cat:"_"|cat:$smarty.foreach.productlist.iteration}]

                [{if $productlistCounter == 1}]
                    <div class="row [{$type}]View newItems">
                [{/if}]

                <div class="productData col-xs-12[{if $type != 'line'}] col-sm-6 col-md-[{$iColIdent}][{/if}] productBox">
                    [{oxid_include_widget cl="oxwArticleBox" _parent=$oView->getClassName() nocookie=1 _navurlparams=$oViewConf->getNavUrlParams() iLinkType=$_product->getLinkType() _object=$_product anid=$_product->getId() sWidgetType=product sListType=listitem_$type iIndex=$testid blDisableToCart=$blDisableToCart isVatIncluded=$oView->isVatIncluded() showMainLink=$showMainLink recommid=$recommid owishid=$owishid toBasketFunction=$toBasketFunction removeFunction=$removeFunction altproduct=$altproduct inlist=$_product->isInList() skipESIforUser=1 testid=$testid}]
                </div>

                [{if $productlistCounter%$iProductsPerLine == 0 || $productsCount == $productlistCounter}]
                    </div>
                [{/if}]

                [{if $productlistCounter%$iProductsPerLine == 0 && $productsCount > $productlistCounter}]
                    <div class="row [{$type}]View newItems">
                [{/if}]
            [{/foreach}]

            [{* Counter resetten *}]
            [{counter print=false assign="productlistCounter" start=0}]
        </div>
    [{/if}]
</div>