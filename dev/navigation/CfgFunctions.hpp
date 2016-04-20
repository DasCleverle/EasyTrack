class CfgFunctions {
    class ADDON {
        class dialog {
            file = FUNCFILE(dialog);
        };

        class main {
            file = FUNCFILE(main);

            class init {};
            class initModule {};
            class postInit { postInit = 1; };

            class inArea {};
        };

        class map {
            file = FUNCFILE(map);

            class initMap {};

            class handleDraw {};
            class handleMouseButtonClick {};
            class handleMouseButtonDown {};
            class handleMouseButtonUp {};
            class handleMouseMoving {};

            class handleKeyDown {};
            class handleKeyUp {};
        };

        class map_draw {
            file = FUNCFILE(map\draw);

            class drawNavIcons {};
            class drawLines {};
        };

        class navicon {
            file = FUNCFILE(navicon);

            class createNavIcon {};
            class deleteNavIcon {};

            class getNavIconById {};
            class getNavIconIndex {};
        };

        class line {
            file = FUNCFILE(line);

            class startLineDraw {};
            class createLine {};
            class deleteLine {};

            class getLineById {};
            class getLineIndex {};

            class setLinePos {};
        };

        class line_draw {
            file = FUNCFILE(line\draw);

            class drawLine {};
        };
    };
};