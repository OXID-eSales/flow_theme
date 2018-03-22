[{* Important ! render page head and body to collect scripts and styles *}]
[{capture append="oxidBlock_pageHead"}]
    [{strip}]
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" id="Viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
        <meta http-equiv="Content-Type" content="text/html; charset=[{$oView->getCharSet()}]">

        [{assign var=sPageTitle value=$oView->getPageTitle()}]
        <title>[{block name="head_title"}][{$sPageTitle}][{/block}]</title>

        [{block name="head_meta_robots"}]
            [{if $oView->noIndex() == 1}]
                <meta name="ROBOTS" content="NOINDEX, NOFOLLOW">
            [{elseif $oView->noIndex() == 2}]
                <meta name="ROBOTS" content="NOINDEX, FOLLOW">
            [{/if}]
        [{/block}]

        [{block name="head_meta_description"}]
            [{if $oView->getMetaDescription()}]
                <meta name="description" content="[{$oView->getMetaDescription()}]">
            [{/if}]
        [{/block}]

        [{block name="head_meta_keywords"}]
            [{if $oView->getMetaKeywords()}]
                <meta name="keywords" content="[{$oView->getMetaKeywords()}]">
            [{/if}]
        [{/block}]

        [{block name="head_meta_open_graph"}]
            <meta property="og:site_name" content="[{$oViewConf->getBaseDir()}]">
            <meta property="og:title" content="[{$sPageTitle}]">
            <meta property="og:description" content="[{$oView->getMetaDescription()}]">
            [{if $oViewConf->getActiveClassName() == 'details'}]
                <meta property="og:type" content="product">
                <meta property="og:image" content="[{$oView->getActPicture()}]">
                <meta property="og:url" content="[{$oView->getCanonicalUrl()}]">
            [{else}]
                <meta property="og:type" content="website">
                <meta property="og:image" content="[{$oViewConf->getImageUrl('basket.png')}]">
                <meta property="og:url" content="[{$oViewConf->getCurrentHomeDir()}]">
            [{/if}]
        [{/block}]

        [{assign var="canonical_url" value=$oView->getCanonicalUrl()}]
        [{block name="head_link_canonical"}]
            [{if $canonical_url}]
                <link rel="canonical" href="[{$canonical_url}]">
            [{/if}]
        [{/block}]

        [{block name="head_link_hreflang"}]
            [{if $oView->isLanguageLoaded()}]
                [{assign var="oConfig" value=$oViewConf->getConfig()}]
                [{foreach from=$oxcmp_lang item=_lng}]
                    [{if $_lng->id == $oConfig->getConfigParam('sDefaultLang')}]
                        <link rel="alternate" hreflang="x-default" href="[{$_lng->link}]"/>
                    [{/if}]
                    <link rel="alternate" hreflang="[{$_lng->abbr}]" href="[{$_lng->link|oxaddparams:$oView->getDynUrlParams()}]"/>
                [{/foreach}]
            [{/if}]
        [{/block}]

        [{assign var="oPageNavigation" value=$oView->getPageNavigation()}]
        [{if $oPageNavigation}]
            [{if $oPageNavigation->previousPage}]
                <link rel="prev" href="[{$oPageNavigation->previousPage}]">
            [{/if}]
            [{if $oPageNavigation->nextPage}]
                <link rel="next" href="[{$oPageNavigation->nextPage}]">
            [{/if}]
        [{/if}]

        [{block name="head_link_favicon"}]
            [{assign var="sFavicon512File" value=$oViewConf->getViewThemeParam('sFavicon512File')}]
            [{if $sFavicon512File}]
                <!-- iOS Homescreen Icon (version < 4.2)-->
                <link rel="apple-touch-icon-precomposed" media="screen and (resolution: 163dpi)" href="[{$oViewConf->getImageUrl("favicons/`$sFavicon512File`")}]" />
                <!-- iOS Homescreen Icon -->
                <link rel="apple-touch-icon-precomposed" href="[{$oViewConf->getImageUrl("favicons/`$sFavicon512File`")}]" />

                <!-- iPad Homescreen Icon (version < 4.2) -->
                <link rel="apple-touch-icon-precomposed" media="screen and (resolution: 132dpi)" href="[{$oViewConf->getImageUrl("favicons/`$sFavicon512File`")}]" />
                <!-- iPad Homescreen Icon -->
                <link rel="apple-touch-icon-precomposed" sizes="72x72" href="[{$oViewConf->getImageUrl("favicons/`$sFavicon512File`")}]" />

                <!-- iPhone 4 Homescreen Icon (version < 4.2) -->
                <link rel="apple-touch-icon-precomposed" media="screen and (resolution: 326dpi)" href="[{$oViewConf->getImageUrl("favicons/`$sFavicon512File`")}]" />
                <!-- iPhone 4 Homescreen Icon -->
                <link rel="apple-touch-icon-precomposed" sizes="114x114" href="[{$oViewConf->getImageUrl("favicons/`$sFavicon512File`")}]" />

                <!-- new iPad Homescreen Icon and iOS Version > 4.2 -->
                <link rel="apple-touch-icon-precomposed" sizes="144x144" href="[{$oViewConf->getImageUrl("favicons/`$sFavicon512File`")}]" />

                <!-- Windows 8 -->
                [{assign var="sFaviconMSTileColor" value=$oViewConf->getViewThemeParam('sFaviconMSTileColor')}]
                [{if $sFaviconMSTileColor}]
                    <meta name="msapplication-TileColor" content="[{$sFaviconMSTileColor}]"> <!-- Kachel-Farbe -->
                [{/if}]
                <meta name="msapplication-TileImage" content="[{$oViewConf->getImageUrl("favicons/`$sFavicon512File`")}]">

                <!-- Fluid -->
                <link rel="fluid-icon" href="[{$oViewConf->getImageUrl("favicons/`$sFavicon512File`")}]" title="[{$sPageTitle}]" />
            [{/if}]

            <!-- Shortcut Icons -->
            [{assign var="sFaviconFile"    value=$oViewConf->getViewThemeParam('sFaviconFile')}]
            [{assign var="sFavicon16File"  value=$oViewConf->getViewThemeParam('sFavicon16File')}]
            [{assign var="sFavicon32File"  value=$oViewConf->getViewThemeParam('sFavicon32File')}]
            [{assign var="sFavicon48File"  value=$oViewConf->getViewThemeParam('sFavicon48File')}]
            [{assign var="sFavicon64File"  value=$oViewConf->getViewThemeParam('sFavicon64File')}]
            [{assign var="sFavicon128File" value=$oViewConf->getViewThemeParam('sFavicon128File')}]

            [{if $sFaviconFile}]
                <link rel="shortcut icon" href="[{$oViewConf->getImageUrl("favicons/`$sFaviconFile`")}]?rand=1" type="image/x-icon" />
            [{/if}]
            [{if $sFavicon16File}]
                <link rel="icon" href="[{$oViewConf->getImageUrl("favicons/`$sFavicon16File`")}]" sizes="16x16" />
            [{/if}]
            [{if $sFavicon32File}]
                <link rel="icon" href="[{$oViewConf->getImageUrl("favicons/`$sFavicon32File`")}]" sizes="32x32" />
            [{/if}]
            [{if $sFavicon48File}]
                <link rel="icon" href="[{$oViewConf->getImageUrl("favicons/`$sFavicon48File`")}]" sizes="48x48" />
            [{/if}]
            [{if $sFavicon64File}]
                <link rel="icon" href="[{$oViewConf->getImageUrl("favicons/`$sFavicon64File`")}]" sizes="64x64" />
            [{/if}]
            [{if $sFavicon128File}]
                <link rel="icon" href="[{$oViewConf->getImageUrl("favicons/`$sFavicon128File`")}]" sizes="128x128" />
            [{/if}]
        [{/block}]

        [{block name="base_style"}]
            [{oxstyle include="css/styles.min.css"}]
        [{/block}]

        [{block name="base_fonts"}]
            <link href='https://fonts.googleapis.com/css?family=Raleway:200,400,700,600' rel='stylesheet' type='text/css'>
        [{/block}]

        [{assign var='rsslinks' value=$oView->getRssLinks()}]
        [{block name="head_link_rss"}]
            [{if $rsslinks}]
                [{foreach from=$rsslinks item='rssentry'}]
                    <link rel="alternate" type="application/rss+xml" title="[{$rssentry.title|strip_tags}]" href="[{$rssentry.link}]">
                [{/foreach}]
            [{/if}]
        [{/block}]

        [{block name="head_css"}]
            [{foreach from=$oxidBlock_head item="_block"}]
                [{$_block}]
            [{/foreach}]
        [{/block}]
    [{/strip}]
