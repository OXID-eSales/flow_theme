[{assign var="_oRecommendationList" value=$oView->getSimilarRecommLists()}]
[{assign var="oRecommList" value=$oView->getRecommList()}]

[{if $_oRecommendationList || $oRecommList->getRecommSearch()}]
    <div class="box well well-sm hidden-sm hidden-xs" id="recommendationsBox">
        <section>
            <div class="page-header h3">[{oxmultilang ident="LISTMANIA"}]</div>
            <div>
                [{if $_oRecommendationList}]
                    [{$_oRecommendationList->rewind()}]

                    [{if $_oRecommendationList->current()}]
                        [{assign var="_oFirstRecommendationList" value=$_oRecommendationList->current()}]
                        [{assign var="_oBoxTopProduct" value=$_oFirstRecommendationList->getFirstArticle()}]
                        [{assign var="_sTitle" value="`$_oBoxTopProduct->oxarticles__oxtitle->value` `$_oBoxTopProduct->oxarticles__oxvarselect->value`"|strip_tags}]
                        <div class="text-center">
                            <a href="[{$_oBoxTopProduct->getMainLink()}]" class="featured img-thumbnail" title="[{$_sTitle}]">
                                <img src="[{$_oBoxTopProduct->getIconUrl()}]" alt="[{$_sTitle}]">
                            </a>
                        </div>
                    [{/if}]
                [{/if}]
                <ul class="featuredList list-unstyled">
                    [{if $_oRecommendationList}]
                        [{foreach from=$_oRecommendationList item=_oListItem name="testRecommendationsList"}]
                            <li>
                                <a href="[{$_oListItem->getLink()}]"><b>[{$_oListItem->oxrecommlists__oxtitle->value|strip_tags}]</b></a>
                                <div class="desc">[{oxmultilang ident="LIST_BY"}]: [{$_oListItem->oxrecommlists__oxauthor->value|strip_tags}]</div>
                            </li>
                        [{/foreach}]
                    [{/if}]
                    [{if $_oRecommendationList || $oRecommList->getRecommSearch()}]
                    <li>
                        <form name="basket" class="recommendationsSearchForm" action="[{$oViewConf->getSelfActionLink()}]" method="post">
                            <div>
                                <input type="hidden" name="cl" value="recommlist">
                                [{$oViewConf->getHiddenSid()}]
                            </div>
                            <label>[{oxmultilang ident="SEARCH_FOR_LISTS"}]</label>
                            <div class="input-group">
                                <input type="text" name="searchrecomm" id="searchRecomm" value="[{$oRecommList->getRecommSearch()}]" class="searchInput form-control">
                                <span class="input-group-btn">
                                    <button class="submitButton largeButton btn btn-default" type="submit">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </span>
                            </div>
                        </form>
                    </li>
                    [{/if}]
                </ul>
            </div>
        </section>
    </div>
[{/if}]