[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="TAGS"|oxmultilangassign}]
    [{if $oView->getTagCloudManager()}]
        <h1 class="page-header" id="tags">[{oxmultilang ident="TAGS"}]</h1>
        <div >
            <p id="tagsCloud">
                [{assign var="oTagsManager" value=$oView->getTagCloudManager()}]
                [{foreach from=$oTagsManager->getCloudArray() item="oTag" key=sTagTitle}]
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
                    <a class="label [{$sTagPriority}] tagitem_[{$oTagsManager->getTagSize($oTag->getTitle())}]" href="[{$oTag->getLink()}]">[{$oTag->getTitle()}]</a>
                [{/foreach}]
            </p>
        </div>
    [{/if}]
    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]