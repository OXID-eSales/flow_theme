[{assign var="invadr" value=$oView->getInvoiceAddress()}]
[{assign var="blBirthdayRequired" value=$oView->isFieldRequired(oxuser__oxbirthdate)}]

[{if isset( $invadr.oxuser__oxbirthdate.month )}]
    [{assign var="iBirthdayMonth" value=$invadr.oxuser__oxbirthdate.month}]
[{elseif $oxcmp_user->oxuser__oxbirthdate->value && $oxcmp_user->oxuser__oxbirthdate->value != "0000-00-00"}]
    [{assign var="iBirthdayMonth" value=$oxcmp_user->oxuser__oxbirthdate->value|regex_replace:"/^([0-9]{4})[-]/":""|regex_replace:"/[-]([0-9]{1,2})$/":""}]
[{else}]
    [{assign var="iBirthdayMonth" value=0}]
[{/if}]

[{if isset( $invadr.oxuser__oxbirthdate.day )}]
    [{assign var="iBirthdayDay" value=$invadr.oxuser__oxbirthdate.day}]
[{elseif $oxcmp_user->oxuser__oxbirthdate->value && $oxcmp_user->oxuser__oxbirthdate->value != "0000-00-00"}]
    [{assign var="iBirthdayDay" value=$oxcmp_user->oxuser__oxbirthdate->value|regex_replace:"/^([0-9]{4})[-]([0-9]{1,2})[-]/":""}]
[{else}]
    [{assign var="iBirthdayDay" value=0}]
[{/if}]

[{if isset( $invadr.oxuser__oxbirthdate.year )}]
    [{assign var="iBirthdayYear" value=$invadr.oxuser__oxbirthdate.year}]
[{elseif $oxcmp_user->oxuser__oxbirthdate->value && $oxcmp_user->oxuser__oxbirthdate->value != "0000-00-00"}]
    [{assign var="iBirthdayYear" value=$oxcmp_user->oxuser__oxbirthdate->value|regex_replace:"/[-]([0-9]{1,2})[-]([0-9]{1,2})$/":""}]
[{else}]
    [{assign var="iBirthdayYear" value=0}]
[{/if}]
[{if isset( $invadr.oxuser__oxsal )}]
    [{assign var="oxuser__oxsal" value=$invadr.oxuser__oxsal}]
[{else}]
    [{assign var="oxuser__oxsal" value=$oxcmp_user->oxuser__oxsal->value}]
[{/if}]
<div class="form-group">
    <label class="control-label col-lg-3[{if $oView->isFieldRequired(oxuser__oxsal)}] req[{/if}]" for="invadr_oxuser__oxfname">[{oxmultilang ident="TITLE"}]</label>
    <div class="col-lg-9">
        [{include file="form/fieldset/salutation.tpl" name="invadr[oxuser__oxsal]" value=$oxuser__oxsal class="form-control selectpicker" id="invadr_oxuser__oxfname"}]
    </div>
</div>

<div class="form-group[{if $aErrors.oxuser__oxfname}] text-danger[{/if}]">
    <label class="control-label col-lg-3[{if $oView->isFieldRequired(oxuser__oxfname)}] req[{/if}]">[{oxmultilang ident="FIRST_NAME"}]</label>
    <div class="col-lg-9">
        <input class="form-control" type="text" maxlength="255" name="invadr[oxuser__oxfname]" value="[{if isset( $invadr.oxuser__oxfname )}][{$invadr.oxuser__oxfname}][{else}][{$oxcmp_user->oxuser__oxfname->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxfname)}] required=""[{/if}]>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxfname}]
        <div class="help-block"></div>
    </div>
</div>

<div class="form-group[{if $aErrors.oxuser__oxlname}] text-danger[{/if}]">
    <label class="control-label col-lg-3[{if $oView->isFieldRequired(oxuser__oxlname)}] req[{/if}]">[{oxmultilang ident="LAST_NAME"}]</label>
    <div class="col-lg-9">
        <input class="form-control" type="text" maxlength="255" name="invadr[oxuser__oxlname]" value="[{if isset( $invadr.oxuser__oxlname )}][{$invadr.oxuser__oxlname}][{else}][{$oxcmp_user->oxuser__oxlname->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxlname)}] required=""[{/if}]>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxlname}]
        <div class="help-block"></div>
    </div>
</div>

