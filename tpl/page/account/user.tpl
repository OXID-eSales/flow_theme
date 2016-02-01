[{capture append="oxidBlock_content"}]
    <h1 id="addressSettingsHeader" class="page-header">[{$oView->getTitle()}]</h1>

    [{block name="account_user_form"}]
        [{include file="form/user.tpl"}]
    [{/block}]
    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]
[{capture append="oxidBlock_sidebar"}]
    [{include file="page/account/inc/account_menu.tpl" active_link="billship"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]