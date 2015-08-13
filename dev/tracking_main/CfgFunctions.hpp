class CfgFunctions {
    class ADDON {
        class common {
            file = FUNCFILE(common);

            class colorArrayToString {};
            class colorStringToArray {};
            class dirToString {};
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
    };
};