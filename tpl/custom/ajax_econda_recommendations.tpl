[{assign var="sAccountId" value=$oViewConf->getViewThemeParam('sEcondaRecommendationsAID')}]

[{if $sAccountId}]
    [{if $sWidgetId}]
        [{* econda-Recommendations abholen *}]
        [{assign var="sUrl" value="http://widgets.crosssell.info/eps/crosssell/recommendations.do?aid=`$sAccountId`&wid=`$sWidgetId`&csize=20&start=0&type=cs&widgetdetails=true"}]
        [{assign var="oResponse" value=$sUrl|@file_get_contents|json_decode}]

        [{* Prüfen, ob Artikel-IDs zurückgekommen sind *}]
        [{if $oResponse && count($oResponse->items)}]
            [{*<pre>[{$oResponse|var_dump}]</pre>*}]

            [{* Array mit Artikeln aus Response bilden*}]
            [{foreach from=$oResponse->items item="oItem"}]
                [{capture append="aArticles"}][{$oItem->id}][{/capture}]
            [{/foreach}]

            [{* ToDo: Prüfen, ob Artikel anhand der OXID oder Artikelnummer geladen werden müssen. *}]
            [{*@var oxArticleList $oArtList *}]
            [{assign var="sArticles" value="','"|@implode:$aArticles}]
            [{assign var="sViewName" value="oxarticles"|@getViewName}]
            [{assign var="oArtList" value="oxArticleList"|@oxNew}]
            [{$oArtList->selectString("SELECT * FROM `$sViewName` WHERE OXARTNUM IN('`$sArticles`') AND OXACTIVE = 1")}]

            [{include file="widget/product/list.tpl" listId=$sListId head=$oResponse->widgetdetails->title products=$oArtList}]
        [{/if}]
    [{/if}]
[{/if}]