[{/capture}]

[{assign var="blIsCheckout"     value=$oView->getIsOrderStep()}]
[{assign var="blFullwidth"      value=$oViewConf->getViewThemeParam('blFullwidthLayout')}]
[{assign var="sBackgroundColor" value=$oViewConf->getViewThemeParam('sBackgroundColor')}]

[{* Fullpage Background *}]
[{if $oViewConf->getViewThemeParam('blUseBackground')}]
    [{assign var="sBackgroundPath"          value=$oViewConf->getViewThemeParam('sBackgroundPath')}]
    [{assign var="sBackgroundUrl"           value=$oViewConf->getImageUrl("backgrounds/`$sBackgroundPath`")}]
    [{assign var="sBackgroundRepeat"        value=$oViewConf->getViewThemeParam('sBackgroundRepeat')}]
    [{assign var="sBackgroundPosHorizontal" value=$oViewConf->getViewThemeParam('sBackgroundPosHorizontal')}]
    [{assign var="sBackgroundPosVertical"   value=$oViewConf->getViewThemeParam('sBackgroundPosVertical')}]
    [{assign var="sBackgroundSize"          value=$oViewConf->getViewThemeParam('sBackgroundSize')}]
    [{assign var="blBackgroundAttachment"   value=$oViewConf->getViewThemeParam('blBackgroundAttachment')}]

    [{if $sBackgroundUrl}]
        [{assign var="sStyle" value="background:`$sBackgroundColor` url(`$sBackgroundUrl`) `$sBackgroundRepeat` `$sBackgroundPosHorizontal` `$sBackgroundPosVertical`;"}]

        [{if $sBackgroundSize}]
            [{assign var="sStyle" value=$sStyle|cat:"background-size:`$sBackgroundSize`;"}]
        [{/if}]

        [{if $blBackgroundAttachment}]
            [{assign var="sStyle" value=$sStyle|cat:"background-attachment:fixed;"}]
        [{/if}]
    [{else}]
        [{assign var="sStyle" value="background:`$sBackgroundColor`;"}]
    [{/if}]
