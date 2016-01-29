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

Flow = Flow || {};

Flow.initDetailsEvents = function()
{
    var $oDetailsWrapper = $( '#details' ),
        $oReviewRating   = $( '#reviewRating'),
        $oMorePicsSlider = $( '#morePicsContainer' ),
        pswp             = this.setPhotoSwipe();

    if( $oDetailsWrapper.length )
    {
        // Variantenauswahl
        $( '#variants .dropdown-menu li a', $oDetailsWrapper ).click( function( e )
            {
                e.preventDefault();
                var $this = $( this );
                $this.closest( '.selectbox' ).removeClass( 'open' );
                $this.parent().parent().prev().siblings( 'button' ).find( 'span' ).first().text( $this.text() );

                $oDetailsWrapper.find( '#detailsMain' ).prepend( getAjaxLoader() );
            }
        );

        // Auswahllisten
        $( '#productSelections .dropdown-menu li a', $oDetailsWrapper ).click( function( e )
            {
                e.preventDefault();
                var $this = $( this );
                $this.closest( '.selectbox' ).removeClass( 'open' );
                $this.parent().parent().prev().val( $this.attr( 'data-selection-id' ) );
                $this.parent().parent().prev().siblings( 'button' ).find( 'span' ).first().text( $this.text() );
            }
        );
    }

    if( $oReviewRating.length )
    {
        var $oRatingForm = $( '#rating' );

        $oReviewRating.find( '.ox-write-review' ).on( 'click mouseenter touch',
            function()
            {
                var $this    = $( this ),
                    $oParent = $this.parent();
                $oParent.prevAll().find( 'i' ).removeClass( 'fa-star-o' ).addClass( 'fa-star' );
                $oParent.nextAll().find( 'i' ).removeClass( 'fa-star' ).addClass( 'fa-star-o' );
                $this.find( 'i' ).removeClass( 'fa-star-o' ).addClass( 'fa-star' );

                $oRatingForm.find( '#recommListRating, #productRating' ).val( $oParent.attr( 'data-rate-value' ) );
            }
        );
    }

    $( '#zoom1' ).click( function( e )
        {
            e.preventDefault();
            var iIndex = 0;

            if( $oMorePicsSlider.length )
            {
                iIndex = $oMorePicsSlider.find( 'a.selected' ).data( 'num' ) - 1;
            }

            pswp.open( iIndex, this );
        }
    );

    if( $oMorePicsSlider.length )
    {
        $oMorePicsSlider.find( 'a' ).click( function( e )
            {
                e.preventDefault();
                var $this = $( this );
                $( '#zoom1' ).attr( 'href', $this.data( 'zoom-url' ) ).find( 'img' ).attr( 'src', this.href );
                $oMorePicsSlider.find( 'a.selected' ).removeClass( 'selected' );
                $this.addClass( 'selected' );
            }
        );

        if( $oMorePicsSlider.hasClass( 'flexslider' ) )
        {
            $oMorePicsSlider.flexslider(
                {
                    animation: "slide",
                    itemWidth: 150,
                    minItems: 5,
                    maxItems: 5
                }
            );
        }
    }
};

Flow.setPhotoSwipe = function()
{
    var obj   = {},
        $oMorePicsContainer = $( '#morePicsContainer' );
    obj.pswp  = $( '.pswp' )[ 0 ];
    obj.items = [];

    if( $oMorePicsContainer.length )
    {
        $oMorePicsContainer.find( 'a' ).each( function()
            {
                var $this = $( this );

                obj.items.push(
                    {
                        src: $this.data( 'zoom-url' ),
                        w: $this.data( 'width' ),
                        h: $this.data( 'height' )
                    }
                );
            }
        );
    }
    else
    {
        var $oZoom = $( '#zoom1' );
        obj.items.push(
            {
                src: $oZoom.attr( 'href' ),
                w: $oZoom.data( 'width' ),
                h: $oZoom.data( 'height' )
            }
        );
    }

    obj.open =  function( index, elm )
    {
        if( typeof index === 'undefined' )
        {
            index = 0;
        }

        // define options (if needed)
        var options = {
            index: index, // start at first slide
            getThumbBoundsFn: function( index )
                   {
                       //var thumbnail = $( '.dd-zoom-toggle[data-index=' + index + ']' )[ 0 ];

                       var pageYScroll = window.pageYOffset || document.documentElement.scrollTop;
                       var rect = elm.getBoundingClientRect();

                       return {x:rect.left, y:rect.top + pageYScroll, w:rect.height};
                   },

            mainClass: 'pswp--minimal--dark',
            barsSize: { top:0, bottom:0 },
            captionEl: false,
            fullscreenEl: false,
            shareEl: false,
            bgOpacity: 0.85,
            tapToClose: true,
            tapToToggleControls: false
        };

        // Initializes and opens PhotoSwipe
        var gallery = new PhotoSwipe( this.pswp, PhotoSwipeUI_Default, this.items, options );
        gallery.init();
    };

    return obj;
};

function getAjaxLoader()
{
    var oLayerElem   = document.createElement( 'div' ),
        oSpinnerElem = document.createElement( 'div' ),
        oBubbleElem1 = document.createElement( 'span' ),
        oBubbleElem2 = document.createElement( 'span' ),
        oBubbleElem3 = document.createElement( 'span' );

    oLayerElem.className   = 'ajax-loader';
    oSpinnerElem.className = 'ajax-loader-spinner';
    oBubbleElem1.className = 'bubble1';
    oBubbleElem2.className = 'bubble2';
    oBubbleElem3.className = 'bubble3';

    oSpinnerElem.appendChild( oBubbleElem1 );
    oSpinnerElem.appendChild( oBubbleElem2 );
    oSpinnerElem.appendChild( oBubbleElem3 );

    oLayerElem.appendChild( oSpinnerElem );

    return oLayerElem;
}

$( document ).ready( function()
    {

        if( window.isMobileDevice() )
        {
            var $oBody         = $( 'body' ),
                $oSwipeOverlay = $( '#swipe-overlay' ),
                carousel       = new Carousel( '#swipe-overlay' );

            $oSwipeOverlay.appendTo( $oBody );

            carousel.init();

            $( '#zoom1, #morePicsContainer a' ).on( 'click touch', function( e )
                {
                    e.preventDefault();
                    $oSwipeOverlay.addClass( 'open' );

                    // Lazy Loading
                    $oSwipeOverlay.find( 'img' ).each( function()
                        {
                            var $this = $( this ),
                                sSrc  = $this.data( 'src' );

                            if( sSrc ) {
                                $this.attr( 'src', sSrc );
                            }
                        }
                    );
                }
            );

            $oSwipeOverlay.find( '.close-btn' ).on( 'click touch', function()
                {
                    $oSwipeOverlay.removeClass( 'open' );
                }
            );
        }
    }
);