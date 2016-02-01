[{assign var="shop"      value=$oEmailView->getShop()}]
[{assign var="oViewConf" value=$oEmailView->getViewConfig()}]
[{assign var="userinfo"  value=$oEmailView->getUser()}]

[{include file="email/html/header.tpl" title="DD_INVITE_HEADING"|oxmultilangassign}]

<table border="0" width="100%" cellspacing="10" cellpadding="0" bgcolor="#FFFFFF">
    <tr>
        <td style="white-space:nowrap;">
            <b style="white-space:nowrap;">[{oxmultilang ident="FROM"}]</b>
        </td>
        <td style="white-space:nowrap;">[{$userinfo->send_name|oxescape}]</td>
    </tr>
    <tr>
        <td style="white-space:nowrap;">
            <b style="white-space:nowrap;">[{oxmultilang ident="EMAIL"}]</b>
        </td>
        <td style="white-space:nowrap;">[{$userinfo->send_email|oxescape}]</td>
    </tr>
    <tr>
        <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2">[{$userinfo->send_message|oxescape|nl2br}]</td>
    </tr>
    <tr>
        <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2">[{oxmultilang ident="DD_INVITE_LINK"}]: <a href="[{$sHomeUrl}]">[{$shop->oxshops__oxname->value}]</a></td>
    </tr>
    <tr>
        <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2">[{oxmultilang ident="MANY_GREETINGS"}] [{$userinfo->send_name|oxescape}]</td>
    </tr>
</table>
<br/>

[{include file="email/html/footer.tpl"}]
