[{capture append="oxidBlock_pageBody"}]
    <div id="wrapper">
        <div id="content" class="container">
            <div class="main-container">
                [{foreach from=$oxidBlock_content item="_block"}][{$_block}][{/foreach}]
             </div>
        </div>
    </div>
[{/capture}]
[{include file="layout/base.tpl"}]