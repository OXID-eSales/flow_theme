[{assign var="oDetailsProduct" value=$oView->getProduct()}]
[{assign var="currency" value=$oView->getActCurrency()}]
[{assign var="oPictureProduct" value=$oView->getPicturesProduct()}]

[{if $oViewConf->getFbAppId()}]
    [{oxscript add="$(function(){oxFacebook.initDetailsPagePartial();});"}]
[{/if}]

[{*[{oxscript add="$( '#variants' ).oxArticleVariant();"}]*}]
[{include file="page/details/inc/fullproductinfo.tpl"}]

[{oxscript}]
