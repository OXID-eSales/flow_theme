<div>
    [{assign var="iRatingValue" value=$oView->getRatingValue()}]

    [{if $iRatingValue}][{strip}]
    <div class="hidden" itemtype="http://schema.org/AggregateRating" itemscope="" itemprop="aggregateRating">
        <span itemprop="worstRating">1</span>
        <span itemprop="bestRating ">5</span>
        <span itemprop="ratingValue">[{$iRatingValue}]</span>
        <span itemprop="reviewCount">[{$oView->getRatingCount()}]</span>
    </div>
    [{/strip}][{/if}]

    [{if !$oxcmp_user}]
        [{assign var="_star_title" value="MESSAGE_LOGIN_TO_RATE"|oxmultilangassign}]
    [{elseif !$oView->canRate()}]
        [{assign var="_star_title" value="MESSAGE_ALREADY_RATED"|oxmultilangassign}]
    [{else}]
        [{assign var="_star_title" value="MESSAGE_RATE_THIS_ARTICLE"|oxmultilangassign}]
    [{/if}]


    [{section name="starRatings" start=0 loop=5}]
        [{if $iRatingValue == 0}]
            <i class="fa fa-star rating-star-empty"></i>
        [{else}]
            [{if $iRatingValue > 1}]
                <i class="fa fa-star rating-star-filled"></i>
                [{assign var="iRatingValue" value=$iRatingValue-1}]
            [{else}]
                [{if $iRatingValue < 0.5}]
                    [{if $iRatingValue < 0.3}]
                        <i class="fa fa-star rating-star-empty"></i>
                    [{else}]
                        <i class="fa fa-star-half-o rating-star-filled"></i>
                    [{/if}]
                    [{assign var="iRatingValue" value=0}]
                [{elseif $iRatingValue > 0.8}]
                    <i class="fa fa-star rating-star-filled"></i>
                    [{assign var="iRatingValue" value=0}]
                [{else}]
                    <i class="fa fa-star-half-o rating-star-filled"></i>
                    [{assign var="iRatingValue" value=0}]
                [{/if}]
            [{/if}]
        [{/if}]
    [{/section}]

    <a class="[{if $oView->canRate()}]ox-write-review[{/if}]"
        [{if !$oxcmp_user}]
            href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" params="anid=`$oDetailsProduct->oxarticles__oxnid->value`"|cat:"&amp;sourcecl="|cat:$oViewConf->getTopActiveClassName()|cat:$oViewConf->getNavUrlParams()}]"
        [{elseif $oView->canRate()}]
            href="#review" data-toggle="collapse" data-target="#review_form"
        [{/if}]
       title="[{$_star_title}]">
        <small>([{$oView->getRatingCount()}] [{oxmultilang ident="DD_RATING_CUSTOMERRATINGS"}])</small>
    </a>
</div>