[{elseif $sBackgroundColor}]
    [{assign var="sStyle" value="background:`$sBackgroundColor`;"}]
[{/if}]

<!DOCTYPE html>
<html lang="[{$oView->getActiveLangAbbr()}]" [{block name="head_html_namespace"}][{/block}]>
    <head>
        [{foreach from=$oxidBlock_pageHead item="_block"}]
            [{$_block}]
        [{/foreach}]
        [{oxstyle}]

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="cl-[{$oView->getClassName()}][{if $smarty.get.plain == '1'}] popup[{/if}][{if $blIsCheckout}] is-checkout[{/if}][{if $oxcmp_user && $oxcmp_user->oxuser__oxpassword->value}] is-logged-in[{/if}]"[{if $sStyle}] style="[{$sStyle}]"[{/if}]>

    [{* Theme SVG icons block *}]
    [{block name="theme_svg_icons"}][{/block}]

    <div class="[{if $blFullwidth}]fullwidth-container[{else}]container[{/if}]">
            <div class="main-row">
                [{foreach from=$oxidBlock_pageBody item="_block"}]
                    [{$_block}]
                [{/foreach}]
            </div>
        </div>

        [{foreach from=$oxidBlock_pagePopup item="_block"}]
            [{$_block}]
        [{/foreach}]

        [{if $oViewConf->getTopActiveClassName() == 'details' && $oView->showZoomPics()}]
            [{include file="page/details/inc/photoswipe.tpl"}]
        [{/if}]

        [{block name="base_js"}]
            [{include file="i18n/js_vars.tpl"}]

            [{oxscript include="js/libs/jquery.min.js" priority=1}]
            [{oxscript include="js/libs/jquery-ui.min.js" priority=1}]
            [{oxscript include="js/scripts.min.js" priority=1}]
        [{/block}]

        [{if $oViewConf->isTplBlocksDebugMode()}]
            [{oxscript include="js/widgets/oxblockdebug.min.js"}]
            [{oxscript add="$( 'body' ).oxBlockDebug();"}]
        [{/if}]

        <!--[if gte IE 9]><style type="text/css">.gradient {filter:none;}</style><![endif]-->
        [{oxscript}]

        [{if !$oView->isDemoShop()}]
            [{oxid_include_dynamic file="widget/dynscript.tpl"}]
        [{/if}]

        [{foreach from=$oxidBlock_pageScript item="_block"}]
            [{$_block}]
        [{/foreach}]

    </body>
</html>
