[{block name="dd_widget_sidebar_news"}]
    <div id="newsBox" class="box well well-sm">
        <section>
            <div class="page-header h3">[{oxmultilang ident="WIDGET_NEWS_HEADER"}]</div>
            [{block name="dd_widget_sidebar_news_inner"}]
                <ul class="content">
                    [{block name="dd_widget_sidebar_news_list"}]
                        [{foreach from=$oNews item="_oNewsItem" name="_sNewsList"}]
                            <li>
                                [{$_oNewsItem->getLongDesc()|strip_tags|oxtruncate:100}]<br>
                                <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=news"}]#[{$_oNewsItem->oxnews__oxid->value}]" class="readMore">[{oxmultilang ident="WIDGET_NEWS_LINKMORE"}]</a>
                            </li>
                        [{/foreach}]
                    [{/block}]
                </ul>
            [{/block}]
        </section>
    </div>
[{/block}]