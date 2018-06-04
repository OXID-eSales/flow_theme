[{foreach from=$aErrors item="oError"}]
    <div class="alert alert-danger">[{$oError->getMessage()}]</div>
[{/foreach}]
