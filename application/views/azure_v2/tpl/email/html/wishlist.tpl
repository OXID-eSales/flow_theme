[{assign var="shop"      value=$oEmailView->getShop()}]
[{assign var="oViewConf" value=$oEmailView->getViewConfig()}]
[{assign var="userInfo"  value=$oEmailView->getUser()}]

[{include file="email/html/header.tpl" title="DD_WISHLIST_HEADING"|oxmultilangassign}]

<p>[{$userInfo->send_message|oxescape}]</p>
<br/>

<p>[{oxmultilang ident="TO_MY_WISHLIST"}] <a href="[{$oViewConf->getBaseDir()}]index.php?cl=wishlist&wishid=[{$userInfo->send_id}]"><b>[{oxmultilang ident="CLICK_HERE"}]</b></a></p>
<br/>

<p>[{oxmultilang ident="WITH_LOVE"}]</p>

<p>[{$userInfo->send_name|oxescape}]</p>
<br/>

[{include file="email/html/footer.tpl"}]