[{if $oView->isActive('FacebookConfirm') && !$oView->isFbWidgetVisible()}]
    [{include file=$source assign="file"}]
    [{assign var="file" value=$file|strip|escape:'url'}]
    [{oxscript add="oxFacebook.buttons['`$ident`']={html:'`$file`',script:'`$script`'};"}]
    [{if $type == "text"}]
        <a class="oxfbenable fbEnableLink" href="#">[{oxmultilang ident="FACEBOOK_ENABLELINK"}]</a>
        <p class="fbEnableDesc">
            <i class="fa fa-facebook-square"></i> [{oxmultilang ident="FACEBOOK_ENABLETEXT"}]<br>
            <a href="#" class="oxfbinfo">[{oxmultilang ident="FACEBOOK_ENABLEINFOLINK"}]</a>
        </p>
    [{else}]
        <div class="btn-group">
            <a href="#" class="btn btn-default btn-sm oxfbenable fbEnableButton"><i class="fa fa-facebook-square"></i> [{oxmultilang ident="ENABLE"}]</a>
            <a href="#" class="oxfbinfo helpText btn btn-default btn-sm" data-toggle="modal" data-target="#fbinfo">?</a>
        </div>
    [{/if}]
[{else}]
    [{include file=$source}]
    [{if $script}]<script src="[{$script}]"></script>[{/if}]
[{/if}]