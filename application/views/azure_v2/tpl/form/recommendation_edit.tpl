<form action="[{$oViewConf->getSelfActionLink()}]" name="saverecommlist" method="post" class="form-horizontal">
    <div class="hidden">
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="fnc" value="saveRecommList">
        <input type="hidden" name="cl" value="account_recommlist">
        [{if $actvrecommlist}]
            <input type="hidden" name="recommid" value="[{$actvrecommlist->getId()}]">
        [{/if}]
    </div>
    
    <div class="form-group">
        <label class="control-label col-lg-3 req">[{oxmultilang ident="TITLE"}]</label>
        <div class="col-lg-9">
            <input type="text" name="recomm_title" class="form-control" maxlength="73" value="[{$actvrecommlist->oxrecommlists__oxtitle->value}]">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-lg-3">[{oxmultilang ident="AUTHOR"}]</label>
        <div class="col-lg-9">
            <input type="text" name="recomm_author" class="form-control" maxlength="73" value="[{if $actvrecommlist->oxrecommlists__oxauthor->value}][{$actvrecommlist->oxrecommlists__oxauthor->value}][{elseif !$actvrecommlist}][{$oxcmp_user->oxuser__oxfname->value}] [{$oxcmp_user->oxuser__oxlname->value}][{/if}]">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-lg-3">[{oxmultilang ident="INTRODUCTION"}]</label>
        <div class="col-lg-9">
            <textarea class="form-control" rows="8" name="recomm_desc">[{$actvrecommlist->oxrecommlists__oxdesc->value}]</textarea>
        </div>
    </div>
    <div class="form-group">
        <div class="col-lg-offset-3 col-lg-9">
            <button class="btn btn-primary" type="submit">[{oxmultilang ident="SAVE"}]</button>
            [{if $_actvrecommlist}]
                <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_recommlist"}]" class="btn btn-default" title="[{oxmultilang ident="DD_RECOMMENDATION_EDIT_BACK_TO_LIST"}]">
                    <i class="fa fa-list"></i> [{oxmultilang ident="DD_RECOMMENDATION_EDIT_BACK_TO_LIST"}]
                </a>
            [{/if}]
        </div>
    </div>
</form>
