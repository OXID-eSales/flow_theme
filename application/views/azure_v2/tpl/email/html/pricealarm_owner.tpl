[{assign var="shop"      value=$oEmailView->getShop()}]
[{assign var="oViewConf" value=$oEmailView->getViewConfig()}]
[{assign var="currency"  value=$oEmailView->getCurrency()}]
[{assign var="user"      value=$oEmailView->getUser()}]

[{include file="email/html/header.tpl" title="DD_PRICEALARM_HEADING"|oxmultilangassign}]

[{oxcontent ident="oxpricealarmemail"}]<br/>

[{include file="email/html/footer.tpl"}]