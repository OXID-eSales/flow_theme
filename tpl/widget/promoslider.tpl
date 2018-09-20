[{block name="dd_widget_promoslider"}]
    [{assign var="oBanners" value=$oView->getBanners()}]
    [{assign var="currency" value=$oView->getActCurrency()}]
    [{assign var="blFullwidth" value=$oViewConf->getViewThemeParam('blFullwidthLayout')}]

    [{if $oBanners|@count}]
        [{oxscript include="js/libs/jquery.flexslider.min.js" priority=2}]
        [{oxstyle include="css/libs/jquery.flexslider.min.css"}]

        [{if $blFullwidth}]
            <div class="col-xs-12">
        [{/if}]

        <div id="promo-carousel" class="flexslider">
            <ul class="slides">
                [{block name="dd_widget_promoslider_list"}]
                    [{foreach from=$oBanners key="iPicNr" item="oBanner" name="promoslider"}]
                        [{assign var="oArticle" value=$oBanner->getBannerArticle()}]
                        [{assign var="sBannerPictureUrl" value=$oBanner->getBannerPictureUrl()}]
                        [{if $sBannerPictureUrl}]
                            <li class="item">
                                [{assign var="sBannerLink" value=$oBanner->getBannerLink()}]
                                [{if $sBannerLink}]
                                    <a href="[{$sBannerLink}]" title="[{$oBanner->oxactions__oxtitle->value}]">
                                [{/if}]

                                <img src="[{$sBannerPictureUrl}]" alt="[{$oBanner->oxactions__oxtitle->value}]" title="[{$oBanner->oxactions__oxtitle->value}]">

                                [{if $sBannerLink}]
                                    </a>
                                [{/if}]
                                [{if $oViewConf->getViewThemeParam('blSliderShowImageCaption') && $oArticle}]
                                    <p class="flex-caption">
                                        [{if $sBannerLink}]
                                            <a href="[{$sBannerLink}]" title="[{$oBanner->oxactions__oxtitle->value}]">
                                        [{/if}]
                                        <span class="title">[{$oArticle->oxarticles__oxtitle->value}]</span>[{if $oArticle->oxarticles__oxshortdesc->value|trim}]<br/><span class="shortdesc">[{$oArticle->oxarticles__oxshortdesc->value|trim}]</span>[{/if}]
                                        [{if $sBannerLink}]
                                            </a>
                                        [{/if}]
                                    </p>
                                [{/if}]
                            </li>
                        [{/if}]
                    [{/foreach}]
                [{/block}]
            </ul>
        </div>

        [{if $blFullwidth}]
            </div>
        [{/if}]
    [{/if}]
[{/block}]