<div class="form-group[{if $aErrors.oxuser__oxcompany}] text-danger[{/if}]">
    <label class="control-label col-lg-3[{if $oView->isFieldRequired(oxuser__oxcompany)}] req[{/if}]">[{oxmultilang ident="COMPANY"}]</label>
    <div class="col-lg-9">
        <input class="form-control" type="text" maxlength="255" name="invadr[oxuser__oxcompany]" value="[{if isset( $invadr.oxuser__oxcompany )}][{$invadr.oxuser__oxcompany}][{else}][{$oxcmp_user->oxuser__oxcompany->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxcompany)}] required=""[{/if}]>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxcompany}]
        <div class="help-block"></div>
    </div>
</div>

<div class="form-group[{if $aErrors.oxuser__oxaddinfo}] text-danger[{/if}]">
    [{assign var="_address_addinfo_tooltip" value="FORM_FIELDSET_USER_BILLING_ADDITIONALINFO_TOOLTIP"|oxmultilangassign}]
    <label [{if $_address_addinfo_tooltip}]title="[{$_address_addinfo_tooltip}]"[{/if}] class="control-label col-lg-3[{if $oView->isFieldRequired(oxuser__oxaddinfo)}] req[{/if}][{if $_address_addinfo_tooltip}] tooltip[{/if}]">[{oxmultilang ident="ADDITIONAL_INFO"}]</label>
    <div class="col-lg-9">
        <input class="form-control" type="text" maxlength="255" name="invadr[oxuser__oxaddinfo]" value="[{if isset( $invadr.oxuser__oxaddinfo )}][{$invadr.oxuser__oxaddinfo}][{else}][{$oxcmp_user->oxuser__oxaddinfo->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxaddinfo)}] required=""[{/if}]>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxaddinfo}]
        <div class="help-block"></div>
    </div>
</div>

<div class="form-group[{if $aErrors.oxuser__oxstreet}] text-danger[{/if}]">
    <label class="control-label col-xs-12 col-lg-3[{if $oView->isFieldRequired(oxuser__oxstreet) || $oView->isFieldRequired(oxuser__oxstreetnr)}] req[{/if}]">[{oxmultilang ident="STREET_AND_STREETNO"}]</label>
    <div class="col-xs-8 col-lg-6">
        <input class="form-control" type="text" maxlength="255" name="invadr[oxuser__oxstreet]" value="[{if isset( $invadr.oxuser__oxstreet )}][{$invadr.oxuser__oxstreet}][{else}][{$oxcmp_user->oxuser__oxstreet->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxstreet)}] required=""[{/if}]>
    </div>
    <div class="col-xs-4 col-lg-3">
        <input class="form-control" type="text" maxlength="16" name="invadr[oxuser__oxstreetnr]" value="[{if isset( $invadr.oxuser__oxstreetnr )}][{$invadr.oxuser__oxstreetnr}][{else}][{$oxcmp_user->oxuser__oxstreetnr->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxstreetnr)}] required=""[{/if}]>
    </div>
    <div class="col-lg-offset-3 col-lg-9 col-xs-12">
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxstreet}]
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxstreetnr}]
        <div class="help-block"></div>
    </div>
</div>

<div class="form-group[{if $aErrors.oxuser__oxzip}] text-danger[{/if}]">
    <label class="control-label col-xs-12 col-lg-3[{if $oView->isFieldRequired(oxuser__oxzip) || $oView->isFieldRequired(oxuser__oxcity)}] req[{/if}]">[{oxmultilang ident="POSTAL_CODE_AND_CITY"}]</label>
    <div class="col-xs-5 col-lg-3">
        <input class="form-control" type="text" maxlength="16" name="invadr[oxuser__oxzip]" value="[{if isset( $invadr.oxuser__oxzip )}][{$invadr.oxuser__oxzip}][{else}][{$oxcmp_user->oxuser__oxzip->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxzip)}] required=""[{/if}]>
    </div>
    <div class="col-xs-7 col-lg-6">
        <input class="form-control" type="text" maxlength="255" name="invadr[oxuser__oxcity]" value="[{if isset( $invadr.oxuser__oxcity )}][{$invadr.oxuser__oxcity}][{else}][{$oxcmp_user->oxuser__oxcity->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxcity)}] required=""[{/if}]>
    </div>
    <div class="col-lg-offset-3 col-md-9 col-xs-12">
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxzip}]
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxcity}]
        <div class="help-block"></div>
    </div>
</div>

