[{block name="widget_locator_sort"}]
    [{if $oView->showSorting()}]
        [{assign var="_listType" value=$oView->getListDisplayType()}]
        [{assign var="_additionalParams" value=$oView->getAdditionalParams()}]
        [{assign var="_artPerPage" value=$oViewConf->getArtPerPageCount()}]
        [{assign var="_sortColumnVarName" value=$oView->getSortOrderByParameterName()}]
        [{assign var="_sortDirectionVarName" value=$oView->getSortOrderParameterName()}]

        <div class="btn-group">
            <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">
                <strong>[{oxmultilang ident="SORT_BY"}]:</strong>
                [{if $oView->getListOrderBy()}]
                    [{oxmultilang ident=$oView->getListOrderBy()|upper }]
                [{else}]
                    [{oxmultilang ident="CHOOSE"}]
                [{/if}]
                <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" role="menu">
                [{foreach from=$oView->getSortColumns() item=sColumnName}]
                    <li class="desc[{if $oView->getListOrderDirection() == 'desc' && $sColumnName == $oView->getListOrderBy()}] active[{/if}]">
                        <a href="[{$oView->getLink()|oxaddparams:"ldtype=$_listType&amp;_artperpage=$_artPerPage&amp;$_sortColumnVarName=$sColumnName&amp;$_sortDirectionVarName=desc&amp;pgNr=0&amp;$_additionalParams"}]" title="[{oxmultilang ident=$sColumnName|upper}] [{oxmultilang ident="DD_SORT_DESC"}]">
                            <i class="fa fa-caret-down"></i> [{oxmultilang ident=$sColumnName|upper}]
                        </a>
                    </li>
                    <li class="asc[{if $oView->getListOrderDirection() == 'asc' && $sColumnName == $oView->getListOrderBy()}] active[{/if}]">
                        <a href="[{$oView->getLink()|oxaddparams:"ldtype=$_listType&amp;_artperpage=$_artPerPage&amp;$_sortColumnVarName=$sColumnName&amp;$_sortDirectionVarName=asc&amp;pgNr=0&amp;$_additionalParams"}]" title="[{oxmultilang ident=$sColumnName|upper}] [{oxmultilang ident="DD_SORT_ASC"}]">
                            <i class="fa fa-caret-up"></i> [{oxmultilang ident=$sColumnName|upper}]
                        </a>
                    </li>
                [{/foreach}]
            </ul>
        </div>
    [{/if}]
[{/block}]