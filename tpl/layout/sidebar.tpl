[{foreach from=$oxidBlock_sidebar item="_block"}]
    [{$_block}]
[{/foreach}]

[{block name="sidebar"}]
    [{block name="sidebar_categoriestree"}]
        [{if $oView->getClassName() == 'alist' }]
            <div class="box well well-sm categorytree">
                <section>
                    <div class="page-header h3">
                        <div class="pull-right visible-xs visible-sm">
                            <i class="fa fa-caret-down toggleTree"></i>
                        </div>
                        [{oxmultilang ident="DD_SIDEBAR_CATEGORYTREE"}]
                    </div>
                    [{oxid_include_widget cl="oxwCategoryTree" cnid=$oView->getCategoryId() deepLevel=0 noscript=1 nocookie=1}]
                </section>
            </div>
        [{/if}]
    [{/block}]

    [{block name="sidebar_tags"}]
        [{if $oView->showTags() && $oView->getClassName() != 'start' && $oView->getClassName() != 'tags'}]
            <div class="box well well-sm hidden-xs hidden-sm">
                <section>
                    <div class="page-header h3">[{oxmultilang ident="DD_SIDEBAR_TAGCLOUD"}]</div>
                    [{oxid_include_widget cl="oxwTagCloud" nocookie=1 noscript=1}]
                </section>
            </div>
        [{/if}]
    [{/block}]

    [{block name="sidebar_partners"}]
        [{if $oView->getClassName() eq "start"}]
            [{include file="widget/sidebar/partners.tpl"}]
        [{/if}]
    [{/block}]

    [{block name="sidebar_boxproducts"}][{/block}]

    [{block name="sidebar_recommendation"}]
        [{if $oViewConf->getShowListmania() && $oView->getSimilarRecommListIds()}]
            [{oxid_include_widget nocookie=1 cl="oxwRecommendation" aArticleIds=$oView->getSimilarRecommListIds() searchrecomm=$oView->getRecommSearch()}]
        [{elseif $oViewConf->getShowListmania() && $oView->getRecommSearch()}]
            [{oxid_include_widget nocookie=1 cl="oxwRecommendation" _parent=$oView->getClassName() searchrecomm=$oView->getRecommSearch()}]
        [{/if}]
    [{/block}]

    [{block name="sidebar_news"}]
        [{if $oxcmp_news|count}]
            [{include file="widget/sidebar/news.tpl" oNews=$oxcmp_news}]
        [{/if}]
    [{/block}]

    [{block name="sidebar_facebookfacepile"}]
          [{if $oView->isActive('FbFacepile') && $oView->isConnectedWithFb()}]
            <div id="facebookFacepile" class="box well well-sm">
                <section>
                    <div class="page-header h3">[{oxmultilang ident="FACEBOOK_FACEPILE"}]</div>
                    <div class="content" id="productFbFacePile">
                        [{include file="widget/facebook/enable.tpl" source="widget/facebook/facepile.tpl" ident="#productFbFacePile"}]
                    </div>
                </section>
            </div>
        [{/if}]
    [{/block}]

    [{block name="sidebar_shopluperatings"}]
        [{if $oView->getClassName() eq "start"}]
           [{include file="widget/shoplupe/ratings.tpl"}]
        [{/if}]
    [{/block}]
[{/block}]

