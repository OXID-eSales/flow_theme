[{assign var="shop"      value=$oEmailView->getShop()}]
[{assign var="oViewConf" value=$oEmailView->getViewConfig()}]
[{assign var="user"      value=$oEmailView->getUser()}]


[{include file="email/html/header.tpl" title="DD_FORGOT_PASSWORD_HEADING"|oxmultilangassign}]

<p>[{oxcontent ident="oxupdatepassinfoemail"}]</p>

[{include file="email/html/footer.tpl"}]
