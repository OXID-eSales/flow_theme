<div class="btn-group service-menu [{if !$oxcmp_user}]showLogin[{/if}]">
    <button type="button" class="btn dropdown-toggle" data-toggle="dropdown" data-href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account"}]">
        [{block name="dd_layout_page_header_icon_menu_account_button"}]
            [{if !$oxcmp_user}]
                [{oxmultilang ident="LOGIN"}]
            [{else}]
                [{oxmultilang ident="MY_ACCOUNT"}]
            [{/if}]
            [{oxid_include_dynamic file="widget/header/notificationscounter.tpl"}]
            <i class="fa fa-angle-down hidden-xs"></i>
        [{/block}]
    </button>
    <ul class="dropdown-menu dropdown-menu-right pull-right" role="menu">
        [{block name="dd_layout_page_header_icon_menu_account_list"}]
            <li>
                <div class="row">
                    <div class="[{if !$oxcmp_user}]col-xs-12 col-sm-5[{else}]col-xs-12[{/if}] pull-right">
                        <div class="service-menu-box clearfix">
                            [{include file="widget/header/servicebox.tpl"}]
                            [{if $oxcmp_user}]
                                <div class="divider"></div>
                                <div class="text-right">
                                    <a class="btn btn-danger" role="button" href="[{$oViewConf->getLogoutLink()}]" title="[{oxmultilang ident="LOGOUT"}]">
                                        <i class="fa fa-power-off"></i> [{oxmultilang ident="LOGOUT"}]
                                    </a>
                                </div>
                            [{/if}]
                        </div>
                    </div>
                    [{if !$oxcmp_user}]
                        <div class="col-xs-12 col-sm-7">
                            <div class="service-menu-box clearfix">
                                [{include file="widget/header/loginbox.tpl"}]
                            </div>
                        </div>
                    [{/if}]
                </div>
            </li>
        [{/block}]
    </ul>
</div>