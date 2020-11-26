[{oxscript include="js/libs/jqBootstrapValidation.min.js" priority=10}]
[{oxscript add="$('input,select,textarea').not('[type=submit]').jqBootstrapValidation();"}]

[{assign var="aRegParams" value=$oView->getRegParams()}]
<form class="form-horizontal" action="[{$oViewConf->getSslSelfLink()}]" method="post" role="form" novalidate="novalidate">
    <div class="hidden">
        [{$oViewConf->getHiddenSid()}]
        <input type="hidden" name="fnc" value="send">
        <input type="hidden" name="cl" value="newsletter">
        <input type="hidden" name="editval[oxuser__oxcountryid]" value="[{$oView->getHomeCountryId()}]">
    </div>

    <div class="form-group">
        <label class="control-label col-lg-2">[{oxmultilang ident="TITLE"}]</label>

        <div class="col-lg-5">
            [{include file="form/fieldset/salutation.tpl" name="editval[oxuser__oxsal]" value=$aRegParams.oxuser__oxsal class="form-control selectpicker show-tick"}]
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-lg-2">[{oxmultilang ident="FIRST_NAME"}]</label>

        <div class="col-lg-5">
            <input class="form-control" id="newsletterFname" type="text" name="editval[oxuser__oxfname]" maxlength="40" value="[{if $aRegParams.oxuser__oxfname}][{$aRegParams.oxuser__oxfname}][{/if}]">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-lg-2">[{oxmultilang ident="LAST_NAME"}]</label>

        <div class="col-lg-5">
            <input class="form-control" id="newsletterLname" type="text" name="editval[oxuser__oxlname]" maxlength="40" value="[{if $aRegParams.oxuser__oxlname}][{$aRegParams.oxuser__oxlname}][{/if}]">
        </div>
    </div>
    <div class="form-group[{if $aErrors}] oxInValid[{/if}]">
        <label class="req control-label col-lg-2">[{oxmultilang ident="EMAIL"}]</label>

        <div class="col-lg-5">
            <input id="newsletterUserName" type="email" class="form-control" name="editval[oxuser__oxusername]" maxlength="40" value="[{if $aRegParams.oxuser__oxusername}][{$aRegParams.oxuser__oxusername}][{/if}]" required="required">
            <div class="help-block"></div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-lg-offset-2 col-lg-5">
            <label for="newsletterSubscribeOn" class="checkbox-inline">
                <input id="newsletterSubscribeOn" type="radio" name="subscribeStatus" value="1" checked> [{oxmultilang ident="SUBSCRIBE"}]
            </label>
            <label for="newsletterSubscribeOff" class="checkbox-inline">
                <input id="newsletterSubscribeOff" type="radio" name="subscribeStatus" value="0"> [{oxmultilang ident="UNSUBSCRIBE"}]
            </label>
        </div>
    </div>

    [{block name="captcha_form"}][{/block}]

    <div class="form-group">
        <div class="col-lg-offset-2 col-lg-5">
            <p class="alert alert-info">[{oxmultilang ident="COMPLETE_MARKED_FIELDS"}]</p>
            <button id="newsLetterSubmit" class="btn btn-primary" type="submit">[{oxmultilang ident="SUBMIT"}]</button>
        </div>
    </div>
</form>
