[{assign var="_oProduct" value=$oView->getProduct()}]
[{assign var="editval" value=$oView->getSuggestData()}]
[{oxscript include="js/libs/jqBootstrapValidation.min.js" priority=10}]
[{oxscript add="$('input,select,textarea').not('[type=submit]').jqBootstrapValidation();"}]

<form class="form-horizontal" action="[{$oViewConf->getSslSelfLink()}]" method="post" novalidate="novalidate">
    <div class="hidden">
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="fnc" value="send">
        <input type="hidden" name="cl" value="suggest">
        <input type="hidden" name="anid" value="[{$_oProduct->oxarticles__oxnid->value}]">
        <input type="hidden" name="CustomError" value='suggest'>
    </div>

    <h3 class="page-header">[{oxmultilang ident="CARD_TO" suffix="COLON"}]</h3>
    <div class="form-group">
        <label class="control-label col-lg-3 req">[{oxmultilang ident="RECIPIENT_NAME" suffix="COLON"}]</label>
        <div class="col-lg-9">
            <input class="form-control" type="text" name="editval[rec_name]" size="73" maxlength="73" value="[{$editval->rec_name}]" required="required">
            <div class="help-block"></div>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-lg-3 req">[{oxmultilang ident="RECIPIENT_EMAIL" suffix="COLON"}]</label>
        <div class="col-lg-9">
            <input class="form-control" type="email" name="editval[rec_email]" size="73" maxlength="73" value="[{$editval->rec_email}]" required="required">
            <div class="help-block"></div>
        </div>
    </div>

    <h3 class="page-header">[{oxmultilang ident="FROM" suffix="COLON"}]</h3>
    <div class="form-group">
        <label class="control-label col-lg-3 req">[{oxmultilang ident="SENDER_NAME" suffix="COLON"}]</label>
        <div class="col-lg-9">
            <input class="form-control" type="text" name="editval[send_name]" size=73 maxlength=73 value="[{$editval->send_name}]" required="required">
            <div class="help-block"></div>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-lg-3 req">[{oxmultilang ident="SENDER_EMAIL" suffix="COLON"}]</label>
        <div class="col-lg-9">
            <input class="form-control" type="email" name="editval[send_email]" size=73 maxlength=73 value="[{$editval->send_email}]" required="required">
            <div class="help-block"></div>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-lg-3 req">[{oxmultilang ident="SUBJECT" suffix="COLON"}]</label>
        <div class="col-lg-9">
            <input class="form-control" type="text" name="editval[send_subject]" size=73 maxlength=73 value="[{if $editval->send_subject}][{$editval->send_subject}][{else}][{oxmultilang ident="HAVE_A_LOOK" suffix="COLON"}] [{$_oProduct->oxarticles__oxtitle->value|strip_tags}][{/if}]" required="required">
            <div class="help-block"></div>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-lg-3 req">[{oxmultilang ident="MESSAGE" suffix="COLON"}]</label>
        <div class="col-lg-9">
            <textarea cols="70" rows="8" name="editval[send_message]" class="areabox form-control" required="required">[{if $editval->send_message}][{$editval->send_message}][{else}][{oxmultilang ident="SHOP_SUGGEST_MESSAGE" args=$oxcmp_shop->oxshops__oxname->value}][{/if}]</textarea>
            <div class="help-block"></div>
        </div>
    </div>

    [{block name="captcha_form"}][{/block}]

    <div class="form-group">
        <div class="col-lg-offset-2 col-lg-10">
            <p class="alert alert-info">[{oxmultilang ident="COMPLETE_MARKED_FIELDS"}]</p>
            <button class="btn btn-primary" type="submit">
                <i class="fa fa-envelope"></i> [{oxmultilang ident="SEND"}]
            </button>
        </div>
    </div>
</form>