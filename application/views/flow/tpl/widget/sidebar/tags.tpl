[{block name="dd_widget_sidebar_tags"}]
    [{assign var="oTagsManager" value=$oView->getTagCloudManager()}]

    [{if $oView->getTagCloudManager()}]

        [{if $oView->displayInBox()}]
            [{* Display tags in separate box *}]
            <div id="tagBox" class="box tagCloud">
                <div class="content">
        [{else}]
            <div class="categoryTagsBox">
                <div class="categoryTags">
        [{/if}]
        [{foreach from=$oTagsManager->getCloudArray() item="oTag" key="sTagTitle"}]
            [{assign var="iTagSize" value=$oTagsManager->getTagSize($sTagTitle)}]
            [{assign var="sTagPriority" value="label-default"}]
            [{if $iTagSize < 100}]
                [{assign var="sTagPriority" value="label-primary"}]
            [{elseif $iTagSize < 200}]
                [{assign var="sTagPriority" value="label-info"}]
            [{elseif $iTagSize < 300}]
                [{assign var="sTagPriority" value="label-warning"}]
            [{elseif $iTagSize < 400}]
                [{assign var="sTagPriority" value="label-danger"}]
            [{/if}]
            <a class="label [{$sTagPriority}] tagitem_[{$oTagsManager->getTagSize($sTagTitle)}]" href="[{$oTag->getLink()}]">[{$oTag->getTitle()}]</a>
        [{/foreach}]

        [{if $oView->isMoreTagsVisible()}]
            [{block name="dd_widget_sidebar_tags_morelink"}]
                <p class="text-right">
                    <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=tags"}]" class="btn btn-primary btn-sm">[{oxmultilang ident="MORE"}]</a>
                </p>
            [{/block}]
        [{/if}]
            </div>
        </div>
    [{/if}]
[{/block}]
