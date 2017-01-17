[{capture append="oxidBlock_pageBody"}]
    [{oxid_include_widget cl="oxwCookieNote" _parent=$oView->getClassName() nocookie=1}]
[{/capture}]
[{capture append="oxidBlock_content"}]
    <div class="accountLoginView" style="margin-top: 25px;">

        [{block name="dd_layout_page_header_logo"}]
            [{assign var="slogoImg" value=$oViewConf->getViewThemeParam('sLogoFile')}]
            [{assign var="sLogoWidth" value=$oViewConf->getViewThemeParam('sLogoWidth')}]
            [{assign var="sLogoHeight" value=$oViewConf->getViewThemeParam('sLogoHeight')}]
            <a href="[{$oViewConf->getHomeLink()}]" title="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]">
                <img src="[{$oViewConf->getImageUrl($slogoImg)}]" alt="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]" style="[{if $sLogoWidth}]width:auto;max-width:[{$sLogoWidth}]px;[{/if}][{if $sLogoHeight}]height:auto;max-height:[{$sLogoHeight}]px;[{/if}]">
            </a>
        [{/block}]

        <h1 id="loginAccount" class="page-header">[{$oView->getTitle()}]</h1>
        [{if $oView->confirmTerms()}]
            [{include file="form/privatesales/accept_terms.tpl"}]
        [{else}]
            [{include file="widget/header/languages.tpl"}]
            [{include file="message/errors.tpl"}]
            [{include file="form/login_account.tpl"}]
        [{/if}]
    </div>
[{/capture}]
[{include file="layout/popup.tpl"}]