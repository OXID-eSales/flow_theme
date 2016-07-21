[{oxscript}]

[{assign var="oConfig" value=$oViewConf->getConfig()}]

<script type="text/javascript">[{strip}]
    var sBaseUrl = '[{$oViewConf->getSelfActionLink()}]';
    var sActCl = '[{$oViewConf->getTopActiveClassName()}]';
[{/strip}]</script>

[{* Google Analytics Page Tracking *}]
[{assign var="sGATrackingId" value=$oViewConf->getViewThemeParam('sGATrackingId')}]
[{if $oViewConf->getViewThemeParam('blUseGAPageTracker') && $sGATrackingId}]
    <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

        ga('create', '[{$sGATrackingId}]');
        [{* IP-Adressen anonymisieren *}]
        [{if $oViewConf->getViewThemeParam('blGAAnonymizeIPs')}]
            ga('set', 'anonymizeIp', true);
        [{/if}]
        ga('send', 'pageview');
    </script>
[{/if}]

[{* Google Analytics eCommerce Tracking *}]
[{if $oViewConf->getViewThemeParam('blUseGAEcommerceTracking') && $sGATrackingId && $oViewConf->getTopActiveClassName() == 'thankyou'}]
    [{assign var="oOrder" value=$oView->getOrder()}]

    [{if $oOrder}]
        [{if !$oViewConf->getViewThemeParam('blUseGAPageTracker')}]
            <script>
                (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
                })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

                ga('create', '[{$sGATrackingId}]');
                [{* IP-Adressen anonymisieren *}]
                [{if $oViewConf->getViewThemeParam('blGAAnonymizeIPs')}]
                    ga('set', 'anonymizeIp', true);
                [{/if}]
            </script>
        [{/if}]


        <script>
            ga( 'require', 'ecommerce' );

            ga( 'ecommerce:addTransaction', {
                'id': '[{$oOrder->oxorder__oxordernr->value}]',           // Transaction ID. Required.
                'affiliation': '[{$oxcmp_shop->oxshops__oxname->value}]', // Affiliation or store name.
                'revenue': '[{$oOrder->oxorder__oxtotalordersum->value}]', // Grand Total.
                'shipping': '[{$oOrder->oxorder__oxdelcost->value}]',     // Shipping.
                'tax': '[{math equation="x+y" x=$oOrder->oxorder__oxartvatprice1->value y=$oOrder->oxorder__oxartvatprice2->value}]' // Tax.
            });

            [{foreach from=$oOrder->getOrderArticles() item="oOrderArticle"}]
                [{assign var="sArticleName" value=$oOrderArticle->oxorderarticles__oxtitle->value|cat:' '|cat:$oOrderArticle->oxorderarticles__oxselvariant->value}]
                [{assign var="sCategoryName" value=""}]
                [{assign var="oOrderArticlePrice" value=$oOrderArticle->getPrice()}]
                [{assign var="oArticle" value=$oOrderArticle->getArticle()}]
                [{if $oArticle}]
                    [{assign var="oMainCategory" value=$oArticle->getCategory()}]
                    [{if $oMainCategory}]
                        [{assign var="sCategoryName" value=$oMainCategory->oxcategories__oxtitle->value}]
                    [{/if}]
                [{/if}]
                ga( 'ecommerce:addItem', {
                    'id': '[{$oOrder->oxorder__oxordernr->value}]',                     // Transaction ID. Required.
                    'name': '[{$sArticleName|trim}]',                                   // Product name. Required.
                    'sku': '[{$oOrderArticle->oxorderarticles__oxartnum->value}]',      // SKU/code.
                    'category': '[{$sCategoryName}]',                                   // Category or variation.
                    'price': '[{$oOrderArticlePrice->getBruttoPrice()}]',               // Unit price.
                    'quantity': '[{$oOrderArticle->oxorderarticles__oxamount->value}]', // Quantity.
                    'currency': '[{$oOrder->oxorder__oxcurrency->value}]'               // local currency code.
                });
            [{/foreach}]

            ga('ecommerce:send' );
        </script>
    [{/if}]
[{/if}]

