[{assign var="oDetailsProduct" value=$oView->getProduct()}]
[{assign var="currency" value=$oView->getActCurrency()}]
[{assign var="oPictureProduct" value=$oView->getPicturesProduct()}]

[{block name="fullproductinfo_init_details_page"}][{/block}]

[{*[{oxscript add="$( '#variants' ).oxArticleVariant();"}]*}]
[{include file="page/details/inc/fullproductinfo.tpl"}]

[{oxscript}]
