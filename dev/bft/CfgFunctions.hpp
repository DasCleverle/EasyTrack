class CfgFunctions {
    class ADDON {
        class dialog {
            file = FUNCFILE(dialog);

            class btn_centerOnIcon {};
            class btn_configure {};
            class btn_configureChecked {};
            class btn_configureHide {};

            class toggleMainControl {};
        };

        class main {
            file = FUNCFILE(main);

            class initModule {};
            class getSideColor {};
        };

        class map {
            file = FUNCFILE(map);

            class handleDraw {};
            class handleKeyDown {};
            class handleMouseButtonClick {};
            class handleMouseMoving {};

            class initMap {};
        };

        class map_draw {
            file = FUNCFILE(map\draw);

            class drawMarker {};
            class drawEmphasis {};
        };

        class marker {
            file = FUNCFILE(marker);

            class setCallsign {};
            class setFrequency {};
            class setSize {};
            class setSymbol {};
        }

        class sync {
            file = FUNCFILE(sync);
        };
    };
};