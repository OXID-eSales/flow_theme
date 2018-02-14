[{block name="delete_review_confirmation_modal"}]
    <div class="modal fade"
         id="delete_review_[{$reviewCounterIteration}]"
         tabindex="-1"
         role="dialog"
    >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    [{block name="delete_review_confirmation_modal_header"}]
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <span class="h4 modal-title">[{oxmultilang ident="DD_DELETE_REVIEW_CONFIRMATION_QUESTION"}]</span>
                    [{/block}]
                </div>
                <div class="modal-body">
                    [{block name="delete_review_confirmation_modal_body"}]
                        <div class="row">
                            <div class="col-md-12">
                                [{block name="delete_review_confirmation_modal_form"}]
                                    <form
                                        action="[{$oViewConf->getSslSelfLink()}]"
                                        method="post"
                                        id="remove_review_[{$reviewCounterIteration}]"
                                    >
                                        [{$oViewConf->getNavFormParams()}]
                                        [{$oViewConf->getHiddenSid()}]
                                        <input name="pgNr" value="[{$oView->getActPage()}]"  type="hidden">
                                        <input name="cl" value="account_reviewlist" type="hidden">
                                        <input name="fnc" value="deleteReviewAndRating" type="hidden">
                                        <input name="reviewId" value="[{$reviewId}]" type="hidden">
                                        <input name="ratingId" value="[{$ratingId}]" type="hidden">
                                        [{block name="delete_review_confirmation_modal_buttons_set"}]
                                            <div class="text-right">
                                                <button type="submit" class="btn btn-danger">
                                                    [{oxmultilang ident="DD_DELETE"}]
                                                </button>
                                                <button type="button" class="btn btn-default" data-dismiss="modal">
                                                    [{oxmultilang ident="CANCEL"}]
                                                </button>
                                            </div>
                                        [{/block}]
                                    </form>
                                [{/block}]
                            </div>
                        </div>
                    [{/block}]
                </div>
            </div>
        </div>
    </div>
[{/block}]
