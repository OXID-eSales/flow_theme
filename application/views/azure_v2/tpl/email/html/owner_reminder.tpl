[{assign var="shop"     value=$oEmailView->getShop()}]
[{assign var="oViewConf" value=$oEmailView->getViewConfig()}]

[{capture assign="style"}]
    table.orderarticles th {
    background-color: #ebebeb;
    white-space: nowrap;
    }

    table.orderarticles th, table.orderarticles td {
        border: 1px solid #d4d4d4;
        font-size: 13px;
        padding:5px;
    }

    table.orderarticles {
        border-collapse: collapse;
    }
[{/capture}]

[{include file="email/html/header.tpl" title="DD_OWNER_REMINDER_HEADING"|oxmultilangassign style=$style}]

<p>[{oxmultilang ident="MESSAGE_STOCK_LOW"}]</p>

<table class="orderarticles" border="0" cellspacing="0" cellpadding="0" width="100%">
    <thead>
        <tr>
            <th colspan="2">[{oxmultilang ident="PRODUCT"}]</th>
            <th class="text-right">[{oxmultilang ident="QUANTITY"}]</th>
        </tr>
    </thead>
    <tbody>
        [{foreach from=$articles item=oProduct}]
            <tr valign="top">
                <td>
                    <img src="[{$oProduct->getIconUrl(false)}]" border="0" hspace="0" vspace="0" alt="[{$oProduct->oxarticles__oxtitle->value|strip_tags}]" align="texttop">
                </td>
                <td>
                    <p>
                        <b>[{$oProduct->oxarticles__oxtitle->value}][{if $oProduct->oxarticles__oxvarselect->value}], [{$oProduct->oxarticles__oxvarselect->value}][{/if}]</b>
                        [{if $chosen_selectlist}]
                            ,
                            [{foreach from=$chosen_selectlist item=oList}]
                                [{$oList->name}] [{$oList->value}]&nbsp;
                            [{/foreach}]
                        [{/if}]
                        <br>
                        [{oxmultilang ident="PRODUCT_NO" suffix="COLON"}] [{$oProduct->oxarticles__oxartnum->value}]
                    </p>
                </td>
                <td align="right" class="text-right">[{$oProduct->oxarticles__oxstock->value}] ([{$oProduct->oxarticles__oxremindamount->value}])</td>
            </tr>
        [{/foreach}]
    </tbody>
</table>
<br/>

[{include file="email/html/footer.tpl"}]