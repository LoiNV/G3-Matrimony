( function ( $ ) {

    $.ns('Subscribe');

    Subscribe.TabbedRateCard = function () {
        var _container     = null,
            _bundleTabs    = null,
            _bundleContent = null,
            _rateRow       = null;

        var wireUpEvents = function () {
            
            var activeBullet = null,
                activeRow    = null;

            _rateRow.click( function ( e ) {
                activeRow = $( this );
                
                if (! /(bullet|sub-length)/.test(e.target.className))
                    { return; }

                activeBullet = $('.bullet', activeRow);
                if (!activeBullet.length)
                    { return; }
                
                $( '.ui-checked', _bundleContent ).removeClass( 'ui-checked' );
                $( '.ui-active', _bundleContent ).removeClass( 'ui-active' );

                activeRow.addClass( 'ui-active' );
                activeBullet.addClass( 'ui-checked' );

                setPlanSelection( activeBullet );
            });

            _bundleTabs.click( function () {
                var tab = $( this ),
                    content = tab.attr( 'data-content' ),
                    trackingUrl = tab.attr( 'data-tracking' );

                if ( !tab.hasClass( 'ui-active' ) ) {
                    _bundleTabs.removeClass( 'ui-active' );
                    _container.removeClass( 'basic bundle' );

                    tab.addClass( 'ui-active' );
                    _container.addClass( content );
                    
                    setPlanSelection( $( '.ui-checked', '#' + content ) );
                    setTrackingTabInfo( trackingUrl );

                    _bundleContent = $( '#' + content, _container );
                }
            });            
        };

        var setTrackingTabInfo = function ( url ) {
            $.ajax({
                url: url,
                type: 'GET'
            });
        };

        var setPlanSelection = function ( selection ) {
            $( '#selectedProduct' ).val( selection.attr( 'data-value' ) );
        };

        return {
            wakeFrom: function ( container ) {
                _container      = $( container );
                _bundleTabs     = $( '.packages-tab', container );
                _rateRow        = $('.rate', container);
                _bundleContent  = $('#bundle', container);

                if (_bundleContent.length) {

                    setPlanSelection($('#bundle .bullet.ui-checked'));

                } else {

                    _bundleContent = $('#basic', container);
                    setPlanSelection($('#basic .bullet.ui-checked'));

                }

                wireUpEvents();
            }
        };
    };

})( jQuery );