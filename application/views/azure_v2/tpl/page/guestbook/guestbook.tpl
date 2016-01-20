[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="GUESTBOOK"|oxmultilangassign}]
    <h1 class="page-header">[{oxmultilang ident="GUESTBOOK"}]</h1>

    <div class="row reviews">
        <div class="col-xs-12">
            [{include file="form/guestbook.tpl"}]
        </div>
    </div>

    [{if $oView->getEntries()}]
        <div class="row">
            <div class="col-xs-10">
                <h2 class="page-header">[{oxmultilang ident="DD_GUESTBOOK_ENTRIES"}]</h2>
            </div>
            <div class="spacer"></div>
            <div class="col-xs-2">
                <div class="pull-right">
                    [{include file="widget/locator/listlocator.tpl" sort=true}]
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    [{/if}]

    <div class="row entries">
        <div class="col-xs-12">
            [{if $oView->getEntries()}]
                <ol class="list-unstyled">
                    [{foreach from=$oView->getEntries() item=entry}]
                        <li class="clear item">
                            <blockquote>
                                <p>[{$entry->oxgbentries__oxcontent->value|nl2br}]</p>
                                <small>[{oxmultilang ident="DD_GUESTBOOK_ENTRY_FROM"}] [{$entry->oxuser__oxfname->value}] [{oxmultilang ident="DD_GUESTBOOK_ENTRY_ON"}]  [{$entry->oxgbentries__oxcreate->value|date_format:"%d.%m.%Y"}] [{$entry->oxgbentries__oxcreate->value|date_format:"%H:%M"}]</small>
                            </blockquote>
                        </li>
                    [{/foreach}]
                </ol>
            [{else}]
                <p class="alert alert-info">[{oxmultilang ident="NO_ENTRY_AVAILABLE"}]</p>
            [{/if}]
        </div>
    </div>

    [{if $oView->getEntries()}]
        <div class="row listlocator">
            <div class="col-xs-12">
                [{include file="widget/locator/listlocator.tpl" locator=$oView->getPageNavigation() place="bottom"}]
            </div>
        </div>
    [{/if}]

    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]
