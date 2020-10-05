[{block name="widget_product_listitem_line"}]
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
    [{if $blDisableToCart || $product->isNotBuyable()||($aVariantSelections&&$aVariantSelections.selections)||$product->getVariants()||($oViewConf->showSelectListsInList()&&$product->getSelections(1))}]
        [{assign var="blShowToBasket" value=false}]
    [{/if}]

    [{if !$testid }]
        [{assign var=testid value=$oView->getViewParameter('testid')}]
    [{/if}]
    [{if !$listId }]
         [{assign var=listId value=$oView->getViewParameter('listId')}]
    [{/if}]

    [{oxscript include="js/widgets/oxlistremovebutton.min.js" priority=10}]
    [{oxscript add="$('button.removeButton').oxListRemoveButton();"}]

    <form name="tobasket.[{$testid}]" [{if $blShowToBasket}]action="[{$oViewConf->getSelfActionLink()}]" method="post"[{else}]action="[{$_productLink}]" method="get"[{/if}]  class="js-oxProductForm">
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
                    <input id="am_[{$testid}]" type="hidden" name="am" value="1">
                [{/oxhasrights}]
            [{else}]
                <input type="hidden" name="cl" value="details">
                <input type="hidden" name="anid" value="[{$product->oxarticles__oxnid->value}]">
            [{/if}]
        </div>

        <div class="row listDetails">
            <div class="col-xs-12 col-sm-2">
                <div class="picture">
                    [{block name="widget_product_listitem_line_picturebox"}]
                        <a id="[{$testid}]" href="[{$_productLink}]" title="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">
                            <img src="[{$oViewConf->getImageUrl('spinner.gif')}]" data-src="[{$product->getThumbnailUrl()}]" alt="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]" class="img-responsive">
                        </a>
                    [{/block}]
                </div>
            </div>
            <div class="col-xs-6 col-sm-4">
                [{block name="widget_product_listitem_line_titlebox"}]
                    <div class="title">
                        <a id="[{$testid}]" href="[{$_productLink}]" title="[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]">[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]</a>
                    </div>
                [{/block}]

                [{block name="widget_product_listitem_line_description"}]
                    <div class="description">
                        [{if $recommid}]
                            <p>[{$product->text}]</p>
                        [{else}]
                            [{oxhasrights ident="SHOWSHORTDESCRIPTION"}]
                                [{$product->oxarticles__oxshortdesc->rawValue}]
                            [{/oxhasrights}]
                        [{/if}]
                    </div>
                [{/block}]
            </div>
            <div class="col-xs-3 hidden-xs">
                [{block name="widget_product_listitem_line_attributes"}]
                    <div class="attributes">
                        [{assign var="oAttributes" value=$product->getAttributes()}]
                        [{if $oAttributes|@count}]
                            <strong>[{oxmultilang ident="SPECIFICATION"}]</strong>
                            <ul class="list-unstyled attributes small">
                                [{foreach from=$oAttributes item="oAttr" name="attribute"}]
                                    <li>
                                        <strong>[{$oAttr->oxattribute__oxtitle->value}][{oxmultilang ident="COLON"}]</strong>
                                        <span>[{$oAttr->oxattribute__oxvalue->value}]</span>
                                    </li>
                                [{/foreach}]
                            </ul>
                        [{/if}]
                    </div>
                [{/block}]
            </div>
            <div class="col-xs-4 col-sm-3">
                <div class="functions text-right">
                    [{block name="widget_product_listitem_line_price"}]
                        [{oxhasrights ident="SHOWARTICLEPRICE"}]
                        [{assign var="oUnitPrice" value=$product->getUnitPrice()}]
                        [{assign var="tprice"     value=$product->getTPrice()}]
                        [{assign var="price"      value=$product->getPrice()}]

                        [{if $tprice && $tprice->getBruttoPrice() > $price->getBruttoPrice()}]
                            <span class="oldPrice text-muted">
                                <del>[{$product->getFTPrice()}] [{$currency->sign}]</del>
                            </span>
                            <br/>
                        [{/if}]

                        [{block name="widget_product_listitem_line_price_value"}]
                            <span id="productPrice_[{$testid}]" class="lead price text-nowrap">
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
                            </span><br/>
                        [{/block}]

                        [{if $oUnitPrice}]
                            <span id="productPricePerUnit_[{$testid}]" class="pricePerUnit text-nowrap">[{$product->oxarticles__oxunitquantity->value}] [{$product->getUnitName()}] | [{oxprice price=$oUnitPrice currency=$currency}]/[{$product->getUnitName()}]</span>
                        [{elseif $product->oxarticles__oxweight->value }]
                            <span id="productPricePerUnit_[{$testid}]" class="pricePerUnit text-nowrap">
                                <span title="weight">[{oxmultilang ident="WEIGHT"}]</span>
                                <span class="value">[{$product->oxarticles__oxweight->value}] [{oxmultilang ident="KG"}]</span>
                            </span>
                        [{/if}]
                        [{/oxhasrights}]
                    [{/block}]

                    [{if $product->loadAmountPriceInfo()}]
                        <div class="form-group">
                            [{include file="page/details/inc/priceinfo.tpl" oDetailsProduct=$product}]
                        </div>
                    [{/if}]

                    [{block name="widget_product_listitem_line_selections"}]
                        [{if $aVariantSelections && $aVariantSelections.selections }]
                            <div id="variantselector_[{$iIndex}]" class="selectorsBox js-fnSubmit clear">
                                [{foreach from=$aVariantSelections.selections item=oSelectionList key=iKey}]
                                    [{include file="widget/product/selectbox.tpl" oSelectionList=$oSelectionList sJsAction="js-fnSubmit" blHideLabel=true}]
                                [{/foreach}]
                            </div>
                        [{elseif $oViewConf->showSelectListsInList()}]
                            [{assign var="oSelections" value=$product->getSelections(1)}]
                            [{if $oSelections}]
                                <div id="selectlistsselector_[{$iIndex}]" class="selectorsBox js-fnSubmit clear">
                                    [{foreach from=$oSelections item=oList name=selections}]
                                        [{include file="widget/product/selectbox.tpl" oSelectionList=$oList sFieldName="sel" iKey=$smarty.foreach.selections.index blHideDefault=true sSelType="seldrop" sJsAction="js-fnSubmit" blHideLabel=true}]
                                    [{/foreach}]
                                </div>
                            [{/if}]
                        [{/if}]
                    [{/block}]

                    [{block name="widget_product_listitem_line_tobasket"}]
                        [{if $blShowToBasket}]
                            [{oxhasrights ident="TOBASKET"}]
                                <div class="form-group">
                                    <div class="input-group">
                                        <input id="amountToBasket_[{$testid}]" type="text" name="am" value="1" size="3" autocomplete="off" class="form-control amount">
                                        <span class="input-group-btn">
                                            <button id="toBasket_[{$testid}]" type="submit" class="btn btn-primary hasTooltip" title="[{oxmultilang ident="TO_CART"}]" data-container="body">
                                                <i class="fa fa-shopping-cart"></i>
                                            </button>
                                            [{if $removeFunction && (($owishid && ($owishid==$oxcmp_user->oxuser__oxid->value)) || (($wishid==$oxcmp_user->oxuser__oxid->value)) || $recommid)}]
                                                <button triggerForm="remove_[{$removeFunction}][{$testid}]" type="submit" class="btn btn-danger removeButton hasTooltip" title="[{oxmultilang ident="REMOVE"}]">
                                                    <i class="fa fa-times"></i>
                                                </button>
                                            [{/if}]
                                        </span>
                                    </div>
                                </div>
                            [{/oxhasrights}]
                        [{else}]
                            <a class="btn btn-primary" href="[{$_productLink}]" >[{oxmultilang ident="MORE_INFO"}]</a>

                            [{if $removeFunction && (($owishid && ($owishid==$oxcmp_user->oxuser__oxid->value)) || (($wishid==$oxcmp_user->oxuser__oxid->value)) || $recommid)}]
                                <button triggerForm="remove_[{$removeFunction}][{$testid}]" type="submit" class="btn btn-danger btn-block removeButton">
                                    <i class="fa fa-times"></i> [{oxmultilang ident="REMOVE"}]
                                </button>
                            [{/if}]
                        [{/if}]
                    [{/block}]
                </div>
            </div>
        </div>
    </form>

    [{if $removeFunction && (($owishid && ($owishid==$oxcmp_user->oxuser__oxid->value)) || (($wishid==$oxcmp_user->oxuser__oxid->value)) || $recommid)}]
        <form action="[{$oViewConf->getSelfActionLink()}]" method="post" id="remove_[{$removeFunction}][{$testid}]" class="hidden">
            <div>
                [{$oViewConf->getHiddenSid()}]
                <input type="hidden" name="cl" value="[{$oViewConf->getTopActiveClassName()}]">
                <input type="hidden" name="fnc" value="[{$removeFunction}]">
                <input type="hidden" name="aid" value="[{$product->oxarticles__oxid->value}]">
                <input type="hidden" name="am" value="0">
                <input type="hidden" name="itmid" value="[{$product->getItemKey()}]">
                [{if $recommid}]
                    <input type="hidden" name="recommid" value="[{$recommid}]">
                [{/if}]
            </div>
        </form>
    [{/if}]
[{/block}]
