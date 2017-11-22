[{if count($Errors.default) > 0}]
    [{foreach from=$Errors.default item=oEr key=key}]
        <p class="alert alert-danger">[{$oEr->getOxMessage()}]</p>
    [{/foreach}]
[{/if}]
[{if count($Errors.popup) > 0 }]
    [{include file="message/errors_modal.tpl"}]
[{/if}]