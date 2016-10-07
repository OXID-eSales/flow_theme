[{assign var="shop"      value=$oEmailView->getShop()}]
[{assign var="oViewConf" value=$oEmailView->getViewConfig()}]
[{assign var="userInfo"      value=$oEmailView->getUser()}]

[{include file="email/html/header.tpl" title="DD_SUGGEST_HEADING"|oxmultilangassign}]

<table border="0" width="100%" cellspacing="10" cellpadding="0">
    <tr>
        <td style="white-space:nowrap;">
            <b style="white-space:nowrap;">[{oxmultilang ident="FROM"}]</b>
        </td>
        <td style="white-space:nowrap;">[{$userInfo->send_name|oxescape}]</td>
    </tr>
    <tr>
        <td style="white-space:nowrap;">
            <b style="white-space:nowrap;">[{oxmultilang ident="EMAIL"}]</b>
        </td>
        <td style="white-space:nowrap;">[{$userInfo->send_email|oxescape}]</td>
    </tr>
    <tr>
        <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
        <td style="white-space:nowrap;">
            <b style="white-space:nowrap;">[{oxmultilang ident="TO"}]</b>
        </td>
        <td style="white-space:nowrap;">[{$userInfo->rec_name|oxescape}]</td>
    </tr>
    <tr>
        <td style="white-space:nowrap;">
            <b style="white-space:nowrap;">[{oxmultilang ident="EMAIL"}]</b>
        </td>
        <td style="white-space:nowrap;">[{$userInfo->rec_email|oxescape}]</td>
    </tr>
    <tr>
        <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2">[{$userInfo->send_message|oxescape|nl2br}]</td>
    </tr>
</table>
<br>

<p>[{oxmultilang ident="MANY_GREETINGS"}] [{$userInfo->send_name|oxescape}]</p>
<br>

<p class="lead">
    <a href="[{$sArticleUrl}]"><b>[{$product->oxarticles__oxtitle->value}]</b></a>
    [{if $product->oxarticles__oxshortdesc->value}]
        <br>[{$product->oxarticles__oxshortdesc->value}]
    [{/if}]
</p>
<br>

<p>
    <a href="[{$sArticleUrl}]">
        <img src="[{$product->getThumbnailUrl()}]" border="0" hspace="0" vspace="0" alt="[{$product->oxarticles__oxtitle->value|strip_tags}]">
    </a>
</p>
<br>

[{include file="email/html/footer.tpl"}]