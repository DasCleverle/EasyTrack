class CfgFunctions {
    class ADDON {
        class dialog {
            file = FUNCFILE(dialog);

            class btn_centerOnIcon {};
            class btn_toggleEllipse {};
            class btn_editFavorite {};
            class btn_setFavorite {};
            class dir_setSelected {};
            class ellipse_setText {};
            class fav_updateControls {};

            class initFavContainer {};

            class toggleMainControl {};
        };

        class main {
            file = FUNCFILE(main);

            class init {};
            class initModule {};
            class getMarkerIndex {};
            class dirToString {};
        };

        class map {
            file = FUNCFILE(map);

            class initMap {};

            class handleDraw {};
            class handleKeyDown {};
            class handleKeyUp {};
            class handleMouseButtonClick {};
            class handleMouseButtonDblClick {};
            class handleMouseButtonDown {};
            class handleMouseButtonUp {};
            class handleMouseMoving {};

            class resetCtrlState {};
        };

        class map_draw {
            file = FUNCFILE(map\draw);

            class drawEmphasis {};
            class drawMarker {};
            class drawResizeEllipse {};
            class drawRotateDirection {};
        };

        class marker {
            file = FUNCFILE(marker);

            class createMarker {};
            class deleteMarker {};

            class setColor {};
            class setDirection {};
            class setSize {};
            class setSymbol {};
        };

        class sync {
            file = FUNCFILE(sync);

            class invokeSyncMarker {};
            class syncMarker {};
        };

        class xeh {
            file = FUNCFILE(xeh);

            class xeh_handlePut {};
        };
    };
};