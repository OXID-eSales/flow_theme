[{block name="dd_widget_breadcrumb"}]
    [{strip}]
        <div class="row">
            <div class="col-xs-12">
                [{block name="dd_widget_breadcrumb_list_inner"}]
                    <ol id="breadcrumb" class="breadcrumb">
                        [{block name="dd_widget_breadcrumb_list"}]
                            <li class="text-muted">[{oxmultilang ident="YOU_ARE_HERE"}]:</li>
                            
                            [{foreach from=$oView->getBreadCrumb() item="sCrum" name="breadcrumb"}]
                                <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb"[{if $smarty.foreach.breadcrumb.last}] class="active"[{/if}]>
                                    <a href="[{if $sCrum.link}][{$sCrum.link}][{else}]#[{/if}]" title="[{$sCrum.title|escape:'html'}]" itemprop="url">
                                        <span itemprop="title">[{$sCrum.title}]</span>
                                    </a>
                                </li>
                            [{/foreach}]
                        [{/block}]
                    </ol>
                [{/block}]
            </div>
        </div>
    [{/strip}]
[{/block}]
