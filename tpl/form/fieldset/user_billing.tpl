[{if !isset($noFormSubmit)}][{assign var="noFormSubmit" value=null}][{/if}]

[{assign var="invadr" value=$oView->getInvoiceAddress()}]
[{assign var="blBirthdayRequired" value=$oView->isFieldRequired(oxuser__oxbirthdate)}]

[{if isset( $invadr.oxuser__oxbirthdate.month )}]
    [{assign var="iBirthdayMonth" value=$invadr.oxuser__oxbirthdate.month}]
[{elseif isset($oxcmp_user->oxuser__oxbirthdate) && $oxcmp_user->oxuser__oxbirthdate->value && $oxcmp_user->oxuser__oxbirthdate->value != "0000-00-00"}]
    [{assign var="iBirthdayMonth" value=$oxcmp_user->oxuser__oxbirthdate->value|regex_replace:"/^([0-9]{4})[-]/":""|regex_replace:"/[-]([0-9]{1,2})$/":""}]
[{else}]
    [{assign var="iBirthdayMonth" value=0}]
[{/if}]

[{if isset( $invadr.oxuser__oxbirthdate.day )}]
    [{assign var="iBirthdayDay" value=$invadr.oxuser__oxbirthdate.day}]
[{elseif isset($oxcmp_user->oxuser__oxbirthdate) && $oxcmp_user->oxuser__oxbirthdate->value && $oxcmp_user->oxuser__oxbirthdate->value != "0000-00-00"}]
    [{assign var="iBirthdayDay" value=$oxcmp_user->oxuser__oxbirthdate->value|regex_replace:"/^([0-9]{4})[-]([0-9]{1,2})[-]/":""}]
[{else}]
    [{assign var="iBirthdayDay" value=0}]
[{/if}]

[{if isset( $invadr.oxuser__oxbirthdate.year )}]
    [{assign var="iBirthdayYear" value=$invadr.oxuser__oxbirthdate.year}]
[{elseif isset($oxcmp_user->oxuser__oxbirthdate) && $oxcmp_user->oxuser__oxbirthdate->value && $oxcmp_user->oxuser__oxbirthdate->value != "0000-00-00"}]
    [{assign var="iBirthdayYear" value=$oxcmp_user->oxuser__oxbirthdate->value|regex_replace:"/[-]([0-9]{1,2})[-]([0-9]{1,2})$/":""}]
[{else}]
    [{assign var="iBirthdayYear" value=0}]
[{/if}]
[{if isset($oxcmp_user->oxuser__oxsal) && isset( $invadr.oxuser__oxsal )}]
    [{assign var="oxuser__oxsal" value=$invadr.oxuser__oxsal}]
[{else}]
    [{if isset($oxcmp_user->oxuser__oxsal)}][{assign var="oxuser__oxsal" value=$oxcmp_user->oxuser__oxsal->value}][{else}][{assign var="oxuser__oxsal" value=null}][{/if}]
[{/if}]
<div class="form-group">
    <label class="control-label col-lg-3[{if $oView->isFieldRequired(oxuser__oxsal)}] req[{/if}]" for="invadr_oxuser__oxfname">[{oxmultilang ident="TITLE"}]</label>
    <div class="col-lg-9">
        [{include file="form/fieldset/salutation.tpl" name="invadr[oxuser__oxsal]" value=$oxuser__oxsal class="form-control selectpicker" id="invadr_oxuser__oxfname"}]
    </div>
</div>

[{if isset($aErrors.oxuser__oxfname)}][{assign var="userFirstNameErrors" value=$aErrors.oxuser__oxfname}] [{else}][{assign var="userFirstNameErrors" value=null}] [{/if}]
<div class="form-group[{if $userFirstNameErrors}] text-danger[{/if}]">
    <label class="control-label col-lg-3[{if $oView->isFieldRequired(oxuser__oxfname)}] req[{/if}]">[{oxmultilang ident="FIRST_NAME"}]</label>
    <div class="col-lg-9">
        <input class="form-control" type="text" maxlength="255" name="invadr[oxuser__oxfname]" value="[{if isset( $invadr.oxuser__oxfname )}][{$invadr.oxuser__oxfname}][{elseif isset($oxcmp_user->oxuser__oxfname)}][{$oxcmp_user->oxuser__oxfname->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxfname)}] required=""[{/if}]>
        [{include file="message/inputvalidation.tpl" aErrors=$userFirstNameErrors}]
        <div class="help-block"></div>
    </div>
</div>

