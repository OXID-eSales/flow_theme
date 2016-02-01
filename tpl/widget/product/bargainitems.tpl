[{assign var="currency" value=$oView->getActCurrency()}]
<div class="bargainitems list-container">
    <h2 class="page-header">
        [{oxmultilang ident="WEEK_SPECIAL"}]

        [{assign var='rsslinks' value=$oView->getRssLinks()}]
        [{if $rsslinks.bargainArticles}]
            <small>
                <a class="rss js-external" id="rssBargainProducts" href="[{$rsslinks.bargainArticles.link}]" title="[{$rsslinks.bargainArticles.title}]"><img src="[{$oViewConf->getImageUrl('rss.png')}]" alt="[{$rsslinks.bargainArticles.title}]"><span class="FXgradOrange corners glowShadow">[{$rsslinks.bargainArticles.title}]</span></a>
            </small>
        [{/if}]
    </h2>

    <div class="row">
        [{assign var="iBargainArticlesCount" value=$oView->getBargainArticleList()|@count}]
        [{if $iBargainArticlesCount > 4}]
            [{assign var="iBargainArticlesCount" value=4}]
        [{/if}]
        [{math equation="x / y" x=12 y=$iBargainArticlesCount assign="iColIdent"}]
        [{foreach from=$oView->getBargainArticleList() item=_product name=bargainList}]
            [{assign var="sBargainArtTitle" value="`$_product->oxarticles__oxtitle->value` `$_product->oxarticles__oxvarselect->value`"}]

            [{assign var="aVariantSelections" value=$_product->getVariantSelections(null,null,1)}]
            [{assign var="blShowToBasket" value=true}] [{* tobasket or more info ? *}]
            [{if $blDisableToCart || $_product->isNotBuyable() || ($aVariantSelections&&$aVariantSelections.selections)||$_product->hasMdVariants() || ($oViewConf->showSelectListsInList() && $_product->getSelections(1)) || $_product->getVariants()}]
                [{assign var="blShowToBasket" value=false}]
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
                            <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
                            <input type="hidden" name="fnc" value="tobasket">
                            <input type="hidden" name="aid" value="[{$_product->oxarticles__oxid->value}]">
                            <input type="hidden" name="anid" value="[{$_product->oxarticles__oxnid->value}]">
                            <input type="hidden" name="am" value="1">
                        [{/oxhasrights}]
                    [{else}]
                        <input type="hidden" name="cl" value="details">
                        <input type="hidden" name="anid" value="[{$_product->oxarticles__oxnid->value}]">
                    [{/if}]
                </div>

                <div class="col-xs-12 col-sm-6 col-md-[{$iColIdent}] productBox">
                    <div class="picture text-center">
                        <a href="[{$_product->getMainLink()}]" title="[{$sBargainArtTitle|strip_tags}]" class="img-thumbnail">
                            <img src="[{$_product->getThumbnailUrl()}]" alt="[{$sBargainArtTitle|strip_tags}]" class="img-responsive">
                        </a>
                    </div>
                    <div class="title">
                        <a id="titleBargain_[{$smarty.foreach.bargainList.iteration}]" href="[{$_product->getMainLink()}]" title="[{$sBargainArtTitle|strip_tags}]">[{$sBargainArtTitle|strip_tags}]</a>
                    </div>
                    <div class="price text-center">
                        [{block name="widget_product_bargainitem_price"}]
                            [{oxhasrights ident="SHOWARTICLEPRICE"}]
                            [{assign var="oUnitPrice" value=$_product->getUnitPrice()}]
                            [{assign var="tprice"     value=$_product->getTPrice()}]
                            [{assign var="price"      value=$_product->getPrice()}]
                            [{if $tprice && $tprice->getPrice() > $price->getPrice()}]
                                <span>[{oxmultilang ident="REDUCED_FROM"}] <del>[{$_product->getFTPrice()}] [{$currency->sign}]</del></span>
                            [{/if}]
                            [{if $_product->getFPrice()}]
                                [{assign var="currency" value=$oView->getActCurrency()}]
                                <span class="lead[{if $tprice && $tprice->getPrice() > $price->getPrice()}] text-danger[{/if}]">[{$_product->getFPrice()}] [{$currency->sign}]
                                    [{if $oView->isVatIncluded()}]
                                        [{if !( $_product->hasMdVariants() || ($oViewConf->showSelectListsInList()&&$_product->getSelections(1)) || $_product->getVariants() )}]*[{/if}]
                                    [{/if}]
                                </span>
                            [{/if}]
                            [{if $oUnitPrice}]
                                <span class="pricePerUnit">
                                    [{$_product->oxarticles__oxunitquantity->value}] [{$_product->getUnitName()}] | [{oxprice price=$oUnitPrice currency=$currency}]/[{$_product->getUnitName()}]
                                </span>
                            [{/if}]
                            [{/oxhasrights}]
                        [{/block}]
                    </div>
                    <div class="actions text-center">
                        [{block name="widget_product_bargainitem_tobasket"}]
                            <div class="btn-group">
                                [{if !( $_product->hasMdVariants() || ($oViewConf->showSelectListsInList() && $_product->getSelections(1)) || $_product->getVariants() )}]
                                    [{oxhasrights ident="TOBASKET"}]
                                        <button type="submit" class="btn btn-default hasTooltip" data-placement="bottom" title="[{oxmultilang ident="TO_CART"}]">
                                            <i class="fa fa-shopping-cart"></i>
                                        </button>
                                    [{/oxhasrights}]
                                [{/if}]

                                <a href="[{$_product->getMainLink()}]" class="btn btn-primary">[{oxmultilang ident="MORE_INFO"}]</a>
                            </div>
                        [{/block}]
                    </div>
                </div>
            </form>
        [{/foreach}]
    </div>
</div>