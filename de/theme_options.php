<?php
/**
 * This file is part of OXID eSales Flow theme.
 *
 * OXID eSales Flow theme is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * OXID eSales Flow theme is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with OXID eSales Flow theme.  If not, see <http://www.gnu.org/licenses/>.
 *
 * @link      http://www.oxid-esales.com
 * @copyright (C) OXID eSales AG 2003-2016
 */


$aLang = array(
    'charset'                                       => 'UTF-8',

    'SHOP_THEME_GROUP_images'                       => 'Bilder',
    'SHOP_THEME_GROUP_features'                     => 'Funktionen',
    'SHOP_THEME_GROUP_display'                      => 'Anzeige',
    'SHOP_THEME_GROUP_logo'                         => 'Logo',
    'SHOP_THEME_GROUP_favicons'                     => 'Favicons',
    'SHOP_THEME_GROUP_footer'                       => 'Footer',
    'SHOP_THEME_GROUP_header'                       => 'Header',
    'SHOP_THEME_GROUP_contact'                      => 'Kontakt',
    'SHOP_THEME_GROUP_googleanalytics'              => 'Google Analytics',
    'SHOP_THEME_GROUP_googlets'                     => 'Google Zertifizierte Händler',
    'SHOP_THEME_GROUP_background'                   => 'Hintergrundbild',
    'SHOP_THEME_GROUP_econda'                       => 'econda Web Shop Controlling',
    'SHOP_THEME_GROUP_emails'                       => 'E-Mails',

    'SHOP_THEME_sIconsize'                          => 'Größe des Icons in Pixeln (Breite*Höhe)', //SHOP_CONFIG_ICONSIZE
    'HELP_SHOP_THEME_sIconsize'                     => 'Icons sind die kleinsten Bilder eines Artikels. Sie werden z. B. <br>' .
                                                       '<ul><li>im Warenkorb angezeigt</li>' .
                                                       '<li>angezeigt, wenn Artikel in der Seitenleiste aufgelistet werden (z.B. bei den Aktionen <span class="filename_filepath_or_italic">Top of the Shop</span> und <span class="filename_filepath_or_italic">Schnäppchen</span>).</li></ul>' .
                                                       'Damit die Harmonie des eShops nicht durch zu große Icons gestört wird, werden zu große Icons automatisch verkleinert. Die maximale Größe können Sie hier eingeben.<br>',

    'SHOP_THEME_sThumbnailsize'                     => 'Größe des Thumbnails in Pixeln (Breite*Höhe)', //SHOP_CONFIG_THUMBNAILSIZE
    'HELP_SHOP_THEME_sThumbnailsize'                => 'Thumbnails sind kleine Bilder eines Artikels. Sie werden z. B. <br>' .
                                                       '<ul><li>in Artikellisten angezeigt. Artikellisten sind z. B. Kategorieansichten (alle Artikel in einer Kategorie werden aufgelistet) und die Suchergebnisse.</li>' .
                                                       '<li>in Aktionen angezeigt, die in der Mitte der Startseite angezeigt werden, z. B. <span class="filename_filepath_or_italic">Die Dauerbrenner</span> und <span class="filename_filepath_or_italic">Frisch eingetroffen!</span>.</li></ul>' .
                                                       'Damit das Design des eShops nicht durch zu große Thumbnails gestört wird, werden zu große Thumbnails automatisch verkleinert. Die maximale Größe können Sie hier eingeben.',

    'SHOP_THEME_sZoomImageSize'                     => 'Größe der Zoom-Bilder (Zoom 1-4) in Pixeln (Breite*Höhe)', //SHOP_CONFIG_ZOOMIMAGESIZE
    'SHOP_THEME_sCatThumbnailsize'                  => 'Größe des Kategoriebildes in Pixeln (Breite*Höhe)', //SHOP_CONFIG_CATEGORYTHUMBNAILSIZE
    'HELP_SHOP_THEME_sCatThumbnailsize'             => 'In der Kategorieübersicht wird das Bild der ausgewählten Kategorie in der hier definierten Größe angezeigt.', //SHOP_CONFIG_CATEGORYTHUMBNAILSIZE
    'SHOP_THEME_aDetailImageSizes'                  => 'Größe der Artikelbilder  (Bild 1-12) in Pixeln (Breite*Höhe)', //SHOP_CONFIG_DETAILIMAGESIZE

    'SHOP_THEME_sManufacturerIconsize'              => 'Größe des Hersteller-/Markenlogos in Pixeln (Breite*Höhe)', // Check if this is really manufacturer or if it is more like "brand"
    'HELP_SHOP_THEME_sManufacturerIconsize'         => 'Dieses Logo wird auf der Startseite in der Markenlogo-übersicht angezeigt.',

    'SHOP_THEME_sCatIconsize'                       => 'Größe des Kategoriebildes einer Unterkategorie in Pixeln (Breite*Höhe)',
    'HELP_SHOP_THEME_sCatIconsize'                  => 'In der Kategorieübersicht werden die Kategoriebilder von Unterkategorien in der hier definierten Größe angezeigt.',

    'SHOP_THEME_sCatPromotionsize'                  => 'Größe des Kategoriebildes für die Startseite in Pixeln (Breite*Höhe)',
    'HELP_SHOP_THEME_sCatPromotionsize'             => 'Kategorien, die auf der Startseite beworben werden, benötigen eine eigens dafür vorgesehene Größgenangabe. Stellen Sie diese hier ein.',

    'SHOP_THEME_blFooterShowHelp'                   => 'Hilfe-Link aktivieren',
    'SHOP_THEME_blFooterShowLinks'                  => 'Links-Link aktivieren',
    'SHOP_THEME_blFooterShowNewsletter'             => 'Newsletter-Link aktivieren',
    'SHOP_THEME_blFooterShowNewsletterForm'         => 'Newsletter-Formular aktivieren',
    'SHOP_THEME_blFooterShowNews'                   => 'Neuigkeiten-Link aktivieren (im OXID eShop admin "Nachrichten" genannt)',
    'SHOP_THEME_bl_showGiftWrapping'                => 'Geschenkverpackungen aktivieren', //SHOP_CONFIG_SHOWGIFTWRAPPING
    'SHOP_THEME_bl_showVouchers'                    => 'Gutscheine aktivieren',           //SHOP_CONFIG_SHOWVOUCHERS
    'SHOP_THEME_bl_showWishlist'                    => 'Wunschzettel aktivieren',         //SHOP_CONFIG_SHOWWISHLIST
    'SHOP_THEME_bl_showCompareList'                 => 'Artikelvergleich aktivieren',     //SHOP_CONFIG_SHOWCOMPARELIST
    'SHOP_THEME_bl_showListmania'                   => 'Lieblingslisten aktivieren',      //SHOP_CONFIG_SHOWLISTMANIA
    'SHOP_THEME_blShowBirthdayFields'               => 'Eingabefeld für das Geburtsdatum anzeigen, wenn Benutzer ihre Daten eingeben', //SHOP_CONFIG_SHOWBIRTHDAYFIELDS

    'SHOP_THEME_iTopNaviCatCount'                   => 'Anzahl der Kategorien, die oben angezeigt werden (weitere Kategorien werden ebenfalls oben unter "mehr" aufgelistet)', //SHOP_CONFIG_TOPNAVICATCOUNT
    'SHOP_THEME_blShowFinalStep'                    => 'Bestellbestätigung anzeigen, wenn die Bestellung abgeschlossen ist (fünfter Bestellschritt)', //SHOP_SYSTEM_SHOWFINALSTEP
    'SHOP_THEME_iNewBasketItemMessage'              => 'Wenn Produkt in den Warenkorb gelegt wird, folgende Aktion ausführen', //SHOP_SYSTEM_SHOWNEWBASKETITEMMESSAGE
    'HELP_SHOP_THEME_iNewBasketItemMessage'         => 'Wenn Konsumenten ein Produkt in den Warenkorb legen, kann der OXID eShop unterschiedliche Feedback-Aktionen durchführen.', //SHOP_SYSTEM_SHOWNEWBASKETITEMMESSAGE
    'SHOP_THEME_iNewBasketItemMessage_0'            => 'Keine',
    'SHOP_THEME_iNewBasketItemMessage_1'            => 'Meldung ausgeben',
    'SHOP_THEME_iNewBasketItemMessage_2'            => 'Popup öffnen',
    'SHOP_THEME_iNewBasketItemMessage_3'            => 'Warenkorb öffnen',

    'SHOP_THEME_blShowListDisplayType'              => 'Produktlistentyp in Produktlisten anzeigen',
    'HELP_SHOP_THEME_blShowListDisplayType'         => 'Darf der Besucher Ihres Online-Shops die Art der Listenansicht auswählen? Falls diese Option nicht aktiviert ist, werden die Listenansichten so angezeigt wie in der Dropbox "Standard für Produktlistentyp" eingestellt.',
    'SHOP_THEME_sDefaultListDisplayType'            => 'Standard für Produktlistentyp',
    'SHOP_THEME_sDefaultListDisplayType_grid'       => 'Galerie',
    'SHOP_THEME_sDefaultListDisplayType_line'       => 'Liste',
    'SHOP_THEME_sDefaultListDisplayType_infogrid'   => 'Galerie zweispaltig',
    'SHOP_THEME_sStartPageListDisplayType'          => 'Produktlistentyp auf der Startseite',
    'SHOP_THEME_sStartPageListDisplayType_grid'     => 'Galerie',
    'SHOP_THEME_sStartPageListDisplayType_line'     => 'Liste',
    'SHOP_THEME_sStartPageListDisplayType_infogrid' => 'Galerie zweispaltig',

    'SHOP_THEME_aNrofCatArticlesInGrid'             => 'Für Galerie: Anzahl der Artikel, die in einer Artikelliste pro Seite angezeigt werden können<br><br>Warnung: Eine große Anzahl von Artikeln pro Seite (über 100) kann die Geschwindigkeit des Shops erheblich beeinflussen!',
    'SHOP_THEME_aNrofCatArticles'                   => 'Anzahl der Artikel, die in einer Artikelliste pro Seite angezeigt werden können<br><br>Warnung: Eine große Anzahl von Artikeln pro Seite (über 100) kann die Geschwindigkeit des Shops erheblich beeinflussen!',

    'SHOP_THEME_sFacebookUrl'                       => 'Facebook Seiten-URL',
    'HELP_SHOP_THEME_sFacebookUrl'                  => 'Bsp.: https://www.facebook.com/oxidesales',
    'SHOP_THEME_sTwitterUrl'                        => 'Twitter Profil-URL',
    'HELP_SHOP_THEME_sTwitterUrl'                   => 'Bsp.: https://twitter.com/OXID_eSales',
    'SHOP_THEME_sYouTubeUrl'                        => 'YouTube Kanal-URL',
    'HELP_SHOP_THEME_sYouTubeUrl'                   => 'Bsp.: https://www.youtube.com/user/oxidesales‎',
    'SHOP_THEME_sBlogUrl'                           => 'Blog-URL',
    'HELP_SHOP_THEME_sBlogUrl'                      => 'Bsp.: http://blog.oxid-esales.com',
    'SHOP_THEME_sGooglePlusUrl'                     => 'Google+ Seiten-URL',
    'HELP_SHOP_THEME_sGooglePlusUrl'                 => 'Bsp.: https://plus.google.com/114133952363540971062',

    'SHOP_THEME_sGoogleMapsAddr'                    => 'Ihre Adresse',
    'HELP_SHOP_THEME_sGoogleMapsAddr'               => 'Bsp.: OXID eSales AG, Bertoldstraße 48, 79098 Freiburg‎',

    'SHOP_THEME_bl_showManufacturerSlider'          => 'Hersteller-Slider auf Startseite anzeigen‎',

    'SHOP_THEME_blUseGAPageTracker'                 => 'Google Analytics PageTracker benutzen',
    'SHOP_THEME_blUseGAEcommerceTracking'           => 'Google Analytics Ecommerce Tracking benutzen',
    'HELP_SHOP_THEME_blUseGAEcommerceTracking'      => 'Bitte beachten Sie, dass diese Option zusätzlich in Ihrem Google Analytics Konto aktiviert sein muss. Anleitung: <a href="https://support.google.com/analytics/answer/1009612?hl=de&ref_topic=1037061" target="_blank">Link</a>',
    'SHOP_THEME_sGATrackingId'                      => 'Google Analytics Tracking-ID',
    'HELP_SHOP_THEME_sGATrackingId'                 => 'Bsp.: UA-XXXXXXXX-1<br><br>Für die rechtskonforme Nutzung dieser Funktion ist der Shopbetreiber selbst verantwortlich. Eine Anpassung der Datenschutzerklärung ist obligatorisch.',
    'SHOP_THEME_blGAAnonymizeIPs'                   => 'IP-Adressen anonymisieren (in DE Pflicht!)',

    'SHOP_THEME_sLogoFile'                          => 'Dateiname des Logos im Header',
    'HELP_SHOP_THEME_sLogoFile'                     => 'Relativ zu dem Pfad <code>/out/flow/img/</code>.',
    'SHOP_THEME_sLogoWidth'                         => 'Breite des Header-Logos',
    'HELP_SHOP_THEME_sLogoWidth'                    => 'Angaben in Pixel.',
    'SHOP_THEME_sLogoHeight'                        => 'Höhe des Header-Logos',
    'HELP_SHOP_THEME_sLogoHeight'                   => 'Angaben in Pixel.',

    'SHOP_THEME_sEmailLogo'                         => 'Dateiname des Logos im E-Mail-Kopf',
    'HELP_SHOP_THEME_sEmailLogo'                    => 'Relativ zu dem Pfad <code>/out/flow/img/</code>.',

    'SHOP_THEME_sFaviconFile'                       => 'Dateiname des Favicons',
    'HELP_SHOP_THEME_sFaviconFile'                  => 'Hiermit ist das Favicon gemeint, welches im Browser auch beim Tab angezeigt wird.<br>In der Regel handelt es sich hier um eine .ico-Datei.<br>Relativ zu dem Pfad <code>/out/flow/img/favicons/</code>.',
    'SHOP_THEME_sFavicon16File'                     => 'Dateiname des Favicons mit den Maßen 16*16px.',
    'SHOP_THEME_sFavicon32File'                     => 'Dateiname des Favicons mit den Maßen 32*32px.',
    'SHOP_THEME_sFavicon48File'                     => 'Dateiname des Favicons mit den Maßen 48*48px.',
    'SHOP_THEME_sFavicon64File'                     => 'Dateiname des Favicons mit den Maßen 64*64px.',
    'SHOP_THEME_sFavicon128File'                    => 'Dateiname des Favicons mit den Maßen 128*128px.',
    'SHOP_THEME_sFavicon512File'                    => 'Dateiname des Favicons mit den Maßen 512*512px.',
    'SHOP_THEME_sFaviconMSTileColor'                => 'Kachel-Farbe für Windows 8/Windows Mobile Lesezeichen.',
    'HELP_SHOP_THEME_sFaviconMSTileColor'           => 'Angabe als HEX-Wert.<br>Bsp.: #D83434',

    'SHOP_THEME_blUseBackground'                    => 'Hintergrundbild anzeigen',
    'SHOP_THEME_sBackgroundColor'                   => 'Hintergrundfarbe des Shops',
    'HELP_SHOP_THEME_sBackgroundColor'              => 'Angabe als HEX-Wert.<br>Bsp.: #D83434',
    'SHOP_THEME_sBackgroundPath'                    => 'Dateiname des Hintergrundbildes',
    'HELP_SHOP_THEME_sBackgroundPath'               => 'Relativ zu dem Pfad <code>/out/flow/img/backgrounds/</code>.',
    'SHOP_THEME_sBackgroundRepeat'                  => 'Soll sich das Hintergrundbild wiederholen?',
    'SHOP_THEME_sBackgroundRepeat_no-repeat'        => 'Nein',
    'SHOP_THEME_sBackgroundRepeat_repeat-x'         => 'Ja, horizontal',
    'SHOP_THEME_sBackgroundRepeat_repeat-y'         => 'Ja, vertikal',
    'SHOP_THEME_sBackgroundRepeat_repeat'           => 'Ja, horizontal und vertikal',
    'SHOP_THEME_sBackgroundPosHorizontal'           => 'Horizontale Position des Hintergrundbildes',
    'SHOP_THEME_sBackgroundPosHorizontal_left'      => 'links',
    'SHOP_THEME_sBackgroundPosHorizontal_right'     => 'rechts',
    'SHOP_THEME_sBackgroundPosHorizontal_center'    => 'zentriert',
    'SHOP_THEME_sBackgroundPosVertical'             => 'Vertikale Position des Hintergrundbildes',
    'SHOP_THEME_sBackgroundPosVertical_top'         => 'oben',
    'SHOP_THEME_sBackgroundPosVertical_bottom'      => 'unten',
    'SHOP_THEME_sBackgroundPosVertical_center'      => 'zentriert',
    'SHOP_THEME_sBackgroundSize'                    => 'Hintergrundbild-Größe',
    'SHOP_THEME_sBackgroundSize_cover'              => 'deckend (volle Höhe)',
    'SHOP_THEME_sBackgroundSize_contain'            => 'deckend (volle Breite)',
    'SHOP_THEME_sBackgroundSize_normal'             => 'Originalgröße behalten',
    'SHOP_THEME_blBackgroundAttachment'             => 'Soll das Hintergrundbild beim Scrollen stehen bleiben?',

    'SHOP_THEME_blUseGoogleTS'                      => 'Google Zertifizierte Händler benutzen',
    'SHOP_THEME_sGoogleVendorId'                    => 'Google Store-ID (Erforderlich)',
    'HELP_SHOP_THEME_sGoogleVendorId'               => 'Diese ID finden Sie im Händler-Dashboard von Google Zertifizierte Händler.',
    'SHOP_THEME_sGoogleShoppingAccountId'           => 'Google Shopping Account-ID (Optional)',
    'HELP_SHOP_THEME_sGoogleShoppingAccountId'      => 'Geben Sie dieses Feld nur an, wenn Sie Feeds an Google Shopping senden.<br><br>Kundennummer im Google Merchant Center. Dieser Wert muss mit der Kundennummer übereinstimmen, die Sie zum Senden Ihres <a href="https://support.google.com/merchants/answer/188494#US" target="_blank">Produktdatenfeeds an Google Shopping</a> über das Google Merchant Center verwenden. Wenn Sie ein MCA-Konto haben, verwenden Sie die Kundennummer des Unterkontos, das mit diesem Produktfeed verknüpft ist.',
    'SHOP_THEME_sPageLanguage'                      => 'Sprache Ihres Shops in ISO (Erforderlich)',
    'HELP_SHOP_THEME_sPageLanguage'                 => 'Der Sprach-Wert ist ein aus zwei Buchstaben bestehender <a href="http://de.wikipedia.org/wiki/ISO_639#ISO_639-1" target="_blank">ISO 639-1-Sprachcode</a> und der Land-Wert ist ein aus zwei Buchstaben bestehender <a href="http://de.wikipedia.org/wiki/ISO_3166-1_alpha-2" target="_blank">ISO 3166-1 ALPHA-2-Ländercode</a>. In der Regel besteht &lt;Land&gt; aus Großbuchstaben und &lt;Sprache&gt; aus Kleinbuchstaben.<br><br>Beispiele: de_DE, en_GB, fr_FR, en_AU, en_US oder ja_JP.',
    'SHOP_THEME_sShoppingCountry'                   => 'Google Shopping-Feed Land (Optional)',
    'HELP_SHOP_THEME_sShoppingCountry'              => 'Geben Sie dieses Feld nur an, wenn Sie Feeds an Google Shopping senden.<br><br>Dient zur Angabe des Landes, dem das Konto in Google Shopping zugeordnet ist. Dieser Wert sollte mit dem Land des Kontos übereinstimmen, das Sie verwenden, um Ihren <a href="https://support.google.com/merchants/answer/188494#US" target="_blank">Produktdatenfeed an Google Shopping zu senden</a>.<br><br>Der Wert des Landesparameters muss ein <a href="http://de.wikipedia.org/wiki/ISO_3166-1_alpha-2" target="_blank">aus zwei Buchstaben bestehender ISO 3166-Ländercode</a> sein.<br><br>Beispiele: US, GB, AU, FR, DE, JP.',
    'SHOP_THEME_sShoppingLanguage'                  => 'Google Shopping-Feed Sprache (Optional)',
    'HELP_SHOP_THEME_sShoppingLanguage'             => 'Geben Sie dieses Feld nur an, wenn Sie Feeds an Google Shopping senden.<br><br>Dies ist die Sprache des Kontos aus Google Shopping. Dieser Wert sollte mit der Sprache des Kontos übereinstimmen, das Sie verwenden, um Ihren <a href="https://support.google.com/merchants/answer/188494#US" target="_blank">Produktdatenfeed an Google Shopping zu senden</a>.<br><br>Der Wert des Sprachparameters muss ein aus <a href="http://de.wikipedia.org/wiki/ISO_639#ISO_639-1" target="_blank">zwei Buchstaben bestehender ISO 639-1-Sprachcode</a> sein.<br><br>Beispiele: en, fr, de, ja.',
    'SHOP_THEME_sShippingDaysOnStock'               => 'Anz. der Tage bis zum Versand einer Bestellung mit Artikeln, die alle auf Lager sind. (Erforderlich)',
    'HELP_SHOP_THEME_sShippingDaysOnStock'          => 'Hierbei handelt es sich um das voraussichtliche Datum des Versands der Bestellung; dies ist nicht dasselbe wie das voraussichtliche Lieferdatum.<br><br>Wenn die Bestellung mehrere Artikel umfasst, wählen Sie das späteste voraussichtliche Versanddatum aus.<br><br>Wenn Sie Ihren Kunden einen Zeitraum nennen, geben Sie den letzten Tag des Zeitraums an. Wenn Sie beispielsweise innerhalb von 5 bis 7 Tagen versenden, geben Sie 7 Tage an.<br><br>Der hier genannte Termin wird dem Kunden per E-Mail mitgeteilt.<br><br>Nach dem voraussichtlichen Versanddatum erhält der Kunde eine Umfrage zum abgeschlossenen Kauf.',
    'SHOP_THEME_sShippingDaysNotOnStock'            => 'Anz. der Tage bis zum Versand einer Bestellung, bei der mind. 1 Artikel nicht auf Lager ist. (Erforderlich)',
    'HELP_SHOP_THEME_sShippingDaysNotOnStock'       => 'Hierbei handelt es sich um das voraussichtliche Datum des Versands der Bestellung; dies ist nicht dasselbe wie das voraussichtliche Lieferdatum.<br><br>Wenn die Bestellung mehrere Artikel umfasst, wählen Sie das späteste voraussichtliche Versanddatum aus.<br><br>Wenn Sie Ihren Kunden einen Zeitraum nennen, geben Sie den letzten Tag des Zeitraums an. Wenn Sie beispielsweise innerhalb von 5 bis 7 Tagen versenden, geben Sie 7 Tage an.<br><br>Der hier genannte Termin wird dem Kunden per E-Mail mitgeteilt.<br><br>Nach dem voraussichtlichen Versanddatum erhält der Kunde eine Umfrage zum abgeschlossenen Kauf.',
    'SHOP_THEME_sDeliveryDaysOnStock'               => 'Anz. der Tage bis zur Lieferung einer Bestellung mit Artikeln, die alle auf Lager sind. (Erforderlich)',
    'HELP_SHOP_THEME_sDeliveryDaysOnStock'          => 'Dies ist das voraussichtliche Datum, an dem Sie mit der Lieferung der Bestellung an den Kunden rechnen. Wenn die Bestellung mehrere Artikel umfasst, wählen Sie das späteste voraussichtliche Lieferdatum. Wenn Sie einen Lieferzeitraum nennen, geben Sie den letzten Tag des Zeitraums an, bei 5 bis 7 Tagen also 7 Tage.',
    'SHOP_THEME_sDeliveryDaysNotOnStock'            => 'Anz. der Tage bis zur Lieferung einer Bestellung, bei der mind. 1 Artikel nicht auf Lager ist. (Erforderlich)',
    'HELP_SHOP_THEME_sDeliveryDaysNotOnStock'       => 'Dies ist das voraussichtliche Datum, an dem Sie mit der Lieferung der Bestellung an den Kunden rechnen. Wenn die Bestellung mehrere Artikel umfasst, wählen Sie das späteste voraussichtliche Lieferdatum. Wenn Sie einen Lieferzeitraum nennen, geben Sie den letzten Tag des Zeitraums an, bei 5 bis 7 Tagen also 7 Tage.',

    'SHOP_THEME_blSliderShowImageCaption'           => 'Bildunterschriften im Slider auf der Startseite aktivieren',
    'HELP_SHOP_THEME_blSliderShowImageCaption'      => 'Diese wird angezeigt, sobald einem Slide ein Produkt zugeordnet ist.',

    'SHOP_THEME_sEcondaRecommendationsAID'          => 'Account-ID',
    'HELP_SHOP_THEME_sEcondaRecommendationsAID'     => 'Geben Sie hier Ihre econda Account-ID ein.<br>Diese hat üblicherweise folgendes Format: XXXXXXXX-XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX-X.<br>Bitte denken Sie daran, das econda Webshop Controlling zu aktivieren.',
    'SHOP_THEME_blEcondaRecommendationsStart'       => 'Recommendations auf Startseite anzeigen',
    'SHOP_THEME_sEcondaWidgetIdStart'               => 'Recommendation-Widget-ID für Startseite',
    'SHOP_THEME_sEcondaRecommendationsFromStart'    => 'Starte Ausgabe der Recommendations ab Artikel',
    'SHOP_THEME_sEcondaRecommendationsToStart'      => 'Stoppe Ausgabe der Recommendations ab Artikel',
    'SHOP_THEME_blEcondaRecommendationsList'        => 'Recommendations in Listenansicht anzeigen',
    'SHOP_THEME_sEcondaWidgetIdList'                => 'Recommendation-Widget-ID für Listenansicht',
    'SHOP_THEME_sEcondaRecommendationsFromList'     => 'Starte Ausgabe der Recommendations ab Artikel',
    'SHOP_THEME_sEcondaRecommendationsToList'       => 'Stoppe Ausgabe der Recommendations ab Artikel',
    'SHOP_THEME_blEcondaRecommendationsDetails'     => 'Recommendations auf Detailseite anzeigen',
    'SHOP_THEME_sEcondaWidgetIdDetails'             => 'Recommendation-Widget-ID für Detailseite',
    'SHOP_THEME_sEcondaRecommendationsFromDetails'  => 'Starte Ausgabe der Recommendations ab Artikel',
    'SHOP_THEME_sEcondaRecommendationsToDetails'    => 'Stoppe Ausgabe der Recommendations ab Artikel',
    'SHOP_THEME_blEcondaRecommendationsBasket'      => 'Recommendations im Warenkorb anzeigen',
    'SHOP_THEME_sEcondaWidgetIdBasket'              => 'Recommendation-Widget-ID für Warenkorb',
    'SHOP_THEME_sEcondaRecommendationsFromBasket'   => 'Starte Ausgabe der Recommendations ab Artikel',
    'SHOP_THEME_sEcondaRecommendationsToBasket'     => 'Stoppe Ausgabe der Recommendations ab Artikel',

    'SHOP_THEME_blFullwidthLayout'                  => 'Full-Width Layout aktivieren',

    'SHOP_THEME_blEmailsShowProductPictures'        => 'Produktbilder in E-Mails anzeigen',

);