[{if isset($aErrors.oxuser__oxlname)}][{assign var="userLastNameErrors" value=$aErrors.oxuser__oxlname}][{else}][{assign var="userLastNameErrors" value=null}][{/if}]
<div class="form-group[{if $userLastNameErrors}] text-danger[{/if}]">
    <label class="control-label col-lg-3[{if $oView->isFieldRequired(oxuser__oxlname)}] req[{/if}]">[{oxmultilang ident="LAST_NAME"}]</label>
    <div class="col-lg-9">
        <input class="form-control" type="text" maxlength="255" name="invadr[oxuser__oxlname]" value="[{if isset( $invadr.oxuser__oxlname )}][{$invadr.oxuser__oxlname}][{elseif isset($oxcmp_user->oxuser__oxlname)}][{$oxcmp_user->oxuser__oxlname->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxlname)}] required=""[{/if}]>
        [{include file="message/inputvalidation.tpl" aErrors=$userLastNameErrors}]
        <div class="help-block"></div>
    </div>
</div>

[{if isset($aErrors.oxuser__oxcompany)}][{assign var="userCompanyErrors" value=$aErrors.oxuser__oxcompany}][{else}][{assign var="userCompanyErrors" value=null}][{/if}]
<div class="form-group[{if $userCompanyErrors}] text-danger[{/if}]">
    <label class="control-label col-lg-3[{if $oView->isFieldRequired(oxuser__oxcompany)}] req[{/if}]">[{oxmultilang ident="COMPANY"}]</label>
    <div class="col-lg-9">
        <input class="form-control" type="text" maxlength="255" name="invadr[oxuser__oxcompany]" value="[{if isset( $invadr.oxuser__oxcompany )}][{$invadr.oxuser__oxcompany}][{elseif isset($oxcmp_user->oxuser__oxcompany)}][{$oxcmp_user->oxuser__oxcompany->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxcompany)}] required=""[{/if}]>
        [{include file="message/inputvalidation.tpl" aErrors=$userCompanyErrors}]
        <div class="help-block"></div>
    </div>
</div>

[{if isset($aErrors.oxuser__oxaddinfo)}][{assign var="userAddInfoErrors" value=$aErrors.oxuser__oxaddinfo}][{else}][{assign var="userAddInfoErrors" value=null}][{/if}]
<div class="form-group[{if $userAddInfoErrors}] text-danger[{/if}]">
    [{assign var="_address_addinfo_tooltip" value="FORM_FIELDSET_USER_BILLING_ADDITIONALINFO_TOOLTIP"|oxmultilangassign}]
    <label [{if $_address_addinfo_tooltip}]title="[{$_address_addinfo_tooltip}]"[{/if}] class="control-label col-lg-3[{if $oView->isFieldRequired(oxuser__oxaddinfo)}] req[{/if}][{if $_address_addinfo_tooltip}] tooltip[{/if}]">[{oxmultilang ident="ADDITIONAL_INFO"}]</label>
    <div class="col-lg-9">
        <input class="form-control" type="text" maxlength="255" name="invadr[oxuser__oxaddinfo]" value="[{if isset( $invadr.oxuser__oxaddinfo )}][{$invadr.oxuser__oxaddinfo}][{elseif isset($oxcmp_user->oxuser__oxaddinfo)}][{$oxcmp_user->oxuser__oxaddinfo->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxaddinfo)}] required=""[{/if}]>
        [{include file="message/inputvalidation.tpl" aErrors=$userAddInfoErrors}]
        <div class="help-block"></div>
    </div>
</div>

[{if isset($aErrors.oxuser__oxstreet)}][{assign var="userStreetErrors" value=$aErrors.oxuser__oxstreet}][{else}][{assign var="userStreetErrors" value=null}][{/if}]
[{if isset($aErrors.oxuser__oxstreetnr)}][{assign var="userStreetNumberErrors" value=$aErrors.oxuser__oxstreetnr}][{else}][{assign var="userStreetNumberErrors" value=null}][{/if}]
<div class="form-group[{if $userStreetErrors}] text-danger[{/if}]">
    <label class="control-label col-xs-12 col-lg-3[{if $oView->isFieldRequired(oxuser__oxstreet) || $oView->isFieldRequired(oxuser__oxstreetnr)}] req[{/if}]">[{oxmultilang ident="STREET_AND_STREETNO"}]</label>
    <div class="col-xs-8 col-lg-6">
        <input class="form-control" type="text" maxlength="255" name="invadr[oxuser__oxstreet]" value="[{if isset( $invadr.oxuser__oxstreet )}][{$invadr.oxuser__oxstreet}][{elseif isset($oxcmp_user->oxuser__oxstreet)}][{$oxcmp_user->oxuser__oxstreet->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxstreet)}] required=""[{/if}]>
    </div>
    <div class="col-xs-4 col-lg-3">
        <input class="form-control" type="text" maxlength="16" name="invadr[oxuser__oxstreetnr]" value="[{if isset( $invadr.oxuser__oxstreetnr )}][{$invadr.oxuser__oxstreetnr}][{elseif isset($oxcmp_user->oxuser__oxstreetnr)}][{$oxcmp_user->oxuser__oxstreetnr->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxstreetnr)}] required=""[{/if}]>
    </div>
    <div class="col-lg-offset-3 col-lg-9 col-xs-12">
        [{include file="message/inputvalidation.tpl" aErrors=$userStreetErrors}]
        [{include file="message/inputvalidation.tpl" aErrors=$userStreetNumberErrors}]
        <div class="help-block"></div>
    </div>
