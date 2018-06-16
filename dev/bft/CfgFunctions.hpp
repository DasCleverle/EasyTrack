class CfgFunctions {
    class ADDON {
        class dialog {
            file = FUNCFILE(dialog);

            class actionConfigure {};

            class btn_centerOnIcon {};
            class btn_configureHide {};
            class btn_changePlayers {};
            class btn_changeSymbols {};
            class lst_configureChanged {};

            class initTextBoxNoMapClose {};
            class toggleMainControl {};
        };

        class main {
            file = FUNCFILE(main);

            class init {};
            class initClient {};
            class initModule {};
            class initAssign {};
            class initModuleAssign {};
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
        };

        class xeh {
            file = FUNCFILE(xeh);

            class xeh_handlePut {};
        };
    };
};
