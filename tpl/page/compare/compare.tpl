[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="COMPARE"|oxmultilangassign}]

    [{$oView->setNoPaging()}]

    [{assign var="articleList" value=$oView->getCompArtList()}]
    [{assign var="atributeList" value=$oView->getAttributeList()}]

    [{oxscript include="js/pages/compare.min.js"}]

    <h1 id="productComparisonHeader" class="page-header">[{$template_title}]</h1>
    [{if $oView->getCompareItemsCnt() >= 1}]
        <div id="comparePlayground">
            <div id="compareLandscape">
                <table class="table-bordered">
                    <tbody>
                        <tr class="products">
                            [{foreach from=$articleList key=iProdNr item="product" name="compareArticles"}]
                                [{if $smarty.foreach.compareArticles.first}]
                                    <th class="attrib-title no-border" scope="row">&nbsp;</th>
                                [{/if}]

                                <td class="item-wrapper text-center">
                                    <div class="move-controls btn-group">
                                        [{if !$product->hidePrev}]
                                            <a id="compareLeft_[{$product->oxarticles__oxid->value}]" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl="|cat:$oViewConf->getActiveClassName() params="fnc=moveleft&amp;aid=`$product->oxarticles__oxnid->value`&amp;pgNr="|cat:$oView->getActPage()}]" class="btn btn-default movePrev">&laquo;</a>
                                        [{/if}]

                                        <a href="javascript:;" class="btn btn-default disabled">[{oxmultilang ident="MOVE"}]</a>

                                        [{if !$product->hideNext}]
                                            <a id="compareRight_[{$product->oxarticles__oxid->value}]" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl="|cat:$oViewConf->getActiveClassName() params="fnc=moveright&amp;aid=`$product->oxarticles__oxnid->value`&amp;pgNr="|cat:$oView->getActPage()}]" class="btn btn-default moveNext">&raquo;</a>
                                        [{/if}]
                                    </div>
                                    [{include file="page/compare/inc/compareitem.tpl" product=$product testid=$smarty.foreach.comparelist.iteration}]
                                </td>
                            [{/foreach}]
                        </tr>
                        [{foreach from=$atributeList key=iProdNr item="oAttrib" name="compareAttributes"}]
                            <tr>
                                <th class="attrib-title" scope="row">[{$oAttrib->title}]:</th>

                                [{foreach from=$articleList key="iProdNr" item="product" name="compareArticles"}]
                                    <td class="attrib-text">
                                        [{if $oAttrib->aProd.$iProdNr && $oAttrib->aProd.$iProdNr->value}]
                                            [{$oAttrib->aProd.$iProdNr->value}]
                                        [{else}]
                                            -
                                        [{/if}]
                                    </td>
                                [{/foreach}]
                            </tr>
                        [{/foreach}]
                    </tbody>
                </table>
            </div>
        </div>
    [{else}]
        <p class="alert alert-danger">[{oxmultilang ident="MESSAGE_SELECT_AT_LEAST_ONE_PRODUCT"}]</p>
    [{/if}]
    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]

[{if !$oxcmp_user->oxuser__oxpassword->value}]
    [{include file="layout/page.tpl"}]
[{else}]
    [{capture append="oxidBlock_sidebar"}]
        [{include file="page/account/inc/account_menu.tpl" active_link="compare"}]
    [{/capture}]
    [{include file="layout/page.tpl" sidebar="Left"}]
[{/if}]