</div>

[{if isset($aErrors.oxuser__oxzip)}][{assign var="userZipErrors" value=$aErrors.oxuser__oxzip}][{else}][{assign var="userZipErrors" value=null}][{/if}]
[{if isset($aErrors.oxuser__oxcity)}][{assign var="userCityErrors" value=$aErrors.oxuser__oxcity}][{else}][{assign var="userCityErrors" value=null}][{/if}]
<div class="form-group[{if $userZipErrors}] text-danger[{/if}]">
    <label class="control-label col-xs-12 col-lg-3[{if $oView->isFieldRequired(oxuser__oxzip) || $oView->isFieldRequired(oxuser__oxcity)}] req[{/if}]">[{oxmultilang ident="POSTAL_CODE_AND_CITY"}]</label>
    <div class="col-xs-5 col-lg-3">
        <input class="form-control" type="text" maxlength="16" name="invadr[oxuser__oxzip]" value="[{if isset( $invadr.oxuser__oxzip )}][{$invadr.oxuser__oxzip}][{elseif isset($oxcmp_user->oxuser__oxzip)}][{$oxcmp_user->oxuser__oxzip->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxzip)}] required=""[{/if}]>
    </div>
    <div class="col-xs-7 col-lg-6">
        <input class="form-control" type="text" maxlength="255" name="invadr[oxuser__oxcity]" value="[{if isset( $invadr.oxuser__oxcity )}][{$invadr.oxuser__oxcity}][{elseif isset($oxcmp_user->oxuser__oxcity)}][{$oxcmp_user->oxuser__oxcity->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxcity)}] required=""[{/if}]>
    </div>
    <div class="col-lg-offset-3 col-md-9 col-xs-12">
        [{include file="message/inputvalidation.tpl" aErrors=$userZipErrors}]
        [{include file="message/inputvalidation.tpl" aErrors=$userCityErrors}]
        <div class="help-block"></div>
    </div>
</div>

[{if isset($aErrors.oxuser__oxustid)}][{assign var="userUstIdErrors" value=$aErrors.oxuser__oxustid}][{else}][{assign var="userUstIdErrors" value=null}][{/if}]
<div class="form-group[{if $userUstIdErrors}] text-danger[{/if}]">
    <label class="control-label col-lg-3[{if $oView->isFieldRequired(oxuser__oxustid)}] req[{/if}]">[{oxmultilang ident="VAT_ID_NUMBER"}]</label>
    <div class="col-lg-9">
        <input class="form-control" type="text" maxlength="255" name="invadr[oxuser__oxustid]" value="[{if isset( $invadr.oxuser__oxustid )}][{$invadr.oxuser__oxustid}][{elseif isset($oxcmp_user->oxuser__oxustid)}][{$oxcmp_user->oxuser__oxustid->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxustid)}] required=""[{/if}]>
        [{include file="message/inputvalidation.tpl" aErrors=$userUstIdErrors}]
        <div class="help-block"></div>
    </div>
</div>

