[{capture append="oxidBlock_content"}]
    <h1 class="page-header">[{$oView->getTitle()}]</h1>

    <ol>
        <li>[{oxmultilang ident="MESSAGE_ENTER_YOUR_ADDRESS_AND_MESSAGE"}]</li>
        <li>[{oxmultilang ident="MESSAGE_RECOMMEND_CLICK_ON_SEND"}]</li>
    </ol>

    [{oxifcontent ident="oxsecurityinfo" object="oCont"}]
        <p>[{oxmultilang ident="MESSAGE_READ_DETAILS"}] <a href="[{$oCont->getLink()}]">[{$oCont->oxcontents__oxtitle->value}]</a></p>
    [{/oxifcontent}]

    [{include file="form/suggest.tpl"}]
    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]
[{include file="layout/page.tpl" sidebar="Right"}]