<div class="btn-group minibasket-menu">
    <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" data-href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket"}]">
        [{block name="dd_layout_page_header_icon_menu_minibasket_button"}]
            <i class="fa fa-shopping-cart fa-2x" aria-hidden="true"></i>
            [{if $oxcmp_basket->getItemsCount() > 0}]
                <span class="badge">
                    [{ $oxcmp_basket->getItemsCount() }]
                </span>
            [{/if}]
        [{/block}]
    </button>
    <ul class="dropdown-menu dropdown-menu-right pull-right" role="menu">
        [{block name="dd_layout_page_header_icon_menu_minibasket_list"}]
            <li>
                <div class="row">
                    <div class="col-xs-12 pull-right">
                        <div class="minibasket-menu-box">
                            [{oxid_include_dynamic file="widget/minibasket/minibasket.tpl"}]
                        </div>
                    </div>
                </div>
            </li>
        [{/block}]
    </ul>
</div>