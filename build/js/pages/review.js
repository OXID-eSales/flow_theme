/**
 *
 *     |o     o    |          |
 * ,---|.,---..,---|,---.,---.|__/
 * |   |||   |||   ||---'`---.|  \
 * `---'``---|``---'`---'`---'`   `
 *       `---'    [media solutions]
 *
 * @copyright   (c) digidesk - media solutions
 * @link        http://www.digidesk.de
 * @author      Kai
 * @version     SVN: $Id$
 */
$( document ).ready( function()
    {
        var $oReviewRating = $( '#reviewRating' );

        if( $oReviewRating.length )
        {
            var $oRatingForm = $( '#rating' );

            $oReviewRating.find( '.ox-write-review' ).on( 'click mouseenter touch', function()
                {
                    var $this    = $( this ),
                        $oParent = $this.parent();

                    $oParent.prevAll().find( 'i' ).removeClass( 'icon-star-o' ).addClass( 'icon-star' );
                    $oParent.nextAll().find( 'i' ).removeClass( 'icon-star' ).addClass( 'icon-star-o' );
                    $this.find( 'i' ).removeClass( 'icon-star-o' ).addClass( 'icon-star' );

                    $oRatingForm.find( '#recommListRating, #productRating' ).val( $oParent.attr( 'data-rate-value' ) );
                }
            );
        }
    }
);