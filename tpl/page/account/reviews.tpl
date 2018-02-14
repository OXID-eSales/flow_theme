[{capture append="oxidBlock_content"}]

    [{oxscript include="js/widgets/oxlistremovebutton.min.js" priority=10}]

    [{block name="account_reviewlist_header"}]
        [{assign var="template_title" value="MY_REVIEWS"|oxmultilangassign}]
        <h1 class="page-header">[{oxmultilang ident="MY_REVIEWS"}]</h1>
    [{/block}]

    [{block name="account_reviewlist_list"}]
        <div id="review">
            [{if $oView->getReviewAndRatingItemsCount() }]
                <div class="spacer"></div>
                <div class="reviews-landscape">
                    [{foreach from=$oView->getReviewList() item=review name=ReviewsCounter}]
                        [{block name="account_reviewlist_item"}]
                            <div class="panel panel-default" id="reviewName_[{$smarty.foreach.ReviewsCounter.iteration}]" itemprop="review" itemscope itemtype="http://schema.org/Review">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-md-3 date">
                                            <span>
                                                <time itemprop="datePublished" datetime="[{$review->getCreatedAt()|date_format:"%Y-%m-%d"}]">[{$review->getCreatedAt()|date_format:"%d.%m.%Y"}]</time>
                                            </span>
                                        </div>
                                        <div class="col-md-5 articleTitle">
                                            <span itemprop="itemreviewed">[{$review->getObjectTitle()|truncate:60}]</span>
                                        </div>
                                        <div class="col-md-3 rating text-right">
                                            [{if $review->getRating()}]
                                                <div itemprop="reviewRating" itemscope itemtype="http://schema.org/Rating">
                                                    [{section name="starRatings" start=0 loop=5}]
                                                        [{if $review->getRating() >= $smarty.section.starRatings.iteration}]
                                                            <i class="fa fa-star"></i>
                                                        [{else}]
                                                            <i class="fa fa-star-o"></i>
                                                        [{/if}]
                                                    [{/section}]
                                                </div>
                                            [{/if}]
                                        </div>
                                        [{block name="account_reviewlist_item_action"}]
                                            <div class="col-md-1 pull-right">
                                                <div class="actions text-center">
                                                    <div class="btn-group">
                                                        <button
                                                                type="submit"
                                                                class="btn btn-danger btn-block hasTooltip"
                                                                title="[{oxmultilang ident="DD_DELETE_REVIEW_AND_RATING"}]"
                                                                data-toggle="modal"
                                                                data-target="#delete_review_[{$smarty.foreach.ReviewsCounter.iteration}]"
                                                        >
                                                            <i class="fa fa-trash"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        [{/block}]
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                [{if $review->getReviewText()}]
                                    <div class="panel-body" id="reviewText_[{$smarty.foreach.ReviewsCounter.iteration}]" itemprop="description">[{$review->getReviewText()}]</div>
                                [{/if}]
                            </div>
                        [{/block}]
                        [{include
                            file="page/account/delete_review_confirmation.tpl"
                            reviewId=$review->getReviewId()
                            ratingId=$review->getRatingId()
                            reviewCounterIteration=$smarty.foreach.ReviewsCounter.iteration
                        }]
                    [{/foreach}]
                </div>
            [{else}]
                [{block name="account_reviewlist_no_reviews_available"}]
                    <div class="alert alert-info">
                        [{oxmultilang ident="DD_REVIEWS_NOT_AVAILABLE"}]
                    </div>
                [{/block}]
            [{/if}]
        </div>
    [{/block}]

    [{block name="account_reviewlist_locator"}]
        [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigation() place="bottom"}]
    [{/block}]

    [{insert name="oxid_tracker" title=$template_title}]

[{/capture}]
[{capture append="oxidBlock_sidebar"}]
    [{include file="page/account/inc/account_menu.tpl" active_link="reviewlist"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]
