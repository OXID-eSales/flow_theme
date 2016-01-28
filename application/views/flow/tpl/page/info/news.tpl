[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="LATEST_NEWS_AND_UPDATES_AT"|oxmultilangassign}]
    <div>
    [{assign var="oNews" value=$oView->getNews()}]
    <h1 class="page-header">[{oxmultilang ident="LATEST_NEWS_AND_UPDATES_AT"}] [{$oxcmp_shop->oxshops__oxname->value}]</h1>
    <div class="listRefine clear bottomRound">
    </div>
        [{foreach from=$oNews item=oNews}]
            [{if !empty($oNews) && !empty($oNews->oxnews__oxshortdesc->value)}]
                <div>
                    <h3>
                        <span>[{$oNews->oxnews__oxdate->value|date_format:"%d.%m.%Y"}] - </span> [{$oNews->oxnews__oxshortdesc->value}]
                    </h3>
                    [{$oNews->getLongDesc() force=1}]
                </div>
            [{else}]

            [{/if}]
        [{/foreach}]
    </div>
    [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigation() place="bottom"}]
    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]
