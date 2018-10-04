[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="CHANGE_PASSWORD"|oxmultilangassign}]

    [{if $oView->isPasswordChanged()}]
        <div class="alert alert-success">
            [{oxmultilang ident="MESSAGE_PASSWORD_CHANGED"}]
        </div>
    [{/if}]
    [{if $Errors|is_array && $Errors.user|is_array && !empty($Errors.user)}]
        <div class="alert alert-danger">
            [{foreach from=$Errors.user item=oEr key=key}]
                <p>[{$oEr->getOxMessage()}]</p>
            [{/foreach}]
        </div>
    [{/if}]

    <h1 id="personalSettingsHeader" class="page-header">[{oxmultilang ident="CHANGE_PASSWORD"}]</h1>

    [{include file="form/user_password.tpl"}]

    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]

[{capture append="oxidBlock_sidebar"}]
    [{include file="page/account/inc/account_menu.tpl" active_link="password"}]
[{/capture}]

[{include file="layout/page.tpl" sidebar="Left"}]
