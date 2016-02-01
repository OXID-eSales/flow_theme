[{if $oView->isLanguageLoaded()}]
    <div class="btn-group languages-menu">
        <button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
            [{assign var="sLangImg" value="lang/"|cat:$oViewConf->getActLanguageAbbr()|cat:".png"}]
            [{block name="dd_layout_page_header_icon_menu_languages_button"}]
                <img src="[{$oViewConf->getImageUrl($sLangImg)}]" alt=""/> <i class="fa fa-angle-down"></i>
            [{/block}]
        </button>
        <ul class="dropdown-menu dropdown-menu-right" role="menu">
            [{block name="dd_layout_page_header_icon_menu_languages_list"}]
                [{foreach from=$oxcmp_lang item=_lng}]
                    [{assign var="sLangImg" value="lang/"|cat:$_lng->abbr|cat:".png"}]
                    [{if $_lng->selected}]
                        [{capture name="languageSelected"}]
                            <a class="flag [{$_lng->abbr}]" title="[{$_lng->name}]" href="[{$_lng->link|oxaddparams:$oView->getDynUrlParams()}]" hreflang="[{$_lng->abbr}]"><span style="background-image:url('[{$oViewConf->getImageUrl($sLangImg)}]')" >[{$_lng->name}]</span></a>
                        [{/capture}]
                    [{/if}]
                    <li[{if $_lng->selected}] class="active"[{/if}]>
                        <a class="flag [{$_lng->abbr}]" title="[{$_lng->name}]" href="[{$_lng->link|oxaddparams:$oView->getDynUrlParams()}]" hreflang="[{$_lng->abbr}]">
                            <img src="[{$oViewConf->getImageUrl($sLangImg)}]" alt=""/> [{$_lng->name}]
                        </a>
                    </li>
                [{/foreach}]
            [{/block}]
        </ul>
    </div>
[{/if}]