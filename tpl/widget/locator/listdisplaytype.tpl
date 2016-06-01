[{assign var="listType" value=$oView->getListDisplayType()}]
[{assign var="_additionalParams" value=$oView->getAdditionalParams()}]
[{assign var="_artPerPage" value=$oViewConf->getArtPerPageCount()}]

[{if $oView->canSelectDisplayType()}]
    <div class="btn-group hidden-xs">
        <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">
            <strong>[{oxmultilang ident="LIST_DISPLAY_TYPE"}]</strong> [{oxmultilang ident=$listType}] <span class="caret"></span>
        </button>
        <ul class="dropdown-menu" role="menu">
            <li><a href="[{$oView->getLink()|oxaddparams:"ldtype=infogrid&amp;_artperpage=$_artPerPage&amp;pgNr=0&amp;$_additionalParams"}]" [{if $listType eq 'infogrid'}]class="selected" [{/if}]>[{oxmultilang ident="infogrid"}]</a></li>
            <li><a href="[{$oView->getLink()|oxaddparams:"ldtype=grid&amp;_artperpage=$_artPerPage&amp;pgNr=0&amp;$_additionalParams"}]" [{if $listType eq 'grid'}]class="selected" [{/if}]>[{oxmultilang ident="grid"}]</a></li>
            <li><a href="[{$oView->getLink()|oxaddparams:"ldtype=line&amp;_artperpage=$_artPerPage&amp;pgNr=0&amp;$_additionalParams"}]" [{if $listType eq 'line'}]class="selected" [{/if}]>[{oxmultilang ident="line"}]</a></li>
        </ul>
    </div>
[{/if}]