[{block name="account_delete_my_account_confirmation"}]
    <div
        class="modal fade"
        id="delete_my_account_confirmation"
        tabindex="-1"
        role="dialog"
        aria-labelledby="delete_my_account_modal_label"
        aria-hidden="true"
    >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    [{block name="account_delete_my_account_confirmation_header_message"}]
                        <span class="h4 modal-title">[{oxmultilang ident="DD_DELETE_MY_ACCOUNT_CONFIRMATION_QUESTION"}]</span>
                    [{/block}]
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            [{block name="account_delete_my_account_confirmation_warning_message"}]
                                <div class="alert alert-danger">
                                    [{oxmultilang ident="DD_DELETE_MY_ACCOUNT_WARNING"}]
                                </div>
                            [{/block}]
                            [{block name="account_delete_my_account_confirmation_form"}]
                                <form name="delete_my_account" action="[{$oViewConf->getSelfActionLink()}]"
                                      method="post" role="form">
                                    <div class="hidden">
                                        [{$oViewConf->getHiddenSid()}]
                                        <input type="hidden" name="cl" value="account">
                                        <input type="hidden" name="fnc" value="deleteAccount">
                                    </div>
                                    [{block name="account_delete_my_account_confirmation_form_button_set"}]
                                        <button type="submit" class="btn btn-danger">
                                            [{oxmultilang ident="DD_DELETE_MY_ACCOUNT"}]
                                        </button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">
                                            [{oxmultilang ident="DD_DELETE_MY_ACCOUNT_CANCEL"}]
                                        </button>
                                    [{/block}]
                                </form>
                            [{/block}]
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
[{/block}]