<div class="form-group[{if $aErrors.oxuser__oxustid}] text-danger[{/if}]">
    <label class="control-label col-lg-3[{if $oView->isFieldRequired(oxuser__oxustid)}] req[{/if}]">[{oxmultilang ident="VAT_ID_NUMBER"}]</label>
    <div class="col-lg-9">
        <input class="form-control" type="text" maxlength="255" name="invadr[oxuser__oxustid]" value="[{if isset( $invadr.oxuser__oxustid )}][{$invadr.oxuser__oxustid}][{else}][{$oxcmp_user->oxuser__oxustid->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxustid)}] required=""[{/if}]>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxustid}]
        <div class="help-block"></div>
    </div>
</div>

[{block name="form_user_billing_country"}]
    <div class="form-group[{if $aErrors.oxuser__oxcountryid}] text-danger[{/if}]">
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
            [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxcountryid}]
            <div class="help-block"></div>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-lg-3" for="[{$oxcmp_user->oxuser__oxstateid->value}]">[{oxmultilang ident="DD_USER_BILLING_LABEL_STATE"}]</label>
        <div class="col-lg-9">
            [{include file="form/fieldset/state.tpl"
            countrySelectId="invCountrySelect"
            stateSelectName="invadr[oxuser__oxstateid]"
            selectedStateIdPrim=$invadr.oxuser__oxstateid
            selectedStateId=$oxcmp_user->oxuser__oxstateid->value
            class="form-control selectpicker"
            }]
            <div class="help-block"></div>
        </div>
    </div>
[{/block}]

<div class="form-group[{if $aErrors.oxuser__oxfon}] text-danger"[{/if}]">
    <label class="control-label col-lg-3[{if $oView->isFieldRequired(oxuser__oxfon)}] req[{/if}]">[{oxmultilang ident="PHONE"}]</label>
    <div class="col-lg-9">
        <input class="form-control" type="text" maxlength="128" name="invadr[oxuser__oxfon]" value="[{if isset( $invadr.oxuser__oxfon )}][{$invadr.oxuser__oxfon}][{else}][{$oxcmp_user->oxuser__oxfon->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxfon)}] required=""[{/if}]>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxfon}]
        <div class="help-block"></div>
    </div>
</div>

<div class="form-group[{if $aErrors.oxuser__oxfax}] text-danger[{/if}]">
    <label class="control-label col-lg-3[{if $oView->isFieldRequired(oxuser__oxfax)}] req[{/if}]">[{oxmultilang ident="FAX"}]</label>
    <div class="col-lg-9">
        <input class="form-control" type="text" maxlength="128" name="invadr[oxuser__oxfax]" value="[{if isset( $invadr.oxuser__oxfax )}][{$invadr.oxuser__oxfax}][{else}][{$oxcmp_user->oxuser__oxfax->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxfax)}] required=""[{/if}]>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxfax}]
        <div class="help-block"></div>
    </div>
</div>

<div class="form-group[{if $aErrors.oxuser__oxmobfon}] text-danger[{/if}]">
    <label class="control-label col-lg-3[{if $oView->isFieldRequired(oxuser__oxmobfon)}] req[{/if}]">[{oxmultilang ident="CELLUAR_PHONE"}]</label>
    <div class="col-lg-9">
        <input class="form-control" type="text" maxlength="64" name="invadr[oxuser__oxmobfon]" value="[{if isset( $invadr.oxuser__oxmobfon )}][{$invadr.oxuser__oxmobfon}][{else}][{$oxcmp_user->oxuser__oxmobfon->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxmobfon)}] required=""[{/if}]>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxmobfon}]
        <div class="help-block"></div>
    </div>
</div>

<div class="form-group[{if $aErrors.oxuser__oxprivfon}] text-danger[{/if}]">
    <label class="control-label col-lg-3[{if $oView->isFieldRequired(oxuser__oxprivfon)}] req[{/if}]">[{oxmultilang ident="PERSONAL_PHONE"}]</label>
    <div class="col-lg-9">
        <input class="form-control" type="text" maxlength="64" name="invadr[oxuser__oxprivfon]" value="[{if isset( $invadr.oxuser__oxprivfon )}][{$invadr.oxuser__oxprivfon}][{else}][{$oxcmp_user->oxuser__oxprivfon->value}][{/if}]"[{if $oView->isFieldRequired(oxuser__oxprivfon)}] required=""[{/if}]>
        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxprivfon}]
        <div class="help-block"></div>
    </div>
</div>

[{if $oViewConf->showBirthdayFields()}]
    <div class="form-group oxDate[{if $aErrors.oxuser__oxbirthdate}] text-danger[{/if}]">
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
            [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxbirthdate}]
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
