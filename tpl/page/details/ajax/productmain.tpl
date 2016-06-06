[{assign var="oDetailsProduct" value=$oView->getProduct()}]
[{assign var="currency" value=$oView->getActCurrency()}]
[{assign var="oPictureProduct" value=$oView->getPicturesProduct()}]

[{block name="productmain_init_details_page"}][{/block}]

[{if $oView->showZoomPics()}]
    [{oxscript add="if( !window.isMobileDevice() ) $('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();"}]
[{/if}]

[{oxscript add="$( '#variants' ).oxArticleVariant();"}]
[{include file="page/details/inc/productmain.tpl"}]

[{oxscript widget=$oView->getClassName()}]
