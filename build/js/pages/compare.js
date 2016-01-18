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

// Short-Handle für document.ready
$( function ()
{
    var oCompPlayground = $( '#comparePlayground' );

    // Wenn Compare-Seite
    if ( oCompPlayground.length > 0 )
    {
        $( '#compareLandscape' ).scroll(
            function( oEvent )
            {
                $( this ).toggleClass( 'shadowed', $( this ).scrollLeft() > 0 );
            }
        );
    }
} );