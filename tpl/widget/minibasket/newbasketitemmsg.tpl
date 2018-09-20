[{if $oxcmp_basket->getProductsCount() && $_newitem}]
    [{assign var="blFullwidth" value=$oViewConf->getViewThemeParam('blFullwidthLayout')}]

    [{oxhasrights ident="TOBASKET"}]
        [{if $blFullwidth}]
            <div class="container">
        [{/if}]
                <div class="alert alert-success" id="newItemMsg">
                    [{block name="dd_widget_minibasket_new_item_msg"}]
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket"}]" class="btn btn-default btn-xs pull-right" style="margin-right:15px;">
                            <i class="fa fa-shopping-cart"></i> [{oxmultilang ident="DISPLAY_BASKET"}]
                        </a>

                        [{oxmultilang ident="NEW_BASKET_ITEM_MSG"}]
                    [{/block}]
                </div>
        [{if $blFullwidth}]
            </div>
        [{/if}]
    [{/oxhasrights}]
[{/if}]
