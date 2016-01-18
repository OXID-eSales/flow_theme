[{capture append="oxidBlock_content"}]
    <div class="err-404">
        <h1 class="page-header">[{oxmultilang ident="MESSAGE_ERR_404TITLE"}]</h1>
        <div class="row">
            <div class="col-md-6">
                <p>
                    [{if $sUrl}]
                    [{oxmultilang ident="MESSAGE_ERR_404_PREURL"}] <i><strong>'[{$sUrl|escape}]'</strong></i> [{oxmultilang ident="MESSAGE_ERR_404_POSTURL"}]
                    [{else}]
                    [{oxmultilang ident="MESSAGE_ERR_404"}]
                    [{/if}]
                </p>

                <p>
                    [{oxmultilang ident="DD_ERR_404_START_TEXT"}]<br>
                    <a href="[{$oViewConf->getHomeLink()}]" class="btn btn-default" title="[{oxmultilang ident="DD_ERR_404_START_BUTTON"}]">[{oxmultilang ident="DD_ERR_404_START_BUTTON"}]</a>
                </p>

                <p>
                    [{oxmultilang ident="DD_ERR_404_CONTACT_TEXT"}]<br>
                    <a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=contact"}]" class="btn btn-default" title="[{oxmultilang ident="DD_ERR_404_CONTACT_BUTTON"}]">[{oxmultilang ident="DD_ERR_404_CONTACT_BUTTON"}]</a>
                </p>
            </div>
            <div class="col-md-6">
                <div class="gears-box hidden-xs">
                    <div class="paper-overlay"></div>
                    <img class="gear-rotate reverse" style="top: -55px; left: 65px;" src="[{$oViewConf->getImageUrl('404/gear.png')}]">
                    <img class="gear-rotate" style="top: 177px; left: -11px;" src="[{$oViewConf->getImageUrl('404/gear.png')}]">
                    <img class="gear-rotate" style="top: 19px; right: -26px;" src="[{$oViewConf->getImageUrl('404/gear.png')}]">
                </div>
            </div>
        </div>
    </div>
[{/capture}]
[{include file="layout/page.tpl" blHideBreadcrumb=true}]