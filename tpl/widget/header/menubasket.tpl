<li>
    <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=basket"}]" rel="nofollow">
        <i class="fa fa-shopping-cart"></i>
        [{if isset($oxcmp_basket) && $oxcmp_basket->getItemsCount() > 0}]
            <span class="badge">
                [{ $oxcmp_basket->getItemsCount() }]
            </span>
        [{/if}]
    </a>
</li>
