<select name="[{$name}]"
        class="[{if $class}][{$class}][{/if}]"
        id="[{if $id}][{$id}][{/if}]"
        [{if $required}]required="required"[{/if}]>
    <option value="MRS" [{if $value|lower  == "mrs" or $value2|lower == "mrs"}]SELECTED[{/if}]>[{oxmultilang ident="MRS"}]</option>
    <option value="MR"  [{if $value|lower  == "mr"  or $value2|lower == "mr"}]SELECTED[{/if}]>[{oxmultilang ident="MR" }]</option>
</select>