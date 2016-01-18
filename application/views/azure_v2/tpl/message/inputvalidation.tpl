[{assign var="sShopVersion" value=$oView->getShopVersion()}]

[{if $sShopVersion|@version_compare:'4.9.0':'>='}]
    [{foreach from=$aErrors item="oError"}]
        <div class="alert alert-danger">[{$oError->getMessage()}]</div>
    [{/foreach}]
[{else}]
    [{foreach from=$aErrors item="oError"}]
        <div class="alert alert-danger">[{oxmultilang ident=$oError->getMessage()}]</div>
    [{/foreach}]
[{/if}]