[{block name="form_user_billing_country"}]
    [{if isset($aErrors.oxuser__oxcountryid)}][{assign var="userCountryErrors" value=$aErrors.oxuser__oxcountryid}][{else}][{assign var="userCountryErrors" value=null}][{/if}]
    <div class="form-group[{if $userCountryErrors}] text-danger[{/if}]">
        <label class="control-label col-lg-3[{if $oView->isFieldRequired(oxuser__oxcountryid)}] req[{/if}]">[{oxmultilang ident="COUNTRY"}]</label>
        <div class="col-lg-9">
            <select class="form-control selectpicker" id="invCountrySelect" name="invadr[oxuser__oxcountryid]"[{if $oView->isFieldRequired(oxuser__oxcountryid)}] required=""[{/if}]>
                <option value="">-</option>
                [{assign var="blCountrySelected" value=false}]
                [{foreach from=$oViewConf->getCountryList() item=country key=country_id}]
                    [{assign var="sCountrySelect" value=""}]
                    [{if !$blCountrySelected}]
                        [{if (isset($invadr.oxuser__oxcountryid) && $invadr.oxuser__oxcountryid == $country->oxcountry__oxid->value) ||
                        (!isset($invadr.oxuser__oxcountryid) && $oxcmp_user->oxuser__oxcountryid->value == $country->oxcountry__oxid->value)}]
                            [{assign var="blCountrySelected" value=true}]
                            [{assign var="sCountrySelect" value="selected"}]
                        [{/if}]
                    [{/if}]
                    <option value="[{$country->oxcountry__oxid->value}]" [{$sCountrySelect}]>[{$country->oxcountry__oxtitle->value}]</option>
                [{/foreach}]
            </select>
            [{include file="message/inputvalidation.tpl" aErrors=$userCountryErrors}]
            <div class="help-block"></div>
        </div>
    </div>
    <div class="form-group">
        [{if isset($oxcmp_user->oxuser__oxstateid->value)}][{assign var="userStateId" value=$oxcmp_user->oxuser__oxstateid->value}][{else}][{assign var="userStateId" value=null}][{/if}]
        [{if isset($invadr.oxuser__oxstateid)}][{assign var="invoiceStateId" value=$invadr.oxuser__oxstateid}][{else}][{assign var="invoiceStateId" value=null}][{/if}]
        <label class="control-label col-lg-3" for="[{$userStateId}]">[{oxmultilang ident="DD_USER_BILLING_LABEL_STATE"}]</label>
        <div class="col-lg-9">
            [{include file="form/fieldset/state.tpl"
            countrySelectId="invCountrySelect"
            stateSelectName="invadr[oxuser__oxstateid]"
            selectedStateIdPrim=$invoiceStateId
            selectedStateId=$userStateId
            class="form-control selectpicker"
            }]
            <div class="help-block"></div>
        </div>
    </div>
[{/block}]

[{if isset($aErrors.oxuser__oxfon)}][{assign var="userPhoneErrors" value=$aErrors.oxuser__oxfon}][{else}][{assign var="userPhoneErrors" value=null}][{/if}]
<div class="form-group[{if $userPhoneErrors}] text-danger"[{/if}]">
    <label class="control-label col-lg-3[{if $oView->isFieldRequired(oxuser__oxfon)}] req[{/if}]">[{oxmultilang ident="PHONE"}]</label>
    <div class="col-lg-9">
        <input class="form-control" type="text" maxlength="128" name="invadr[oxuser__oxfon]" value="[{if isset( $invadr.oxuser__oxfon )}][{$invadr.oxuser__oxfon}][{elseif isset($oxcmp_user->oxuser__oxfon)}][{$oxcmp_user->oxuser__oxfon->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxfon)}] required=""[{/if}]>
        [{include file="message/inputvalidation.tpl" aErrors=$userPhoneErrors}]
        <div class="help-block"></div>
    </div>
</div>

[{if isset($aErrors.oxuser__oxfax)}][{assign var="userFaxErrors" value=$aErrors.oxuser__oxfax}][{else}][{assign var="userFaxErrors" value=null}][{/if}]
<div class="form-group[{if $userFaxErrors}] text-danger[{/if}]">
    <label class="control-label col-lg-3[{if $oView->isFieldRequired(oxuser__oxfax)}] req[{/if}]">[{oxmultilang ident="FAX"}]</label>
    <div class="col-lg-9">
        <input class="form-control" type="text" maxlength="128" name="invadr[oxuser__oxfax]" value="[{if isset( $invadr.oxuser__oxfax )}][{$invadr.oxuser__oxfax}][{elseif isset($oxcmp_user->oxuser__oxfax)}][{$oxcmp_user->oxuser__oxfax->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxfax)}] required=""[{/if}]>
        [{include file="message/inputvalidation.tpl" aErrors=$userFaxErrors}]
        <div class="help-block"></div>
    </div>
</div>

[{if isset($aErrors.oxuser__oxmobfon)}][{assign var="userMobileErrors" value=$aErrors.oxuser__oxmobfon}][{else}][{assign var="userMobileErrors" value=null}][{/if}]
<div class="form-group[{if $userMobileErrors}] text-danger[{/if}]">
    <label class="control-label col-lg-3[{if $oView->isFieldRequired(oxuser__oxmobfon)}] req[{/if}]">[{oxmultilang ident="CELLUAR_PHONE"}]</label>
    <div class="col-lg-9">
        <input class="form-control" type="text" maxlength="64" name="invadr[oxuser__oxmobfon]" value="[{if isset( $invadr.oxuser__oxmobfon )}][{$invadr.oxuser__oxmobfon}][{elseif isset($oxcmp_user->oxuser__oxmobfon)}][{$oxcmp_user->oxuser__oxmobfon->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxmobfon)}] required=""[{/if}]>
        [{include file="message/inputvalidation.tpl" aErrors=$userMobileErrors}]
        <div class="help-block"></div>
    </div>
