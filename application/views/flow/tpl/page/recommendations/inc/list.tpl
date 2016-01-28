[{assign var="searchrecomm" value=$oView->getRecommSearch()}]
[{if $oView->getRecommLists()|@count gt 0}]
    <ul class="list-unstyled" id="recommendationsLists">
        [{foreach from=$oView->getRecommLists() item=recommlist name="testRecList"}]
            [{block name="redommendations_list_content"}]
                <li>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            [{assign var="editclass" value=$oViewConf->getActiveClassName()}]
                            [{if $blEdit}]
                                [{assign var="editclass" value="account_recommlist&amp;fnc=editList"}]
                            [{/if}]
                            <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=`$editclass`" params="recommid=`$recommlist->oxrecommlists__oxid->value`&amp;searchrecomm=`$searchrecomm`"}]" class="lead" title="[{$recommlist->oxrecommlists__oxtitle->value}]">[{$recommlist->oxrecommlists__oxtitle->value}]</a>
                            <small class="text-muted">[{oxmultilang ident="LIST_BY"}] <strong>[{$recommlist->oxrecommlists__oxauthor->value}]</strong></small>

                            [{if $blEdit}]
                                <form action="[{$oViewConf->getSelfActionLink()}]" method="post" class="form-inline pull-right">
                                    <div class="hidden">
                                        [{$oViewConf->getHiddenSid()}]
                                        <input type="hidden" name="cl" value="account_recommlist">
                                        <input type="hidden" name="fnc" value="editList">
                                        <input type="hidden" name="recommid" value="[{$recommlist->getId()}]">
                                    </div>
                                    <button class="btn btn-warning btn-xs hasTooltip" type="submit" name="editList" title="[{oxmultilang ident="EDIT"}]">
                                        <i class="fa fa-pencil"></i>
                                    </button>
                                    <button class="btn btn-danger btn-xs hasTooltip" type="submit" name="deleteList" value="1" title="[{oxmultilang ident="REMOVE"}]">
                                        <i class="fa fa-times"></i>
                                    </button>
                                </form>
                                <div class="clearfix"></div>
                            [{/if}]

                        </div>
                        <div class="panel-body">[{$recommlist->oxrecommlists__oxdesc->value}]</div>
                    </div>

                </li>
            [{/block}]
        [{/foreach}]
    </ul>
[{else}]
    <p class="alert alert-info">[{oxmultilang ident="NO_LISTMANIA_LIST_FOUND"}]</p>
[{/if}]