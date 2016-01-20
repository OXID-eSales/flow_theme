[{if $oxcmp_user}]
    [{if !$oView->floodProtection()}]
        <form class="form-horizontal" action="[{$oViewConf->getSelfActionLink()}]" method="post" id="guestbook" role="form">
            <div class="hidden">
                [{$oViewConf->getHiddenSid()}]
                [{$oViewConf->getNavFormParams()}]
                [{oxid_include_dynamic file="form/formparams.tpl"}]
                <input type="hidden" name="fnc" value="saveEntry">
                <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
            </div>
            <div class="form-group">
                <label class="control-label col-lg-2">[{oxmultilang ident="MESSAGE"}]</label>
                <div class="col-lg-6">
                    <textarea rows="10" name="rvw_txt" class="form-control"></textarea>
                </div>
                <div class="col-lg-4"></div>
            </div>

            <div class="form-group">
                <div class="col-lg-offset-2 col-lg-6">
                    <button id="reviewSave" type="submit" class="btn btn-primary">[{oxmultilang ident="CLICK_HERE_TO_WRITE_ENTRY"}]</button>
                </div>
                <div class="col-lg-4"></div>
            </div>
        </form>
    [{/if}]
[{else}]
    <div class="alert alert-info">
        [{oxmultilang ident="MESSAGE_TO_BE_LOGGED_WRITE_GUESTBOOK"}]
        <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" params="sourcecl="|cat:$oViewConf->getActiveClassName()|cat:$oViewConf->getNavUrlParams()}]" class="pull-right btn btn-default">[{oxmultilang ident="LOGIN"}]</a>
        <div class="clearfix"></div>
    </div>
[{/if}]
