[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="MY_DOWNLOADS"|oxmultilangassign}]
    <h1 class="page-header">[{oxmultilang ident="MY_DOWNLOADS"}]</h1>
    [{if $oView->getOrderFilesList()|count}]
    <ol class="list-unstyled downloadList">
        [{foreach from=$oView->getOrderFilesList() item="oOrderArticle"}]
            <li>
                [{foreach from=$oOrderArticle.oxorderfiles item="oOrderFile"}]
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-9">
                                    <strong>[{$oOrderArticle.oxarticletitle}]</strong> &ndash; [{oxmultilang ident="ORDER_NUMBER"}]: [{$oOrderArticle.oxordernr}], [{$oOrderArticle.oxorderdate|date_format:"%d.%m.%Y"}]
                                </div>
                                <div class="col-xs-3">
                                    [{if $oOrderFile->isPaid() || !$oOrderFile->oxorderfiles__oxpurchasedonly->value }]
                                        <a class="btn btn-success btn-xs pull-right" href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=download" params="sorderfileid="|cat:$oOrderFile->getId()}]" title="[{$oOrderFile->oxorderfiles__oxfilename->value}] [{oxmultilang ident="DD_DOWNLOADS_DOWNLOAD_TOOLTIP"}]">
                                            <i class="fa fa-download"></i> [{oxmultilang ident="DD_DOWNLOADS_DOWNLOAD_TOOLTIP"}]
                                        </a>
                                    [{/if}]
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            [{if $oOrderFile->isPaid() || !$oOrderFile->oxorderfiles__oxpurchasedonly->value }]
                                [{if $oOrderFile->isValid()}]
                                    <strong>[{oxmultilang ident="DD_FILE_ATTRIBUTES_FILENAME"}]</strong> [{$oOrderFile->oxorderfiles__oxfilename->value}]<br>
                                    [{include file="page/account/inc/file_attributes.tpl"}]
                                [{else}]
                                    [{$oOrderFile->oxorderfiles__oxfilename->value}]
                                    [{oxmultilang ident="DOWNLOAD_LINK_EXPIRED_OR_MAX_COUNT_RECEIVED"}]
                                [{/if}]
                            [{else}]
                                <span class="downloadableFile pending">[{$oOrderFile->oxorderfiles__oxfilename->value}]</span>
                                <strong>[{oxmultilang ident="DOWNLOADS_PAYMENT_PENDING"}]</strong>
                            [{/if}]
                        </div>
                    </div>
                [{/foreach}]
            </li>
        [{/foreach}]
    </ol>
    [{else}]
        <p class="alert alert-info">[{oxmultilang ident="DOWNLOADS_EMPTY"}]</p>
    [{/if}]

    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]
[{capture append="oxidBlock_sidebar"}]
    [{include file="page/account/inc/account_menu.tpl" active_link="downloads"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]