[{assign var="shop"      value=$oEmailView->getShop()}]
[{assign var="oViewConf" value=$oEmailView->getViewConfig()}]
[{assign var="user"      value=$oEmailView->getUser()}]


[{oxmultilang ident="GIFT_REGISTRY_OF"}] [{$shop->oxshops__oxname nofilter}]

[{$userinfo->send_message}]

[{oxmultilang ident="TO_MY_WISHLIST"}] [{oxmultilang ident="CLICK_HERE"}]

[{$oViewConf->getBaseDir()}]index.php?cl=wishlist&wishid=[{$userinfo->send_id}]

[{oxmultilang ident="WITH_LOVE"}]

[{$userinfo->send_name}]

[{oxcontent ident="oxemailfooterplain"}]
