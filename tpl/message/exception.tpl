[{capture append="oxidBlock_content"}]
    [{assign var="template_title" value="MY_DOWNLOADS"|oxmultilangassign}]
    <div class="errorBox">
        [{if $Errors|is_array && $Errors.default|is_array && !empty($Errors.default)}]
          <div class="status error corners">
              [{foreach from=$Errors.default item=oEr key=key}]
                  <p>[{$oEr->getOxMessage()}]</p>

                  <p class="stackTrace">[{$oEr->getStackTrace()|nl2br}];</p>
              [{/foreach}]
          </div>
          [{/if}]
    </div>

    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]

[{capture append="oxidBlock_sidebar"}]
    [{include file="page/account/inc/account_menu.tpl" active_link="downloads"}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Left"}]