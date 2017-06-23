class CfgFunctions {
    class ADDON {
        class actions {
            file = FUNCFILE(actions);

            class actionSelfDestruct {};
            class addAction {};
            class btn_toggleActions {};
            class initMap {};
            class lst_execAction {};
            class removeAction {};
        };

        class common {
            file = FUNCFILE(common);

            class colorArrayToString {};
            class colorStringToArray {};
            class getSideFromItem {};
            class isFriend {};
            class preInit { preInit = 1; };
            class postInit { postInit = 1; };
        };

        class dialog {
            file = FUNCFILE(dialog);

            class ctrlAction {};

            class initButton {};
            class initContainer {};
            class initLabel {};
            class initMainControl {};
            class initTextBox {};
        };

        class xeh {
            file = FUNCFILE(xeh);

            class xeh_handlePut {};
            class xeh_handleTake {};
        };
    };
};