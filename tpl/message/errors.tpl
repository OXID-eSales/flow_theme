[{if !isset($Errors)}][{assign var="Errors" value=null}][{/if}]

[{if $Errors|is_array && !empty($Errors.default) && $Errors.default|is_array}]
    [{foreach from=$Errors.default item=oEr key=key}]
        <p class="alert alert-danger">[{$oEr->getOxMessage()}]</p>
    [{/foreach}]
[{/if}]
[{if $Errors|is_array && !empty($Errors.popup) && $Errors.popup|is_array}]
    [{include file="message/errors_modal.tpl"}]
[{/if}]