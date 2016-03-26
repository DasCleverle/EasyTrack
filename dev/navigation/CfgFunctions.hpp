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
        }
    };
};