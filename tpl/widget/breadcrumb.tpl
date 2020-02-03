[{block name="dd_widget_breadcrumb"}]
    [{strip}]
        <div class="row">
            <div class="col-xs-12">
                [{block name="dd_widget_breadcrumb_list_inner"}]
                    <ol id="breadcrumb" class="breadcrumb" vocab="http://schema.org/" typeof="BreadcrumbList">
                        [{block name="dd_widget_breadcrumb_list"}]
                            <li class="text-muted">[{oxmultilang ident="YOU_ARE_HERE"}]:</li>
                            
                            [{foreach from=$oView->getBreadCrumb() item="sCrum" name="breadcrumb"}]
                                <li property="itemListElement" typeof="ListItem" [{if $smarty.foreach.breadcrumb.last}] class="active"[{/if}]>
                                    <a href="[{if $sCrum.link}][{$sCrum.link}][{else}]#[{/if}]" title="[{$sCrum.title|escape:'html'}]" property="item" typeof="WebPage">
                                        <span property="name">[{$sCrum.title}]</span>
                                    </a>
                                    <meta property="position" content="[{$smarty.foreach.breadcrumb.iteration}]">
                                </li>
                            [{/foreach}]
                        [{/block}]
                    </ol>
                [{/block}]
            </div>
        </div>
    [{/strip}]
[{/block}]
