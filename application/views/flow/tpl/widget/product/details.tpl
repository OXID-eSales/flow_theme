[{include file="page/details/details.tpl" blWorkaroundInclude=true}]

[{assign var="oDetailsProduct" value=$oView->getProduct()}]

[{insert name="oxid_tracker" title="PRODUCT_DETAILS"|oxmultilangassign product=$oDetailsProduct cpath=$oView->getCatTreePath() }]
[{oxscript widget=$oView->getClassName()}]
