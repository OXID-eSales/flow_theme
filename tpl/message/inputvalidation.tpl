[{assign var="sShopVersion" value=$oView->getShopVersion()}]

[{foreach from=$aErrors item="oError"}]
    <div class="alert alert-danger">[{$oError->getMessage()}]</div>
[{/foreach}]