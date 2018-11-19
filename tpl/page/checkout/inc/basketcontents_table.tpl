<table id="basket_table" class="table table-bordered table-striped basketitems[{if $oViewConf->getActiveClassName() == 'order'}] orderBasketItems[{/if}]">
    <colgroup>
        [{if $editable}]<col class="editCol">[{/if}]
        <col class="thumbCol">
        [{if $oView->isWrapping()}]<col class="wrappingCol">[{/if}]
        <col class="coutCol">
        <col class="priceCol">
        <col class="vatCol">
        <col class="totalCol">
    </colgroup>
    [{* basket header *}]
    <thead>
        <tr>
            [{if $editable}]<th></th>[{/if}]
            <th>[{oxmultilang ident="PRODUCT"}]</th>
            [{if $oView->isWrapping()}]
                <th>[{oxmultilang ident="WRAPPING"}]</th>
            [{/if}]
            <th>[{oxmultilang ident="QUANTITY"}]</th>
            <th class="unitPrice">[{oxmultilang ident="UNIT_PRICE"}]</th>
            <th class="vatPercent">[{oxmultilang ident="VAT"}]</th>
            <th class="totalPrice">[{oxmultilang ident="TOTAL"}]</th>
        </tr>
    </thead>

    [{* basket items *}]
    <tbody>
        [{assign var="basketitemlist" value=$oView->getBasketArticles()}]
        [{foreach key=basketindex from=$oxcmp_basket->getContents() item=basketitem name=basketContents}]
            [{block name="checkout_basketcontents_basketitem"}]
                [{assign var="basketproduct" value=$basketitemlist.$basketindex}]
                [{assign var="oArticle" value=$basketitem->getArticle()}]
                [{assign var="oAttributes" value=$oArticle->getAttributesDisplayableInBasket()}]

                <tr id="table_cartItem_[{$smarty.foreach.basketContents.iteration}]">

                    [{block name="checkout_basketcontents_basketitem_removecheckbox"}]
                        [{if $editable}]
                            <td class="checkactive checkbox text-center" style="display:table-cell;margin:0;padding:0;vertical-align:middle;">
                                <input type="checkbox" name="aproducts[[{$basketindex}]][remove]" value="1" style="margin:0;float:none;">
                            </td>
                        [{/if}]
                    [{/block}]

                    [{block name="checkout_basketcontents_basketitem_titlenumber"}]
                        [{* product title & number *}]
                        <td>
                            [{block name="checkout_basketcontents_basketitem_image"}]
                                [{* product image *}]
                                <div class="pull-left basketImage">
                                    [{if $editable}]<a href="[{$basketitem->getLink()}]">[{/if}]
                                        <img src="[{$oViewConf->getImageUrl('spinner.gif')}]" data-src="[{$basketitem->getIconUrl()}]" alt="[{$basketitem->getTitle()|strip_tags}]">
                                        [{if $editable}]</a>[{/if}]
                                </div>
                            [{/block}]
                            <div class="basketItemDesc">
                                [{block name="dd_checkout_inc_basketcontents_table_item_desc"}]
                                    [{block name="checkout_basketcontents_basketitem_title"}]
                                        [{if $editable}]<a rel="nofllow" href="[{$basketitem->getLink()}]">[{/if}]
                                        <b>[{$basketitem->getTitle()}]</b>
                                        [{if $editable}]</a>[{/if}]
                                        [{if $basketitem->isSkipDiscount()}] <sup><a href="#SkipDiscounts_link" >**</a></sup>[{/if}]
                                    [{/block}]
                                    [{block name="checkout_basketcontents_basketitem_artnum"}]
                                        <div class="small">
                                            [{oxmultilang ident="PRODUCT_NO"}] [{$basketproduct->oxarticles__oxartnum->value}]
                                        </div>
                                    [{/block}]
                                    [{block name="checkout_basketcontents_basketitem_attributes"}]
                                        <div class="small">
                                            [{assign var=sep value=", "}]
                                            [{assign var=result value=""}]
                                            [{foreach key=oArtAttributes from=$oAttributes->getArray() item=oAttr name=attributeContents}]
                                                [{assign var=temp value=$oAttr->oxattribute__oxvalue->value}]
                                                [{assign var=result value=$result$temp$sep}]
                                            [{/foreach}]
                                            [{$result|trim:$sep}]
                                        </div>
                                    [{/block}]

                                    [{block name="checkout_basketcontents_basketitem_selectlists"}]
                                        [{if !$basketitem->isBundle() || !$basketitem->isDiscountArticle()}]
                                            [{assign var="oSelections" value=$basketproduct->getSelections(null,$basketitem->getSelList())}]
                                            [{if $oSelections}]
                                                <div class="selectorsBox clear" id="cartItemSelections_[{$smarty.foreach.basketContents.iteration}]">
                                                    [{foreach from=$oSelections item=oList name=selections}]
                                                        [{if $oViewConf->showSelectListsInList()}]
                                                            [{include file="widget/product/selectbox.tpl" oSelectionList=$oList sFieldName="aproducts[`$basketindex`][sel]" iKey=$smarty.foreach.selections.index blHideDefault=true sSelType="seldrop"}]
                                                        [{else}]
                                                            [{assign var="oActiveSelection" value=$oList->getActiveSelection()}]
                                                            [{if $oActiveSelection}]
                                                                <input type="hidden" name="aproducts[[{$basketindex}]][sel][[{$smarty.foreach.selections.index}]]" value="[{$oActiveSelection->getValue()}]">
                                                                <div>[{$oList->getLabel()}]: [{$oActiveSelection->getName()}]</div>
                                                            [{/if}]
                                                        [{/if}]
                                                    [{/foreach}]
                                                </div>
                                            [{/if}]
                                        [{/if}]
                                    [{/block}]

                                    [{block name="checkout_basketcontents_basketitem_persparams"}]
                                        [{if !$editable}]
                                            <p class="persparamBox">
                                                [{foreach key=sVar from=$basketitem->getPersParams() item=aParam name=persparams}]
                                                    [{if !$smarty.foreach.persparams.first}]<br />[{/if}]
                                                    <strong>
                                                        [{if $smarty.foreach.persparams.first && $smarty.foreach.persparams.last}]
                                                            [{oxmultilang ident="LABEL"}]
                                                        [{else}]
                                                            [{$sVar}] :
                                                        [{/if}]
                                                    </strong> [{$aParam}]
                                                [{/foreach}]
                                            </p>
                                        [{else}]
                                            [{if $basketproduct->oxarticles__oxisconfigurable->value}]
                                                [{if $basketitem->getPersParams()}]
                                                    <br />
                                                    [{foreach key=sVar from=$basketitem->getPersParams() item=aParam name=persparams}]
                                                        <p>
                                                            <label class="persParamLabel">
                                                                [{if $smarty.foreach.persparams.first && $smarty.foreach.persparams.last}]
                                                                    [{oxmultilang ident="LABEL"}]
                                                                [{else}]
                                                                    [{$sVar}]:
                                                                [{/if}]
                                                            </label>
                                                            <input class="textbox persParam" type="text" name="aproducts[[{$basketindex}]][persparam][[{$sVar}]]" value="[{$aParam}]">
                                                        </p>
                                                    [{/foreach}]
                                                [{else}]
                                                    <p>[{oxmultilang ident="LABEL"}] <input class="textbox persParam" type="text" name="aproducts[[{$basketindex}]][persparam][details]" value=""></p>
                                                [{/if}]
                                            [{/if}]
                                        [{/if}]
                                    [{/block}]
                                [{/block}]
                            </div>
                        </td>
                    [{/block}]

                    [{block name="checkout_basketcontents_basketitem_wrapping"}]
                        [{* product wrapping *}]
                        [{if $oView->isWrapping()}]
                            <td align="center">
                                [{if !$basketitem->getWrappingId()}]
                                    [{if $editable}]
                                        <a href="#" class="btn btn-default btn-xs" title="[{oxmultilang ident="ADD"}]" data-toggle="modal" data-target="#giftoptions">[{oxmultilang ident="ADD"}]</a>
                                    [{else}]
                                        [{oxmultilang ident="NONE"}]
                                    [{/if}]
                                [{else}]
                                    [{assign var="oWrap" value=$basketitem->getWrapping()}]
                                    [{if $editable}]
                                        <a class="btn btn-default btn-xs" href="#" title="[{oxmultilang ident="ADD"}]" data-toggle="modal" data-target="#giftoptions"><i class="fa fa-pencil"></i> [{$oWrap->oxwrapping__oxname->value}]</a>
                                    [{else}]
                                        [{$oWrap->oxwrapping__oxname->value}]
                                    [{/if}]
                                [{/if}]
                            </td>
                        [{/if}]
                    [{/block}]

                    [{block name="checkout_basketcontents_basketitem_quantity"}]
                        [{* product quantity manager *}]
                        <td class="quantity">
                            [{if $editable}]
                                <input type="hidden" name="aproducts[[{$basketindex}]][aid]" value="[{$basketitem->getProductId()}]">
                                <input type="hidden" name="aproducts[[{$basketindex}]][basketitemid]" value="[{$basketindex}]">
                                <input type="hidden" name="aproducts[[{$basketindex}]][override]" value="1">
                                [{if $basketitem->isBundle()}]
                                    <input type="hidden" name="aproducts[[{$basketindex}]][bundle]" value="1">
                                [{/if}]

                                [{if !$basketitem->isBundle() || !$basketitem->isDiscountArticle()}]
                                    <p>
                                        <input id="am_[{$smarty.foreach.basketContents.iteration}]" type="number" class="textbox" name="aproducts[[{$basketindex}]][am]" value="[{$basketitem->getAmount()}]" size="3" min="0"[{if $oConfig->getConfigParam('blAllowUnevenAmounts')}] step="any"[{/if}]>
                                    </p>
                                [{/if}]
                            [{else}]
                                [{$basketitem->getAmount()}]
                            [{/if}]
                            [{if $basketitem->getdBundledAmount() > 0 && ($basketitem->isBundle() || $basketitem->isDiscountArticle())}]
                                +[{$basketitem->getdBundledAmount()}]
                            [{/if}]
                        </td>
                    [{/block}]

                    [{block name="checkout_basketcontents_basketitem_unitprice"}]
                        [{* product price *}]
                        <td class="unitPrice">
                            [{if $basketitem->getUnitPrice()}][{oxprice price=$basketitem->getUnitPrice() currency=$currency}][{/if}]
                            [{if !$basketitem->isBundle()}]
                                [{assign var=dRegUnitPrice value=$basketitem->getRegularUnitPrice()}]
                                [{assign var=dUnitPrice value=$basketitem->getUnitPrice()}]
                                [{if $dRegUnitPrice->getPrice() > $dUnitPrice->getPrice()}]
                                    <br><del class="text-danger">[{oxprice price=$basketitem->getRegularUnitPrice() currency=$currency}]</del>
                                [{/if}]
                            [{/if}]
                        </td>
                    [{/block}]

                    [{block name="checkout_basketcontents_basketitem_vat"}]
                        [{* product VAT percent *}]
                        <td class="vatPercent">
                            [{$basketitem->getVatPercent()}]%
                        </td>
                    [{/block}]

                    [{block name="checkout_basketcontents_basketitem_totalprice"}]
                        [{* product quantity * price *}]
                        <td class="totalPrice">
                            [{oxprice price=$basketitem->getPrice() currency=$currency}]
                        </td>
                    [{/block}]
                </tr>
            [{/block}]

            [{* packing unit *}]

            [{block name="checkout_basketcontents_itemerror"}]
                [{foreach from=$Errors.basket item=oEr key=key}]
                    [{if $oEr->getErrorClassType() == 'oxOutOfStockException'}]
                        [{* display only the exceptions for the current article *}]
                        [{if $basketindex == $oEr->getValue('basketIndex')}]
                            <tr class="basketError">
                                [{if $editable}]<td></td>[{/if}]
                                <td colspan="5">
                                    <span class="inlineError">[{$oEr->getOxMessage()}] <strong>[{$oEr->getValue('remainingAmount')}]</strong></span>
                                </td>
                                [{if $oView->isWrapping()}]<td></td>[{/if}]
                                <td></td>
                            </tr>
                        [{/if}]
                    [{/if}]
                    [{if $oEr->getErrorClassType() == 'oxArticleInputException'}]
                        [{if $basketitem->getProductId() == $oEr->getValue('productId')}]
                            <tr class="basketError">
                                [{if $editable}]<td></td>[{/if}]
                                <td colspan="5">
                                    <span class="inlineError">[{$oEr->getOxMessage()}]</span>
                                </td>
                                [{if $oView->isWrapping()}]<td></td>[{/if}]
                                <td></td>
                            </tr>
                        [{/if}]
                    [{/if}]
                [{/foreach}]
            [{/block}]
            [{*  basket items end  *}]
        [{/foreach}]

        [{block name="checkout_basketcontents_giftwrapping"}]
            [{if $oViewConf->getShowGiftWrapping()}]
                [{assign var="oCard" value=$oxcmp_basket->getCard()}]
                [{if $oCard}]
                    <tr>
                        [{if $editable}]<td></td>[{/if}]
                        <td id="orderCardTitle" colspan="3">[{oxmultilang ident="GREETING_CARD"}] "[{$oCard->oxwrapping__oxname->value}]"
                            <br>
                            <b>[{oxmultilang ident="YOUR_MESSAGE"}]</b>
                            <br>
                            <div id="orderCardText">[{$oxcmp_basket->getCardMessage()|nl2br}]</div>
                        </td>
                        <td id="orderCardPrice">[{$oCard->getFPrice()}]&nbsp;[{$currency->sign}]</td>
                        <td>
                            [{if $oxcmp_basket->isProportionalCalculationOn()}]
                                [{oxmultilang ident="PROPORTIONALLY_CALCULATED"}]
                            [{else}]
                                [{if $oxcmp_basket->getGiftCardCostVat()}][{$oxcmp_basket->getGiftCardCostVatPercent()}]%[{/if}]
                            [{/if}]
                        </td>
                        <td id="orderCardTotalPrice" align="right">[{$oCard->getFPrice()}]&nbsp;[{$currency->sign}]</td>
                    </tr>
                [{/if}]
            [{/if}]
        [{/block}]
    </tbody>

    [{block name="checkout_basketcontents_basketfunctions"}]
        [{if $editable}]
            <tfoot id="basketFn" class="basketFunctions">
                <tr>
                    <td class="text-center" style="display:table-cell;vertical-align:middle;">
                        <input type="checkbox" name="checkAll" id="checkAll" title="[{oxmultilang ident="ALL"}]">
                    </td>
                    <td colspan="[{if $oView->isWrapping()}]6[{else}]5[{/if}]">
                        <button name="removeAllBtn" class="btn btn-sm" id="basketRemoveAll" type="button">[{oxmultilang ident="ALL"}]</button>
                        <button name="removeBtn" class="btn btn-sm btn-danger" id="basketRemove" type="submit">[{oxmultilang ident="REMOVE"}]</button>
                        <button name="updateBtn" class="btn btn-sm btn-warning" id="basketUpdate" type="submit">[{oxmultilang ident="UPDATE"}]</button>
                    </td>
                </tr>
            </tfoot>
        [{/if}]
    [{/block}]
</table>
