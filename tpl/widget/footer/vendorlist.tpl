[{assign var="vendors" value=$oView->getVendorlist()}]
[{if $vendors->count()}]
    [{block name="footer_vendors"}]
        <ul class="vendors list-unstyled">
          [{foreach from=$vendors item=_vnd}]
          <li><a href="[{$_vnd->getLink()}]" [{if $_vnd->expanded}]class="exp"[{/if}]>[{$_vnd->oxvendor__oxtitle->value}]</a></li>
          [{/foreach}]
        </ul>
    [{/block}]
[{/if}]