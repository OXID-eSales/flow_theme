[{oxscript include="js/libs/jqBootstrapValidation.min.js" priority=10}]
[{oxscript add="$('input,select,textarea').not('[type=submit]').jqBootstrapValidation();"}]

[{assign var="editval" value=$oView->getUserData()}]
<form class="form-horizontal" action="[{$oViewConf->getSslSelfLink()}]" method="post" role="form" novalidate="novalidate">
    <div class="hidden">
        [{$oViewConf->getHiddenSid()}]
        <input type="hidden" name="fnc" value="send"/>
        <input type="hidden" name="cl" value="contact"/>
        [{assign var="oCaptcha" value=$oView->getCaptcha()}]
        <input type="hidden" name="c_mach" value="[{$oCaptcha->getHash()}]"/>
    </div>

    [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxfname}]

    <div class="form-group">
        <label class="control-label col-lg-2">[{oxmultilang ident="TITLE"}]</label>
        <div class="col-lg-10 controls">
            [{include file="form/fieldset/salutation.tpl" name="editval[oxuser__oxsal]" value=$editval.oxuser__oxsal class="form-control selectpicker show-tick"}]
        </div>
    </div>
    <div class="form-group[{if $aErrors.oxuser__oxfname}] oxInValid[{/if}]">
        <label class="req control-label col-lg-2">[{oxmultilang ident="FIRST_NAME"}]</label>
        <div class="col-lg-10 controls">
            <input type="text" name="editval[oxuser__oxfname]" size="70" maxlength="40" value="[{$editval.oxuser__oxfname}]" class="form-control" required="required">
        </div>
    </div>
    <div class="form-group[{if $aErrors.oxuser__oxlname}] oxInValid[{/if}]">
        <label class="req control-label col-lg-2">[{oxmultilang ident="LAST_NAME"}]</label>
        <div class="col-lg-10 controls">
            <input type="text" name="editval[oxuser__oxlname]" size=70 maxlength=40 value="[{$editval.oxuser__oxlname}]" class="form-control" required="required">
        </div>
    </div>
    <div class="form-group[{if $aErrors.oxuser__oxusername}] oxInValid[{/if}]">
        <label class="req control-label col-lg-2">[{oxmultilang ident="EMAIL"}]</label>
        <div class="col-lg-10 controls">
            <input id="contactEmail" type="email" name="editval[oxuser__oxusername]"  size=70 maxlength=40 value="[{$editval.oxuser__oxusername}]" class="form-control" required="required">
        </div>
    </div>
    <div class="form-group[{if $aErrors && !$oView->getContactSubject()}] oxInValid[{/if}]">
        <label class="req control-label col-lg-2">[{oxmultilang ident="SUBJECT"}]</label>
        <div class="col-lg-10 controls">
            <input type="text" name="c_subject" size="70" maxlength=80 value="[{$oView->getContactSubject()}]" class="form-control" required="required">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-lg-2">[{oxmultilang ident="MESSAGE"}]</label>
        <div class="col-lg-10 controls">
            <textarea rows="15" cols="70" name="c_message" class="form-control">[{$oView->getContactMessage()}]</textarea>
        </div>
    </div>
    <div class="form-group verify">
        <label class="req control-label col-lg-2">[{oxmultilang ident="VERIFICATION_CODE"}]</label>
        <div class="col-lg-10 controls">
            [{assign var="oCaptcha" value=$oView->getCaptcha()}]
            <div class="input-group">
                [{if $oCaptcha->isImageVisible()}]
                    <span class="input-group-addon">
                        <img src="[{$oCaptcha->getImageUrl()}]" alt="">
                    </span>
                [{else}]
                    <span class="input-group-addon verificationCode" id="verifyTextCode">[{$oCaptcha->getText()}]</span>
                [{/if}]
                <input type="text" name="c_mac" value="" class="form-control" required="required">
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-lg-offset-2 col-lg-10">
            <p class="alert alert-info">[{oxmultilang ident="COMPLETE_MARKED_FIELDS"}]</p>
            <button class="btn btn-primary" type="submit">
                <i class="fa fa-envelope"></i> [{oxmultilang ident="SEND"}]
            </button>
        </div>
    </div>
</form>
