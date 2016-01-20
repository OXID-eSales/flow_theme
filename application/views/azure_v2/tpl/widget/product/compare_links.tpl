[{assign var="_additionalParams" value=$oView->getAdditionalParams()}]
[{if $in_list}]
    <a class="compare remove clear" data-aid="[{$_compare_aid}]" id="removeCmp[{$_compare_testid}]" href="[{$oView->getLink()|oxaddparams:"am=1&amp;removecompare=1&amp;fnc=tocomparelist&amp;aid=`$_compare_aid`&amp;anid=`$_compare_anid`&amp;pgNr=`$_compare_page`&amp;$_additionalParams"}]">[{oxmultilang ident="REMOVE_FROM_COMPARE_LIST"}]</a>
[{else}]
    <a class="compare add clear" data-aid="[{$_compare_aid}]" id="toCmp[{$_compare_testid}]" href="[{$oView->getLink()|oxaddparams:"am=1&amp;addcompare=1&amp;fnc=tocomparelist&aid=`$_compare_aid`&amp;anid=`$_compare_anid`&amp;pgNr=`$_compare_page`&amp;$_additionalParams"}]">[{oxmultilang ident="COMPARE"}]</a>
[{/if}]
