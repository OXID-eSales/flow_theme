[{block name="widget_locator_paging"}]
    [{if $pages->changePage}]
        <ol class="pagination pagination-sm[{if $place eq "bottom"}] lineBox[{/if}]" id="itemsPager[{$place}]">
            <li class="prev[{if !$pages->previousPage}] disabled[{/if}]">
                [{if $pages->previousPage}]
                    <a href="[{$pages->previousPage}]">&larr; [{oxmultilang ident="PREVIOUS"}]</a>
                [{else}]
                    <span>&larr; [{oxmultilang ident="PREVIOUS"}]</span>
                [{/if}]
            </li>

            [{assign var="i" value=1}]
            [{foreach key=iPage from=$pages->changePage item=page}]
                [{if $iPage == $i}]
                    <li[{if $iPage == $pages->actPage}] class="active"[{/if}]>
                        <a href="[{$page->url}]">[{$iPage}]</a>
                    </li>
                   [{assign var="i" value=$i+1}]
                [{elseif $iPage > $i}]
                    <li class="disabled">
                        <span>...</span>
                    </li>
                    <li[{if $iPage == $pages->actPage}] class="active"[{/if}]>
                        <a href="[{$page->url}]">[{$iPage}]</a>
                    </li>
                    [{assign var="i" value=$iPage+1}]
                [{elseif $iPage < $i}]
                    <li[{if $iPage == $pages->actPage}] class="active"[{/if}]>
                        <a href="[{$page->url}]">[{$iPage}]</a>
                    </li>
                    <li class="disabled">
                        <span>...</span>
                    </li>
                   [{assign var="i" value=$iPage+1}]
                [{/if}]
            [{/foreach}]

            <li class="next[{if !$pages->nextPage}] disabled[{/if}]">
                [{if $pages->nextPage}]
                    <a href="[{$pages->nextPage}]">[{oxmultilang ident="NEXT"}] &rarr;</a>
                [{else}]
                    <span>[{oxmultilang ident="NEXT"}] &rarr;</span>
                [{/if}]
            </li>
         </ol>
    [{/if}]
[{/block}]