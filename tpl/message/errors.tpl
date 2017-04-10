[{if count($Errors)>0 && ( count($Errors.default) > 0 || count($Errors.popup) > 0 )}]
    [{foreach from=$Errors.default item=oEr key=key}]
        <p class="alert alert-danger">[{$oEr->getOxMessage()}]</p>
    [{/foreach}]
    [{foreach from=$Errors.popup item=oEr key=key}]
        <p class="alert alert-danger">[{$oEr->getOxMessage()}]</p>
    [{/foreach}]
[{/if}]