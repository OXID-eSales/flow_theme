[{block name="footer_information"}]
    <ul class="information list-unstyled">
        [{oxifcontent ident="oximpressum" object="_cont"}]
            <li><a href="[{$_cont->getLink()}]">[{$_cont->oxcontents__oxtitle->value}]</a></li>
        [{/oxifcontent}]
        [{oxifcontent ident="oxagb" object="_cont"}]
            <li><a href="[{$_cont->getLink()}]">[{$_cont->oxcontents__oxtitle->value}]</a></li>
        [{/oxifcontent}]
        [{oxifcontent ident="oxsecurityinfo" object="oCont"}]
            <li><a href="[{$oCont->getLink()}]">[{$oCont->oxcontents__oxtitle->value}]</a></li>
        [{/oxifcontent}]
        [{oxifcontent ident="oxdeliveryinfo" object="oCont"}]
            <li><a href="[{$oCont->getLink()}]">[{$oCont->oxcontents__oxtitle->value}]</a></li>
        [{/oxifcontent}]
        [{oxifcontent ident="oxrightofwithdrawal" object="oCont"}]
            <li><a href="[{$oCont->getLink()}]">[{$oCont->oxcontents__oxtitle->value}]</a></li>
        [{/oxifcontent}]
        [{oxifcontent ident="oxorderinfo" object="oCont"}]
            <li><a href="[{$oCont->getLink()}]">[{$oCont->oxcontents__oxtitle->value}]</a></li>
        [{/oxifcontent}]
        [{oxifcontent ident="oxcredits" object="oCont"}]
            <li><a href="[{$oCont->getLink()}]">[{$oCont->oxcontents__oxtitle->value}]</a></li>
        [{/oxifcontent}]
        [{if $oViewConf->getViewThemeParam('blFooterShowNewsletter')}]
            <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=newsletter"}]">[{oxmultilang ident="NEWSLETTER"}]</a></li>
        [{/if}]
        [{if $oViewConf->getViewThemeParam('blFooterShowNews')}]
            <li><a href="[{oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=news"}]">[{oxmultilang ident="NEWS"}]</a></li>
        [{/if}]
    </ul>
[{/block}]