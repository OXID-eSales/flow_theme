[{assign var="shop"      value=$oEmailView->getShop()}]
[{assign var="oViewConf" value=$oEmailView->getViewConfig()}]
[{assign var="user"      value=$oEmailView->getUser()}]

[{include file="email/html/header.tpl" title="DD_NEWSLETTER_OPTIN_HEADING"|oxmultilangassign}]

<p>[{oxcontent ident="oxnewsletteremail"}]</p>

[{include file="email/html/footer.tpl"}]