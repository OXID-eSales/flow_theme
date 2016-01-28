[{assign var="template_title" value="REGISTER"|oxmultilangassign}]
[{capture append="oxidBlock_content"}]
    <div class="accountLoginView">
        <h1 id="loginAccount" class="page-header">[{oxmultilang ident="LOGIN"}]</h1>
        [{include file="form/login_account.tpl"}]
    </div>
    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]

[{include file="layout/page.tpl"}]