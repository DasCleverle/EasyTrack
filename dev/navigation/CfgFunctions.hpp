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
        };

        class navicon {
            file = FUNCFILE(navicon);

            class createNavIcon {};
            class deleteNavIcon {};

            class getNavIconById {};
            class getNavIconIndex {};
        };
    };
};