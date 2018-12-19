[{*[{oxscript add="$('a.js-external').attr('target', '_blank');"}]*}]
[{capture append="oxidBlock_content"}]
    [{assign var="search_title" value="SEARCH"|oxmultilangassign}]
    [{assign var="searchparamforhtml" value=$oView->getSearchParamForHtml()}]
    [{assign var="template_title" value="$search_title - $searchparamforhtml"}]
    [{assign var="search_head" value="HITS_FOR"|oxmultilangassign}]
    [{assign var="search_head" value=$oView->getArticleCount()|cat:" "|cat:$search_head|cat:" &quot;"|cat:$oView->getSearchParamForHtml()|cat:"&quot;"}]


    <div class="page-header">
        [{block name="search_header"}]
            <h1 class="pull-left">[{$search_head}]</h1>
            [{assign var='rsslinks' value=$oView->getRssLinks()}]
            [{if $rsslinks.searchArticles}]
                [{assign var="imgUrl" value=$oViewConf->getImageUrl('rss.png')}]
                <small class="pull-right">
                    <a class="rss" id="rssSearchProducts" target="_blank" href="[{$rsslinks.searchArticles.link}]" title="[{$rsslinks.searchArticles.title}]">
                        <i class="fa fa-rss"></i> [{$rsslinks.searchArticles.title}]
                    </a>
                </small>
            [{/if}]
            <div class="clearfix"></div>
        [{/block}]
    </div>
    [{block name="search_results"}]
        [{if $oView->getArticleCount()}]
            <div class="listRefine clear bottomRound">
                [{block name="search_top_listlocator"}]
                    [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigationLimitedTop() listDisplayType=true itemsPerPage=true sort=true}]
                [{/block}]
            </div>
        [{else}]
            <p class="alert alert-info">[{oxmultilang ident="NO_ITEMS_FOUND"}]</p>
        [{/if}]
        [{if $oView->getArticleList()}]
            [{foreach from=$oView->getArticleList() name=search item=product}]
                [{include file="widget/product/list.tpl" type=$oView->getListDisplayType() listId="searchList" products=$oView->getArticleList() showMainLink=true}]
            [{/foreach}]
        [{/if}]
        [{if $oView->getArticleCount()}]
            [{block name="search_bottom_listlocator"}]
                [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigationLimitedBottom() place="bottom"}]
            [{/block}]
        [{/if}]
    [{/block}]
    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]
[{assign var="template_title" value="SEARCH"|oxmultilangassign}]

[{include file="layout/page.tpl" title=$template_title location="SEARCH"|oxmultilangassign sidebar="Left"}]
