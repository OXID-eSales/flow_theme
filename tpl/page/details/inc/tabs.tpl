[{assign var="blFirstTab" value=true}]

[{block name="details_tabs_longdescription"}]
    [{oxhasrights ident="SHOWLONGDESCRIPTION"}]
        [{assign var="oLongdesc" value=$oDetailsProduct->getLongDescription()}]
        [{if $oLongdesc->value}]
            [{capture append="tabs"}]<a href="#description" data-toggle="tab">[{oxmultilang ident="DESCRIPTION"}]</a>[{/capture}]
            [{capture append="tabsContent"}]
                <div id="description" class="tab-pane[{if $blFirstTab}] active[{/if}]" itemprop="description">
                    [{oxeval var=$oLongdesc}]
                    [{if $oDetailsProduct->oxarticles__oxexturl->value}]
                        <a id="productExturl" class="js-external" href="[{$oDetailsProduct->oxarticles__oxexturl->value}]">
                        [{if $oDetailsProduct->oxarticles__oxurldesc->value}]
                            [{$oDetailsProduct->oxarticles__oxurldesc->value}]
                        [{else}]
                            [{$oDetailsProduct->oxarticles__oxexturl->value}]
                        [{/if}]
                        </a>
                    [{/if}]
                </div>
            [{/capture}]
            [{assign var="blFirstTab" value=false}]
        [{/if}]
    [{/oxhasrights}]
[{/block}]

[{block name="details_tabs_attributes"}]
    [{if $oView->getAttributes()}]
        [{capture append="tabs"}]<a href="#attributes" data-toggle="tab">[{oxmultilang ident="SPECIFICATION"}]</a>[{/capture}]
        [{capture append="tabsContent"}]
            <div id="attributes" class="tab-pane[{if $blFirstTab}] active[{/if}]">[{include file="page/details/inc/attributes.tpl"}]</div>
            [{assign var="blFirstTab" value=false}]
        [{/capture}]
    [{/if}]
[{/block}]

[{if $oViewConf->getViewThemeParam('bl_showPriceAlarm')}]
    [{block name="details_tabs_pricealarm"}]
        [{if $oView->isPriceAlarm() && !$oDetailsProduct->isParentNotBuyable()}]
            [{capture append="tabs"}]<a href="#pricealarm" data-toggle="tab">[{oxmultilang ident="PRICE_ALERT"}]</a>[{/capture}]
            [{capture append="tabsContent"}]
                <div id="pricealarm" class="tab-pane[{if $blFirstTab}] active[{/if}]">[{include file="form/pricealarm.tpl"}]</div>
                [{assign var="blFirstTab" value=false}]
            [{/capture}]
        [{/if}]
    [{/block}]
[{/if}]

[{block name="details_tabs_tags"}]
[{/block}]

[{block name="details_tabs_media"}]
    [{if $oView->getMediaFiles() || $oDetailsProduct->oxarticles__oxfile->value}]
        [{capture append="tabs"}]<a href="#media" data-toggle="tab">[{oxmultilang ident="MEDIA"}]</a>[{/capture}]
        [{capture append="tabsContent"}]
            <div id="media" class="tab-pane[{if $blFirstTab}] active[{/if}]">[{include file="page/details/inc/media.tpl"}]</div>
            [{assign var="blFirstTab" value=false}]
        [{/capture}]
    [{/if}]
[{/block}]

[{block name="details_tabs_comments"}]
[{/block}]

[{block name="details_tabs_invite"}]
[{/block}]

[{block name="details_tabs_main"}]
    [{if $tabs}]
        <div class="tabbedWidgetBox clear">
            <ul id="itemTabs" class="nav nav-tabs">
                [{foreach from=$tabs item="tab" name="tabs"}]
                    <li[{if $smarty.foreach.tabs.first}] class="active"[{/if}]>[{$tab}]</li>
                [{/foreach}]
                [{block name="details_tabs_social_navigation"}][{/block}]
            </ul>
            <div class="tab-content">
                [{foreach from=$tabsContent item="tabContent" name="tabsContent"}]
                    [{$tabContent}]
                [{/foreach}]
                [{block name="details_tabs_social_content"}][{/block}]
            </div>
        </div>
    [{/if}]
[{/block}]

