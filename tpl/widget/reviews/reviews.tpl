[{oxscript include="js/libs/jqBootstrapValidation.min.js" priority=10}]
[{oxscript add="$('input,select,textarea').not('[type=submit]').jqBootstrapValidation();"}]
<div id="review">
    <div class="panel-group" id="review_form_accordion">
        <div class="panel panel-default">
            <div class="panel-heading toggle-accordion">
                <div class="h4 panel-title">
                    [{if $oxcmp_user}]
                        <i class="fa fa-pencil"></i> <a id="writeNewReview" data-toggle="collapse" data-parent="#review_form_accordion" href="#review_form">[{oxmultilang ident="WRITE_REVIEW"}]</a>
                    [{else}]
                        <i class="fa fa-user"></i> <a id="reviewsLogin" rel="nofollow" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" params="anid=`$oDetailsProduct->oxarticles__oxnid->value`"|cat:"&amp;sourcecl=details"|cat:$oViewConf->getNavUrlParams()}]">[{oxmultilang ident="MESSAGE_LOGIN_TO_WRITE_REVIEW"}]</a>
                    [{/if}]
                </div>
            </div>

            [{if $oxcmp_user}]
                <div id="review_form" class="panel-collapse collapse">
                    <div class="panel-body">
                        [{block name="widget_reviews_form"}]
                            <form action="[{$oViewConf->getSelfActionLink()}]" method="post" id="rating" class="form-horizontal" novalidate="novalidate">
                                <div id="writeReview">
                                    <div class="hidden">
                                        [{if $oView->canRate()}]
                                            <input id="productRating" type="hidden" name="artrating" value="0">
                                            <input id="recommListRating" type="hidden" name="recommlistrating" value="0">
                                        [{/if}]
                                        [{$oViewConf->getHiddenSid()}]
                                        [{$oViewConf->getNavFormParams()}]
                                        [{oxid_include_dynamic file="form/formparams.tpl"}]
                                        <input type="hidden" name="fnc" value="savereview">
                                        <input type="hidden" name="cl" value="[{$oViewConf->getTopActiveClassName()}]">
                                        [{if $oDetailsProduct}]
                                            <input type="hidden" name="anid" value="[{$oDetailsProduct->oxarticles__oxid->value}]">
                                        [{else}]
                                            [{assign var="_actvrecommlist" value=$oView->getActiveRecommList()}]
                                            <input type="hidden" name="recommid" value="[{$_actvrecommlist->oxrecommlists__oxid->value}]">
                                        [{/if}]

                                        [{if $sReviewUserHash}]
                                            <input type="hidden" name="reviewuserhash" value="[{$sReviewUserHash}]">
                                        [{/if}]
                                    </div>

                                    [{block name="widget_reviews_form_rating"}]
                                        [{if $oView->canRate()}]
                                            <ul id="reviewRating" class="rating list-inline">
                                                [{section name=star start=1 loop=6}]
                                                    <li class="s[{$smarty.section.star.index}]" data-rate-value="[{$smarty.section.star.index}]">
                                                        <a class="ox-write-review ox-rateindex-[{$smarty.section.star.index}] text-warning" title="[{$smarty.section.star.index}] [{if $smarty.section.star.index==1}][{oxmultilang ident="STAR"}][{else}][{oxmultilang ident="STARS"}][{/if}]">
                                                            <i class="fa fa-star-o"></i>
                                                        </a>
                                                    </li>
                                                [{/section}]
                                            </ul>
                                        [{/if}]
                                    [{/block}]

                                    [{block name="widget_reviews_form_fields"}]
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <textarea  rows="15" name="rvw_txt" class="form-control"></textarea>
                                            </div>
                                        </div>
                                    [{/block}]

                                    [{block name="widget_reviews_form_buttons"}]
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <button id="reviewSave" type="submit" class="submitButton btn btn-primary">[{oxmultilang ident="SAVE_RATING_AND_REVIEW"}]</button>
                                            </div>
                                        </div>
                                    [{/block}]
                                </div>
                            </form>
                        [{/block}]
                    </div>
                </div>
            [{/if}]
        </div>
    </div>

    [{if $oView->getReviews()}]
        <div class="spacer"></div>
        <div class="reviews-landscape">
            [{foreach from=$oView->getReviews() item=review name=ReviewsCounter}]
                <div class="panel panel-default" id="reviewName_[{$smarty.foreach.ReviewsCounter.iteration}]" itemprop="review" itemscope itemtype="http://schema.org/Review">
                    [{* Bloofusion Google-Produkt-Markup für Google *}]
                    <div class="hidden">
                        <span itemprop="itemreviewed">[{$oDetailsProduct->oxarticles__oxtitle->value}] [{$oDetailsProduct->oxarticles__oxvarselect->value}]</span>
                        <span itemprop="name">[{$review->oxreviews__oxtext->value|truncate:100}]</span>
                    </div>
                    [{block name="widget_reviews_record"}]
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-md-6 writer">
                                    <span itemprop="author">[{$review->oxuser__oxfname->value}]</span> [{oxmultilang ident="WRITES"}]
                                    <span>
                                        <time itemprop="datePublished" datetime="[{$review->oxreviews__oxcreate->value|date_format:"%Y-%m-%d"}]">[{$review->oxreviews__oxcreate->value|date_format:"%d.%m.%Y"}]</time>
                                    </span>
                                </div>
                                <div class="col-md-6 rating">
                                    [{if $review->oxreviews__oxrating->value}]
                                        <div class="pull-right text-warning" itemprop="reviewRating" itemscope itemtype="http://schema.org/Rating">
                                            [{section name="starRatings" start=0 loop=5}]
                                                [{if $review->oxreviews__oxrating->value >= $smarty.section.starRatings.iteration}]
                                                    <i class="fa fa-star"></i>
                                                [{else}]
                                                    <i class="fa fa-star-o"></i>
                                                [{/if}]
                                            [{/section}]
                                            <div class="hidden">
                                                <span itemprop="worstRating">1</span>
                                                <span itemprop="ratingValue">[{$review->oxreviews__oxrating->value|default:'0'}]</span>
                                                <span itemprop="bestRating">5</span>
                                            </div>
                                        </div>
                                    [{/if}]
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body" id="reviewText_[{$smarty.foreach.ReviewsCounter.iteration}]" itemprop="description">[{$review->oxreviews__oxtext->value}]</div>
                    [{/block}]
                </div>
            [{/foreach}]
        </div>
    [{else}]
        <div class="alert alert-info">
            [{oxmultilang ident="NO_REVIEW_AVAILABLE"}]
        </div>
    [{/if}]

</div>