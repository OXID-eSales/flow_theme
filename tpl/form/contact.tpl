[{oxscript include="js/libs/jqBootstrapValidation.min.js" priority=10}]
[{oxscript add="$('input,select,textarea').not('[type=submit]').jqBootstrapValidation();"}]

[{assign var="editval" value=$oView->getUserData()}]
<form class="form-horizontal" action="[{$oViewConf->getSslSelfLink()}]" method="post" role="form" novalidate="novalidate">
    <div class="hidden">
        [{$oViewConf->getHiddenSid()}]
        <input type="hidden" name="fnc" value="send"/>
        <input type="hidden" name="cl" value="contact"/>
    </div>

    [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxfname}]

    [{block name="contact_form_fields"}]
    <div class="form-group">
        <label class="[{if $contactFormFields.salutation.isRequired}]req[{/if}] control-label col-lg-2">
            [{oxmultilang ident="TITLE"}]
        </label>
        <div class="col-lg-10 controls">
            [{include
            file="form/fieldset/salutation.tpl"
            name="editval[oxuser__oxsal]"
            value=$editval.oxuser__oxsal
            class="form-control selectpicker show-tick "
            required=$contactFormFields.salutation.isRequired
            }]
        </div>
    </div>
    <div class="form-group[{if $aErrors.oxuser__oxfname}] oxInValid[{/if}]">
        <label class="[{if $contactFormFields.firstName.isRequired}]req[{/if}] control-label col-lg-2"
               for="editval[oxuser__oxfname]">
            [{oxmultilang ident="FIRST_NAME"}]
        </label>
        <div class="col-lg-10 controls">
            <input type="text"
                   name="editval[oxuser__oxfname]"
                   id="editval[oxuser__oxfname]"
                   size="70"
                   maxlength="255"
                   value="[{$editval.oxuser__oxfname}]"
                   class="form-control"
                   [{if $contactFormFields.firstName.isRequired}]required="required"[{/if}] >
        </div>
    </div>
    <div class="form-group[{if $aErrors.oxuser__oxlname}] oxInValid[{/if}]">
        <label class="[{if $contactFormFields.lastName.isRequired}]req[{/if}] control-label col-lg-2"
               for="editval[oxuser__oxlname]">
            [{oxmultilang ident="LAST_NAME"}]
        </label>
        <div class="col-lg-10 controls">
            <input type="text"
                   name="editval[oxuser__oxlname]"
                   id="editval[oxuser__oxlname]"
                   size=70
                   maxlength=255
                   value="[{$editval.oxuser__oxlname}]"
                   class="form-control"
                   [{if $contactFormFields.lastName.isRequired}]required="required"[{/if}]>
        </div>
    </div>
    <div class="form-group[{if $aErrors.oxuser__oxusername}] oxInValid[{/if}]">
        <label class="[{if $contactFormFields.email.isRequired}]req[{/if}] control-label col-lg-2"
               for="contactEmail">
            [{oxmultilang ident="EMAIL"}]
        </label>
        <div class="col-lg-10 controls">
            <input id="contactEmail"
                   type="email"
                   name="editval[oxuser__oxusername]"
                   size=70
                   maxlength=255
                   value="[{$editval.oxuser__oxusername}]"
                   class="form-control"
                   [{if $contactFormFields.email.isRequired}]required="required"[{/if}]>
        </div>
    </div>
    <div class="form-group[{if $aErrors && !$oView->getContactSubject()}] oxInValid[{/if}]">
        <label class="[{if $contactFormFields.subject.isRequired}]req[{/if}] control-label col-lg-2"
               for="c_subject">
            [{oxmultilang ident="SUBJECT"}]
        </label>
        <div class="col-lg-10 controls">
            <input type="text"
                   name="c_subject"
                   id="c_subject"
                   size="70"
                   maxlength=80
                   value="[{$oView->getContactSubject()}]"
                   class="form-control"
                   [{if $contactFormFields.subject.isRequired}]required="required"[{/if}]>
        </div>
    </div>
    <div class="form-group">
        <label class="[{if $contactFormFields.message.isRequired}]req[{/if}] control-label col-lg-2"
               for="c_message">
            [{oxmultilang ident="MESSAGE"}]
        </label>
        <div class="col-lg-10 controls">
                <textarea rows="15"
                          cols="70"
                          name="c_message"
                          id="c_message"
                          class="form-control"
                          [{if $contactFormFields.message.isRequired}]required="required"[{/if}]
                >[{$oView->getContactMessage()}]</textarea>
        </div>
    </div>
    [{/block}]

    [{block name="captcha_form"}][{/block}]

    [{block name="contact_form_buttons"}]
    <div class="form-group">
        <div class="col-lg-offset-2 col-lg-10">
            <p class="alert alert-info">[{oxmultilang ident="COMPLETE_MARKED_FIELDS"}]</p>
            <button class="btn btn-primary" type="submit">
                <i class="fa fa-envelope"></i> [{oxmultilang ident="SEND"}]
            </button>
        </div>
    </div>
    [{/block}]
</form>
