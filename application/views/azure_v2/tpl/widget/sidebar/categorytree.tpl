[{block name="dd_widget_sidebar_categorytree"}]
    [{if $oxcmp_categories}]
        [{assign var="categories" value=$oxcmp_categories->getClickRoot()}]
        [{assign var="act" value=$oxcmp_categories->getClickCat()}]
        [{if $categories}]
            [{assign var="deepLevel" value=$oView->getDeepLevel()}]
            <div class="categoryBox hidden-xs hidden-sm">
                [{block name="dd_widget_sidebar_categorytree_inner"}]
                    <ol class="nav nav-pills nav-stacked cat-tree">
                        [{block name="dd_widget_sidebar_categorytree_list"}]
                            [{defun name="tree" categories=$categories}]
                                [{assign var="deepLevel" value=$deepLevel+1}]
                                [{assign var="oContentCat" value=$oView->getContentCategory()}]
                                [{foreach from=$categories item="_cat"}]
                                    [{if $_cat->getIsVisible()}]
                                        [{* CMS category *}]
                                        [{if $_cat->getContentCats() && $deepLevel > 1}]
                                            [{foreach from=$_cat->getContentCats() item="_oCont"}]
                                                <li class="[{if $oContentCat && $oContentCat->getId()==$_oCont->getId()}] active [{else}] end [{/if}]" >
                                                    <a href="[{$_oCont->getLink()}]" title="[{$_oCont->oxcontents__oxtitle->value}]"><i></i>[{$_oCont->oxcontents__oxtitle->value}]</a>
                                                </li>
                                            [{/foreach}]
                                        [{/if}]

                                        [{* subcategories *}]
                                        [{assign var="oSubCats" value=$_cat->getSubCats()}]
                                        <li class="[{if !$oContentCat && $act && $act->getId()==$_cat->getId()}]active[{elseif $_cat->expanded}]exp[{/if}][{if !$_cat->hasVisibleSubCats}] end[{/if}]">
                                            <a href="[{$_cat->getLink()}]" title="[{$_cat->oxcategories__oxtitle->value}]">
                                                <i class="fa fa-caret-[{if $_cat->expanded && $oSubCats}]down[{else}]right[{/if}]"></i> [{$_cat->oxcategories__oxtitle->value}] [{if $oView->showCategoryArticlesCount() && ($_cat->getNrOfArticles() > 0)}] ([{$_cat->getNrOfArticles()}])[{/if}]
                                            </a>
                                            [{if $oSubCats && $_cat->expanded}]
                                                <ul class="nav nav-pills nav-stacked">[{fun name="tree" categories=$oSubCats}]</ul>
                                            [{/if}]
                                        </li>
                                    [{/if}]
                                [{/foreach}]
                            [{/defun}]
                        [{/block}]
                    </ol>
                [{/block}]
            </div>
        [{/if}]
    [{/if}]
[{/block}]
