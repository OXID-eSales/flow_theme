[{if !isset($_compare_class)}][{assign var="_compare_class" value=null}][{/if}]

[{if $_compare_in_list}]
    <a id="removeFromCompare[{$_compare_testid}]" class="compare remove [{$_compare_class}]" data-aid="[{$_compare_aid}]" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl="|cat:$oViewConf->getTopActiveClassName() params="am=1&amp;removecompare=1&amp;fnc=tocomparelist&amp;aid=`$_compare_aid`&amp;anid=`$_compare_anid`&amp;pgNr=`$_compare_page`"|cat:$oViewConf->getNavUrlParams()}]">[{oxmultilang ident=$_compare_text_from_id}]</a>
[{else}]
    <a id="addToCompare[{$_compare_testid}]" class="compare add [{$_compare_class}]" data-aid="[{$_compare_aid}]" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl="|cat:$oViewConf->getTopActiveClassName() params="am=1&amp;addcompare=1&amp;fnc=tocomparelist&aid=`$_compare_aid`&amp;anid=`$_compare_anid`&amp;pgNr=`$_compare_page`"|cat:$oViewConf->getNavUrlParams()}]">[{oxmultilang ident=$_compare_text_to_id}]</a>
[{/if}]