</div>

[{if isset($aErrors.oxuser__oxprivfon)}][{assign var="userPrivatePhoneErrors" value=$aErrors.oxuser__oxprivfon}][{else}][{assign var="userPrivatePhoneErrors" value=null}][{/if}]
<div class="form-group[{if $userPrivatePhoneErrors}] text-danger[{/if}]">
    <label class="control-label col-lg-3[{if $oView->isFieldRequired(oxuser__oxprivfon)}] req[{/if}]">[{oxmultilang ident="PERSONAL_PHONE"}]</label>
    <div class="col-lg-9">
        <input class="form-control" type="text" maxlength="64" name="invadr[oxuser__oxprivfon]" value="[{if isset( $invadr.oxuser__oxprivfon )}][{$invadr.oxuser__oxprivfon}][{elseif isset($oxcmp_user->oxuser__oxprivfon)}][{$oxcmp_user->oxuser__oxprivfon->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxprivfon)}] required=""[{/if}]>
        [{include file="message/inputvalidation.tpl" aErrors=$userPrivatePhoneErrors}]
        <div class="help-block"></div>
    </div>
</div>

[{if $oViewConf->showBirthdayFields()}]
    [{if isset($aErrors.oxuser__oxbirthdate)}][{assign var="userBirthdateErrors" value=$aErrors.oxuser__oxbirthdate}][{else}][{assign var="userBirthdateErrors" value=null}][{/if}]
    <div class="form-group oxDate[{if $userBirthdateErrors}] text-danger[{/if}]">
        <label class="control-label col-xs-12 col-lg-3[{if $oView->isFieldRequired(oxuser__oxbirthdate)}] req[{/if}]">[{oxmultilang ident="BIRTHDATE"}]</label>
        <div class="col-xs-3 col-lg-3">
            <input id="oxDay" class="oxDay form-control" name="invadr[oxuser__oxbirthdate][day]" type="text" maxlength="2" value="[{if $iBirthdayDay > 0}][{$iBirthdayDay}][{/if}]" placeholder="[{oxmultilang ident="DAY"}]"[{if $oView->isFieldRequired(oxuser__oxbirthdate)}] required=""[{/if}]>
        </div>
        <div class="col-xs-6 col-lg-3">
            <select class="oxMonth form-control selectpicker" name="invadr[oxuser__oxbirthdate][month]"[{if $oView->isFieldRequired(oxuser__oxbirthdate)}] required=""[{/if}]>
                <option value="" label="-">-</option>
                [{section name="month" start=1 loop=13}]
                    <option value="[{$smarty.section.month.index}]" label="[{$smarty.section.month.index}]" [{if $iBirthdayMonth == $smarty.section.month.index}] selected="selected" [{/if}]>
                        [{oxmultilang ident="MONTH_NAME_"|cat:$smarty.section.month.index}]
                    </option>
                [{/section}]
            </select>
        </div>
        <div class="col-xs-3 col-lg-3">
            <input id="oxYear" class="oxYear form-control" name="invadr[oxuser__oxbirthdate][year]" type="text" maxlength="4" value="[{if $iBirthdayYear}][{$iBirthdayYear}][{/if}]" placeholder="[{oxmultilang ident="YEAR"}]"[{if $oView->isFieldRequired(oxuser__oxbirthdate)}] required=""[{/if}]>
        </div>
        <div class="col-lg-offset-3 col-lg-9 col-xs-12">
            [{include file="message/inputvalidation.tpl" aErrors=$userBirthdateErrors}]
            <div class="help-block"></div>
        </div>
    </div>
[{/if}]

<div class="form-group">
    <div class="col-lg-offset-3 col-lg-9 col-xs-12">
        <p class="alert alert-info">[{oxmultilang ident="COMPLETE_MARKED_FIELDS"}]</p>
    </div>
</div>

[{if !$noFormSubmit}]
    <div class="form-group">
        <div class="col-lg-offset-3 col-lg-9 col-xs-12">
            <button id="accUserSaveTop" type="submit" name="save" class="btn btn-primary">[{oxmultilang ident="SAVE"}]</button>
        </div>
    </div>
[{/if}]
