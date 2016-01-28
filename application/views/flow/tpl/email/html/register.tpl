[{assign var="shop"     value=$oEmailView->getShop()}]
[{assign var="oViewConf" value=$oEmailView->getViewConfig()}]
[{assign var="user"     value=$oEmailView->getUser()}]

[{include file="email/html/header.tpl" title="DD_REGISTER_HEADING"|oxmultilangassign}]

[{oxcontent ident=$contentident|default:"oxregisteremail"}]<br/>

[{include file="email/html/footer.tpl"}]