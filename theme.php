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

/**
 * Theme Information
 */
$aTheme = [
    'id' => 'flow',
    'title' => 'Flow',
    'description' => 'Flow is OXID`s official responsive theme based on the CSS framework Bootstrap 3.',
    'thumbnail'   => 'theme.jpg',
    'version'     => '3.5.1',
    'author'      => '<a href="http://www.oxid-esales.com" title="OXID eSales AG">OXID eSales AG</a>',
    'settings'    => [
        //Group display:
        [
            'group' => 'display',
            'name' => 'blFullwidthLayout',
            'type' => 'bool',
            'value' => 0,
            'position' => 1000
        ],
        [
            'group' => 'display',
            'name' => 'bl_showManufacturerSlider',
            'type' => 'bool',
            'value' => 1,
            'position' => 1005
        ],
        [
            'group' => 'display',
            'name' => 'sDefaultListDisplayType',
            'type' => 'select',
            'value' => 'infogrid',
            'constraints' => 'infogrid|line|grid',
            'position' => 1010
        ],
        [
            'group' => 'display',
            'name' => 'blShowListDisplayType',
            'type' => 'bool',
            'value' => 1,
            'position' => 1015
        ],
        [
            'group' => 'display',
            'name' => 'sStartPageListDisplayType',
            'type' => 'select',
            'value' => 'grid',
            'constraints' => 'infogrid|line|grid',
            'position' => 1020
        ],
        [
            'group' => 'display',
            'name' => 'aNrofCatArticles',
            'type' => 'arr',
            'value' => ["10", "20", "50", "100"],
            'position' => 1025
        ],
        [
            'group' => 'display',
            'name' => 'aNrofCatArticlesInGrid',
            'type' => 'arr',
            'value' => ["12", "16", "24", "32"],
            'position' => 1030
        ],
        [
            'group' => 'display',
            'name' => 'iNewBasketItemMessage',
            'type' => 'select',
            'value' => 'str',
            'constraints' => '0|1|2|3',
            'position' => 1035
        ],
        [
            'group' => 'display',
            'name' => 'blShowFinalStep',
            'type' => 'bool',
            'value' => 1,
            'position' => 1040
        ],
        [
            'group' => 'display',
            'name' => 'blShowBirthdayFields',
            'type' => 'bool',
            'value' => 1,
            'position' => 1045
        ],

        //Group logo:
        [
            'group' => 'logo',
            'name' => 'sLogoFile',
            'type' => 'str',
            'value' => 'logo_oxid.png',
            'position' => 1100
        ],
        [
            'group' => 'logo',
            'name' => 'sLogoWidth',
            'type' => 'str',
            'value' => '200',
            'position' => 1105
        ],
        [
            'group' => 'logo',
            'name' => 'sLogoHeight',
            'type' => 'str',
            'value' => '38',
            'position' => 1110
        ],

        //Group favicon:
        [
            'group' => 'favicons',
            'name' => 'sFaviconFile',
            'type' => 'str',
            'value' => 'favicon.ico',
            'position' => 1200
        ],
        [
            'group' => 'favicons',
            'name' => 'sFavicon16File',
            'type' => 'str',
            'value' => 'favicon_16x16.png',
            'position' => 1205
        ],
        [
            'group' => 'favicons',
            'name' => 'sFavicon32File',
            'type' => 'str',
            'value' => 'favicon_32x32.png',
            'position' => 1210
        ],
        [
            'group' => 'favicons',
            'name' => 'sFavicon48File',
            'type' => 'str',
            'value' => 'favicon_48x48.png',
            'position' => 1215
        ],
        [
            'group' => 'favicons',
            'name' => 'sFavicon64File',
            'type' => 'str',
            'value' => 'favicon_64x64.png',
            'position' => 1220
        ],
        [
            'group' => 'favicons',
            'name' => 'sFavicon128File',
            'type' => 'str',
            'value' => 'favicon_128x128.png',
            'position' => 1225
        ],
        [
            'group' => 'favicons',
            'name' => 'sFavicon512File',
            'type' => 'str',
            'value' => 'favicon_512x512.png',
            'position' => 1230
        ],
        [
            'group' => 'favicons',
            'name' => 'sFaviconMSTileColor',
            'type' => 'str',
            'value' => '#D83434',
            'position' => 1235
        ],

        //Group header:
        [
            'group' => 'header',
            'name' => 'stickyHeader',
            'type' => 'bool',
            'value' => 1,
            'position' => 1300
        ],

        //Group images:
        [
            'group' => 'images',
            'name' => 'sIconsize',
            'type' => 'str',
            'value' => '87*87',
            'position' => 1400
        ],
        [
            'group' => 'images',
            'name' => 'sThumbnailsize',
            'type' => 'str',
            'value' => '390*245',
            'position' => 1405
        ],
        [
            'group' => 'images',
            'name' => 'aDetailImageSizes',
            'type' => 'aarr',
            'value' => [
                'oxpic1' => '540*340',
                'oxpic2' => '540*340',
                'oxpic3' => '540*340',
                'oxpic4' => '540*340',
                'oxpic5' => '540*340',
                'oxpic6' => '540*340',
                'oxpic7' => '540*340',
                'oxpic8' => '540*340',
                'oxpic9' => '540*340',
                'oxpic10' => '540*340',
                'oxpic11' => '540*340',
                'oxpic12' => '540*340',
            ],
            'position' => 1410
        ],
        [
            'group' => 'images',
            'name' => 'sZoomImageSize',
            'type' => 'str',
            'value' => '665*665',
            'position' => 1415
        ],
        [
            'group' => 'images',
            'name' => 'sCatIconsize',
            'type' => 'str',
            'value' => '168*100',
            'position' => 1420
        ],
        [
            'group' => 'images',
            'name' => 'sCatPromotionsize',
            'type' => 'str',
            'value' => '370*107',
            'position' => 1425
        ],
        [
            'group' => 'images',
            'name' => 'sCatThumbnailsize',
            'type' => 'str',
            'value' => '1140*250',
            'position' => 1430
        ],
        [
            'group' => 'images',
            'name' => 'sManufacturerIconsize',
            'type' => 'str',
            'value' => '100*100',
            'position' => 1435
        ],
        [
            'group' => 'images',
            'name' => 'blSliderShowImageCaption',
            'type' => 'bool',
            'value' => 1,
            'position' => 1440
        ],

        //Group background:
        [
            'group' => 'background',
            'name' => 'sBackgroundColor',
            'type' => 'str',
            'value' => '#CCEBF5',
            'position' => 1500
        ],
        [
            'group' => 'background',
            'name' => 'blUseBackground',
            'type' => 'bool',
            'value' => 0,
            'position' => 1505
        ],
        [
            'group' => 'background',
            'name' => 'sBackgroundPath',
            'type' => 'str',
            'value' => 'mein_hintergrundbild.jpg',
            'position' => 1510
        ],
        [
            'group' => 'background',
            'name' => 'sBackgroundSize',
            'type' => 'select',
            'value' => 'cover',
            'constraints' => 'cover|contain|normal',
            'position' => 1515
        ],
        [
            'group' => 'background',
            'name' => 'sBackgroundPosHorizontal',
            'type' => 'select',
            'value' => 'center',
            'constraints' => 'left|right|center',
            'position' => 1520
        ],
        [
            'group' => 'background',
            'name' => 'sBackgroundPosVertical',
            'type' => 'select',
            'value' => 'top',
            'constraints' => 'top|bottom|center',
            'position' => 1525
        ],
        [
            'group' => 'background',
            'name' => 'sBackgroundRepeat',
            'type' => 'select',
            'value' => 'no-repeat',
            'constraints' => 'no-repeat|repeat-x|repeat-y|repeat',
            'position' => 1530
        ],
        [
            'group' => 'background',
            'name' => 'blBackgroundAttachment',
            'type' => 'bool',
            'value' => 1,
            'position' => 1535
        ],

        //Group features:
        [
            'group' => 'features',
            'name' => 'bl_showCompareList',
            'type' => 'bool',
            'value' => 1,
            'position' => 1600
        ],
        [
            'group' => 'features',
            'name' => 'bl_showPriceAlarm',
            'type' => 'bool',
            'value' => 1,
            'position' => 1605
        ],
        [
            'group' => 'features',
            'name' => 'bl_showWishlist',
            'type' => 'bool',
            'value' => 1,
            'position' => 1610
        ],
        [
            'group' => 'features',
            'name' => 'bl_showListmania',
            'type' => 'bool',
            'value' => 1,
            'position' => 1615
        ],
        [
            'group' => 'features',
            'name' => 'bl_showVouchers',
            'type' => 'bool',
            'value' => 1,
            'position' => 1620
        ],
        [
            'group' => 'features',
            'name' => 'bl_showGiftWrapping',
            'type' => 'bool',
            'value' => 1,
            'position' => 1625
        ],

        //Group footer:
        [
            'group' => 'footer',
            'name' => 'blFooterShowHelp',
            'type' => 'bool',
            'value' => 1,
            'position' => 1700
        ],
        [
            'group' => 'footer',
            'name' => 'blFooterShowLinks',
            'type' => 'bool',
            'value' => 1,
            'position' => 1705
        ],
        [
            'group' => 'footer',
            'name' => 'blFooterShowNewsletter',
            'type' => 'bool',
            'value' => 1,
            'position' => 1710
        ],
        [
            'group' => 'footer',
            'name' => 'blFooterShowNewsletterForm',
            'type' => 'bool',
            'value' => 1,
            'position' => 1715
        ],
        [
            'group' => 'footer',
            'name' => 'sFacebookUrl',
            'type' => 'str',
            'value' => 'https://www.facebook.com',
            'position' => 1720
        ],
        [
            'group' => 'footer',
            'name' => 'sTwitterUrl',
            'type' => 'str',
            'value' => 'https://twitter.com',
            'position' => 1725
        ],
        [
            'group' => 'footer',
            'name' => 'sYouTubeUrl',
            'type' => 'str',
            'value' => 'https://www.youtube.com',
            'position' => 1730
        ],
        [
            'group' => 'footer',
            'name' => 'sBlogUrl',
            'type' => 'str',
            'value' => 'https://wordpress.org',
            'position' => 1735
        ],

        //Group contact:
        [
            'group' => 'contact',
            'name' => 'sGoogleMapsAddr',
            'type' => 'str',
            'value' => 'OXID eSales AG, Bertoldstraße 48, 79098 Freiburg',
            'position' => 1800
        ],

        //Group emails:
        [
            'group' => 'emails',
            'name' => 'sEmailLogo',
            'type' => 'str',
            'value' => 'logo_email.png',
            'position' => 1900
        ],
        [
            'group' => 'emails',
            'name' => 'blEmailsShowProductPictures',
            'type' => 'bool',
            'value' => 0,
            'position' => 1905
        ],

        //Group googleanalytics:
        [
            'group' => 'googleanalytics',
            'name' => 'sGATrackingId',
            'type' => 'str',
            'value' => '',
            'position' => 2000
        ],
        [
            'group' => 'googleanalytics',
            'name' => 'blUseGAEcommerceTracking',
            'type' => 'bool',
            'value' => 1,
            'position' => 2005
        ],
        [
            'group' => 'googleanalytics',
            'name' => 'blUseGAPageTracker',
            'type' => 'bool',
            'value' => 1,
            'position' => 2010
        ],
        [
            'group' => 'googleanalytics',
            'name' => 'blGAAnonymizeIPs',
            'type' => 'bool',
            'value' => 1,
            'position' => 2015
        ],

        //Group googlets:
        [
            'group' => 'googlets',
            'name' => 'blUseGoogleTS',
            'type' => 'bool',
            'value' => 0,
            'position' => 2100
        ],
        [
            'group' => 'googlets',
            'name' => 'sGoogleVendorId',
            'type' => 'str',
            'value' => '',
            'position' => 2105
        ],
        [
            'group' => 'googlets',
            'name' => 'sPageLanguage',
            'type' => 'str',
            'value' => 'de_DE',
            'position' => 2110
        ],
        [
            'group' => 'googlets',
            'name' => 'sGoogleShoppingAccountId',
            'type' => 'str',
            'value' => '',
            'position' => 2115
        ],
        [
            'group' => 'googlets',
            'name' => 'sShippingDaysOnStock',
            'type' => 'str',
            'value' => '3',
            'position' => 2120
        ],
        [
            'group' => 'googlets',
            'name' => 'sShippingDaysNotOnStock',
            'type' => 'str',
            'value' => '5',
            'position' => 2125
        ],
        [
            'group' => 'googlets',
            'name' => 'sDeliveryDaysOnStock',
            'type' => 'str',
            'value' => '6',
            'position' => 2130
        ],
        [
            'group' => 'googlets',
            'name' => 'sDeliveryDaysNotOnStock',
            'type' => 'str',
            'value' => '14',
            'position' => 2135
        ],
        [
            'group' => 'googlets',
            'name' => 'sShoppingLanguage',
            'type' => 'str',
            'value' => 'de',
            'position' => 2140
        ],
        [
            'group' => 'googlets',
            'name' => 'sShoppingCountry',
            'type' => 'str',
            'value' => 'DE',
            'position' => 2145
        ],
    ],
];
