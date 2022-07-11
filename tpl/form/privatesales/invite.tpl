[{assign var="_oProduct" value=$oView->getProduct()}]
[{assign var="editval" value=$oView->getInviteData()}]
<form class="js-oxValidate" action="[{$oViewConf->getSslSelfLink()}]" method="post">
    <div>
        [{$oViewConf->getHiddenSid() nofilter}]
        [{$oViewConf->getNavFormParams() nofilter}]
        <input type="hidden" name="fnc" value="send">
        <input type="hidden" name="cl" value="invite">
        <input type="hidden" name="anid" value="[{$_oProduct->oxarticles__oxnid->value}]">
        <input type="hidden" name="CustomError" value='invite'>
        <h3 class="blockHead">[{oxmultilang ident="SEND_INVITE_TO" suffix="COLON"}]</h3>
        <ul class="form">
            <li>
                <label class="req">[{oxmultilang ident="EMAIL"}] #1:</label>
                <input type="text" class="js-oxValidate js-oxValidate_notEmpty js-oxValidate_email" name="editval[rec_email][1]" size="73" maxlength="73" value="[{$editval->rec_email.1}]">
                <p class="oxValidateError">
                    <span class="js-oxError_notEmpty">[{oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS"}]</span>
                    <span class="js-oxError_email">[{oxmultilang ident="ERROR_MESSAGE_INPUT_NOVALIDEMAIL"}]</span>
                </p>
            </li>
            <li>
                <label>[{oxmultilang ident="EMAIL"}] #2:</label>
                <input type="text" name="editval[rec_email][2]" size="73" maxlength="73" value="[{$editval->rec_email.2}]">
                <p class="oxValidateError">
                    <span class="js-oxError_email">[{oxmultilang ident="ERROR_MESSAGE_INPUT_NOVALIDEMAIL"}]</span>
                </p>
            </li>
            <li>
                <label>[{oxmultilang ident="EMAIL"}] #3:</label>
                <input type="text" name="editval[rec_email][3]" size="73" maxlength="73" value="[{$editval->rec_email.3}]">
                <p class="oxValidateError">
                    <span class="js-oxError_email">[{oxmultilang ident="ERROR_MESSAGE_INPUT_NOVALIDEMAIL"}]</span>
                </p>
            </li>
            <li>
                <label>[{oxmultilang ident="EMAIL"}] #4:</label>
                <input type="text" name="editval[rec_email][4]" size="73" maxlength="73" value="[{$editval->rec_email.4}]">
                <p class="oxValidateError">
                    <span class="js-oxError_email">[{oxmultilang ident="ERROR_MESSAGE_INPUT_NOVALIDEMAIL"}]</span>
                </p>
            </li>
            <li>
                <label>[{oxmultilang ident="EMAIL"}] #5:</label>
                <input type="text" name="editval[rec_email][5]" size="73" maxlength="73" value="[{$editval->rec_email.5}]">
                <p class="oxValidateError">
                    <span class="js-oxError_email">[{oxmultilang ident="ERROR_MESSAGE_INPUT_NOVALIDEMAIL"}]</span>
                </p>
            </li>
        </ul>


        <h3 class="blockHead">[{oxmultilang ident="FROM" suffix="COLON"}]</h3>
        <ul class="form">
            <li>
                <label class="req">[{oxmultilang ident="SENDER_NAME"}]</label>
                <input type="text" class="js-oxValidate js-oxValidate_notEmpty" name="editval[send_name]" size=73 maxlength=73 value="[{$editval->send_name}]">
                <p class="oxValidateError">
                    <span class="js-oxError_notEmpty">[{oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS"}]</span>
                </p>
            </li>
            <li>
                <label class="req">[{oxmultilang ident="SENDER_EMAIL" suffix="COLON"}]</label>
                <input type="text" class="js-oxValidate js-oxValidate_notEmpty js-oxValidate_email" name="editval[send_email]" size=73 maxlength=73 value="[{$editval->send_email}]" >
                <p class="oxValidateError">
                    <span class="js-oxError_notEmpty">[{oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS"}]</span>
                    <span class="js-oxError_email">[{oxmultilang ident="ERROR_MESSAGE_INPUT_NOVALIDEMAIL"}]</span>
                </p>
            </li>
            <li>
                <label class="req">[{oxmultilang ident="SUBJECT" suffix="COLON"}]</label>
                <input type="text" class="js-oxValidate js-oxValidate_notEmpty" name="editval[send_subject]" size=73 maxlength=73 value="[{if $editval->send_subject}][{$editval->send_subject}][{else}][{oxmultilang ident="HAVE_A_LOOK"}] [{$_oProduct->oxarticles__oxtitle->value|strip_tags}][{/if}]">
                <p class="oxValidateError">
                    <span class="js-oxError_notEmpty">[{oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS"}]</span>
                </p>
            </li>
            <li>
                <label class="req">[{oxmultilang ident="MESSAGE" suffix="COLON"}]</label>
                <textarea cols="70" rows="8" name="editval[send_message]" class="js-oxValidate js-oxValidate_notEmpty areabox">[{if $editval->send_message}][{$editval->send_message}][{else}][{oxmultilang ident="FORM_SUGGEST_MESSAGE1"}] [{$oxcmp_shop->oxshops__oxname->value}] [{oxmultilang ident="FORM_SUGGEST_MESSAGE2"}][{/if}]</textarea>
                <p class="oxValidateError">
                    <span class="js-oxError_notEmpty">[{oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS"}]</span>
                </p>
            </li>

            [{block name="captcha_form"}][{/block}]

            <li class="formSubmit">
                <button class="submitButton largeButton" type="submit">[{oxmultilang ident="SEND"}]</button>
            </li>
        </ul>
    </div>
</form>