[{* Google zertifizierte Händler *}]
[{if $oViewConf->getViewThemeParam('blUseGoogleTS')}]
    [{assign var="sGoogleVendorId" value=$oViewConf->getViewThemeParam('sGoogleVendorId')}]
    [{assign var="sGoogleShoppingAccountId" value=$oViewConf->getViewThemeParam('sGoogleShoppingAccountId')}]
    [{assign var="sPageLanguage" value=$oViewConf->getViewThemeParam('sPageLanguage')}]
    [{assign var="sShoppingCountry" value=$oViewConf->getViewThemeParam('sShoppingCountry')}]
    [{assign var="sShoppingLanguage" value=$oViewConf->getViewThemeParam('sShoppingLanguage')}]

    [{if $oViewConf->getTopActiveClassName() == 'details'}]
        [{assign var="oArticle" value=$oView->getProduct()}]
        [{assign var="sGoogleShoppingProductId" value=$oArticle->oxarticles__oxartnum->value}]
    [{/if}]

    [{if $sGoogleVendorId && $sPageLanguage}]
        [{* Händler-Gütesiegelcode *}]
        <script type="text/javascript">
            var gts = gts || [];

            gts.push(["id", "[{$sGoogleVendorId}]"]);
            gts.push(["badge_position","BOTTOM_RIGHT"]);
            gts.push(["locale", "[{$sPageLanguage|default:'de_DE'}]"]);
            [{if $sGoogleShoppingAccountId}]
                gts.push(["google_base_subaccount_id", "[{$sGoogleShoppingAccountId}]"]);
                gts.push(["google_base_offer_id", "[{$sGoogleShoppingProductId}]"]);
                [{if $sShoppingCountry}]
                    gts.push(["google_base_country", "[{$sShoppingCountry|default:'DE'}]"]);
                [{/if}]
                [{if $sShoppingLanguage}]
                    gts.push(["google_base_language", "[{$sShoppingLanguage|default:'de'}]"]);
                [{/if}]
            [{/if}]

            (function() {
                var gts = document.createElement("script");
                gts.type = "text/javascript";
                gts.async = true;
                gts.src = "https://www.googlecommerce.com/trustedstores/api/js";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(gts, s);
            })();
        </script>

        [{* Bestellbestätigungs-Modul *}]
        [{if $oViewConf->getTopActiveClassName() == 'thankyou'}]
            [{assign var="sShippingDaysOnStock"    value=$oViewConf->getViewThemeParam('sShippingDaysOnStock')}]
            [{assign var="sShippingDaysNotOnStock" value=$oViewConf->getViewThemeParam('sShippingDaysNotOnStock')}]
            [{assign var="sDeliveryDaysOnStock"    value=$oViewConf->getViewThemeParam('sDeliveryDaysOnStock')}]
            [{assign var="sDeliveryDaysNotOnStock" value=$oViewConf->getViewThemeParam('sDeliveryDaysNotOnStock')}]

            [{if $sShippingDaysOnStock && $sShippingDaysNotOnStock && $sDeliveryDaysOnStock && $sDeliveryDaysNotOnStock}]
                [{if !$oOrder}]
                    [{assign var="oOrder" value=$oView->getOrder()}]
                [{/if}]

                [{assign var="sShopURL"      value=$oConfig->getConfigParam('sShopURL')}]
                [{assign var="aShopDomain"   value=$sShopURL|@parse_url}]
                [{assign var="blHasPreOrder" value=false}]
                [{assign var="oBasket"       value=$oView->getBasket()}]
                [{assign var="oCountry"      value="oxCountry"|@oxNew}]
                [{if $oCountry->load($oOrder->oxorder__oxbillcountryid->value)}]
                    [{assign var="sCustomerCountry" value=$oCountry->oxcountry__oxisoalpha2->value}]
                [{/if}]

                <!-- START Google Zertifizierte Händler Order -->
                <div id="gts-order" style="display:none;" translate="no">
                    [{* Zuerst die Artikel der Bestellung iterieren um Informationen für die Bestelldaten zu sammeln *}]
                    [{capture name="sGtsItems"}]
                        [{foreach from=$oOrder->getOrderArticles() item="oOrderArticle"}]
                            [{assign var="oArticle"           value=$oOrderArticle->getArticle()}]
                            [{assign var="oOrderArticlePrice" value=$oOrderArticle->getPrice()}]
                            [{assign var="sArticleName"       value=$oOrderArticle->oxorderarticles__oxtitle->value|cat:' '|cat:$oOrderArticle->oxorderarticles__oxselvariant->value}]
                            [{if !$blHasPreOrder && $oArticle->getStockStatus() == -1}]
                                [{assign var="blHasPreOrder" value=true}]
                            [{/if}]

                            <span class="gts-item">
                                <span class="gts-i-name">[{$sArticleName|trim}]</span>
                                <span class="gts-i-price">[{$oOrderArticlePrice->getBruttoPrice()}]</span>
                                <span class="gts-i-quantity">[{$oOrderArticle->oxorderarticles__oxamount->value}]</span>
                                <span class="gts-i-prodsearch-id">[{$oOrderArticle->oxorderarticles__oxartnum->value}]</span>
                                [{if $sGoogleShoppingAccountId}]
                                    <span class="gts-i-prodsearch-store-id">[{$sGoogleShoppingAccountId}]</span>
                                    [{if $sShoppingCountry}]
                                        <span class="gts-i-prodsearch-country">[{$sShoppingCountry|default:'DE'}]</span>
                                    [{/if}]
                                    [{if $sShoppingLanguage}]
                                        <span class="gts-i-prodsearch-language">[{$sShoppingLanguage|default:'de'}]</span>
                                    [{/if}]
                                [{/if}]
                            </span>
                        [{/foreach}]
                    [{/capture}]

                    [{* voraussichtliches Versanddatum berechnen *}]
                    [{if $blHasPreOrder}]
                        [{assign var="sShipDate" value="`$sShippingDaysNotOnStock` weekdays"|strtotime}]
                    [{else}]
                        [{assign var="sShipDate" value="`$sShippingDaysOnStock` weekdays"|strtotime}]
                    [{/if}]

                    [{* voraussichtliches Lieferdatum berechnen *}]
                    [{if $blHasPreOrder}]
                        [{assign var="sDeliveryDate" value="`$sDeliveryDaysNotOnStock` weekdays"|strtotime}]
                    [{else}]
                        [{assign var="sDeliveryDate" value="`$sDeliveryDaysOnStock` weekdays"|strtotime}]
                    [{/if}]

                    <span id="gts-o-id">[{$oOrder->oxorder__oxordernr->value}]</span>
                    <span id="gts-o-domain">[{$aShopDomain.host}]</span>
                    <span id="gts-o-email">[{$oOrder->oxorder__oxbillemail->value}]</span>
                    <span id="gts-o-country">[{$sCustomerCountry}]</span>
                    <span id="gts-o-currency">[{$oOrder->oxorder__oxcurrency->value}]</span>
                    <span id="gts-o-total">[{$oOrder->oxorder__oxtotalordersum->value}]</span>
                    <span id="gts-o-discounts">[{if $oOrder->oxorder__oxdiscount->value > 0}]-[{/if}][{$oOrder->oxorder__oxdiscount->value}]</span>
                    <span id="gts-o-shipping-total">[{$oOrder->oxorder__oxdelcost->value}]</span>
                    <span id="gts-o-tax-total">[{math equation="x+y" x=$oOrder->oxorder__oxartvatprice1->value y=$oOrder->oxorder__oxartvatprice2->value}]</span>
                    <span id="gts-o-est-ship-date">[{$sShipDate|date_format:"%Y-%m-%d"}]</span>
                    <span id="gts-o-est-delivery-date">[{$sDeliveryDate|date_format:"%Y-%m-%d"}]</span>
                    <span id="gts-o-has-preorder">[{if $blHasPreOrder}]Y[{else}]N[{/if}]</span>
                    <span id="gts-o-has-digital">[{if $oBasket->hasDownloadableProducts()}]Y[{else}]N[{/if}]</span>

                    [{if $smarty.capture.sGtsItems}]
                        [{$smarty.capture.sGtsItems}]
                    [{/if}]
                </div>
            [{/if}]
            <!-- END Google Zertifizierte Händler Order -->
        [{/if}]
    [{/if}]
[{/if}]