[{assign var="oDetailsProduct" value=$oView->getProduct()}]
[{if $oView->showTags() && $oView->getTagCloudManager() && $oDetailsProduct && $oView->canChangeTags()}]
    <p>[{oxmultilang ident="HIGHLIHGT_TAGS"}]</p>
    <p class="tagCloud">
        [{assign var="oCloudManager" value=$oView->getTagCloudManager()}]
        [{assign var="oTagList" value=$oCloudManager->getTagList()}]
        [{foreach from=$oCloudManager->getCloudArray() item="oTag" key="sTagTitle" name="taglist"}]
            <span><span class="tagitem_[{$oCloudManager->getTagSize($sTagTitle)}]">[{$oTag->getTitle()}]</span> [{if $oTagList->canBeTagged($sTagTitle)}]<a href="#" class="tagText"><i class="fa fa-plus-sign"></i></a>[{/if}][{if !$smarty.foreach.taglist.last}],[{/if}]</span>
        [{/foreach}]
    </p>

    <p class="tagError" style="display: none;">[{oxmultilang ident="ALREADY_ADDED_TAG"}]</p>
    <form action="[{$oViewConf->getSelfActionLink()}]#tags" method="post" id="tagsForm" class="form-inline" role="form">
        <div>
        [{$oViewConf->getHiddenSid()}]
        [{$oViewConf->getNavFormParams()}]
        <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
        <input type="hidden" name="aid" value="[{$oDetailsProduct->oxarticles__oxid->value}]">
        <input type="hidden" name="anid" value="[{$oDetailsProduct->oxarticles__oxnid->value}]">
        <input type="hidden" id="tagsInput" name="highTags">
        <input type="hidden" name="fnc" value="addTags">
        <div class="form-group">
            <label for="newTags" class="sr-only">[{oxmultilang ident="ADD_TAGS"}]</label>
            <input class="form-control" type="text" name="newTags" id="newTags" maxlength="[{$oCloudManager->getTagMaxLength()}]" placeholder="[{oxmultilang ident="ADD_TAGS"}]">
        </div>
        <button class="submitButton btn btn-primary" id="saveTag" type="submit"><i class="fa fa-save"></i> [{oxmultilang ident="SUBMIT"}]</button>
        <button class="submitButton btn btn-danger" id="cancelTag" type="submit">&times; [{oxmultilang ident="CANCEL"}]</button>
    </div>
</form>
[{/if}]