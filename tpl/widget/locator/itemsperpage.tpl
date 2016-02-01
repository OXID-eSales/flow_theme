[{assign var="_additionalParams" value=$oView->getAdditionalParams()}]
[{assign var="listType" value=$oView->getListDisplayType()}]

<div class="btn-group">
    <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">
        <strong>[{oxmultilang ident="PRODUCTS_PER_PAGE"}]</strong>
        [{if $oViewConf->getArtPerPageCount()}]
            [{$oViewConf->getArtPerPageCount()}]
        [{else}]
            [{oxmultilang ident="CHOOSE"}]
        [{/if}]
        <span class="caret"></span>
    </button>
    <ul class="dropdown-menu" role="menu">
        [{foreach from=$oViewConf->getNrOfCatArticles() item=iItemsPerPage}]
            <li>
                <a href="[{$oView->getLink()|oxaddparams:"ldtype=$listType&amp;_artperpage=$iItemsPerPage&amp;pgNr=0&amp;$_additionalParams"}]" [{if $oViewConf->getArtPerPageCount() == $iItemsPerPage}] class="selected"[{/if}]>[{$iItemsPerPage}]</a>
            </li>
        [{/foreach}]
    </ul>
</div>