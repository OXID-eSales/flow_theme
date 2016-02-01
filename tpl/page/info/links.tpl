[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="LINKS"|oxmultilangassign}]
    <h1 class="page-header">[{oxmultilang ident="LINKS"}]</h1>

    [{assign var="aLinkList" value=$oView->getLinksList()}]
    [{if $aLinkList|@count > 0}]
        <ul class="list-unstyled">
            [{foreach from=$oView->getLinksList() item=link name=linksList}]
                <li>
                    <h2>
                        <a href="[{$link->oxlinks__oxurl->value}]" target="_blank">[{$link->oxlinks__oxurl->value}]</a>
                        <small>&ndash; [{$link->oxlinks__oxinsert->value|date_format:"%d.%m.%Y"}]</small>
                    </h2>
                    <article>[{$link->oxlinks__oxurldesc->value}]</article>
                </li>
            [{/foreach}]
        </ul>
    [{else}]
        <p class="alert alert-info">[{oxmultilang ident="DD_LINKS_NO_ENTRIES"}]</p>
    [{/if}]
    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]

[{include file="layout/page.tpl" sidebar="Left"}]