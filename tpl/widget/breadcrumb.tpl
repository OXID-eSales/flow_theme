[{block name="dd_widget_breadcrumb"}]
    [{strip}]
        <div class="row">
            <div class="col-xs-12">
                [{block name="dd_widget_breadcrumb_list_inner"}]
                    <ol id="breadcrumb" class="breadcrumb" itemscope itemtype="http://schema.org/BreadcrumbList">
                        [{block name="dd_widget_breadcrumb_list"}]
                            <li class="text-muted">[{oxmultilang ident="YOU_ARE_HERE"}]:</li>
                            
                            [{foreach from=$oView->getBreadCrumb() item="sCrum" name="breadcrumb"}]
                                <li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem"[{if $smarty.foreach.breadcrumb.last}] class="active"[{/if}]>
                                    <a href="[{if $sCrum.link}][{$sCrum.link}][{else}]#[{/if}]" title="[{$sCrum.title|escape:'html'}]" itemprop="item">
                                        <span itemprop="name">[{$sCrum.title}]</span>
                                    </a>
                                    <meta itemprop="position" content="[{$smarty.foreach.breadcrumb.iteration}]" />
                                </li>
                            [{/foreach}]
                        [{/block}]
                    </ol>
                [{/block}]
            </div>
        </div>
    [{/strip}]
[{/block}]
