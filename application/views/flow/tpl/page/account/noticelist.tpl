[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="MY_WISH_LIST"|oxmultilangassign}]
     <h1 class="page-header">[{oxmultilang ident="MY_WISH_LIST"}]</h1>

    [{if $oView->getNoticeProductList()}]
        [{include file="widget/product/list.tpl" type="line" listId="noticelistProductList" title="" products=$oView->getNoticeProductList() removeFunction="tonoticelist" owishid=$oxcmp_user->oxuser__oxid->value}]
    [{else}]
        <p class="alert alert-info">[{oxmultilang ident="WISH_LIST_EMPTY"}]</p>
    [{/if}]

    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]
[{capture append="oxidBlock_sidebar"}]
    [{include file="page/account/inc/account_menu.tpl" active_link="noticelist"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]