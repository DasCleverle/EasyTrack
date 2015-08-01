class CfgVehicles {

    class Logic;
    class Module_F: Logic {
        class ArgumentsBaseUnits {
          class Units;
        };
    };

    class MODULE_BFT: Module_F {
        scope = 2;
        displayName = "Enable Blue Force Tracking";
        //icon = "\dlp\logitrack\pictures\cl_module_logitrack.paa";
        category = QUOTE(MODULE_CATEGORY);
        function = QUOTE(FUNC(initModule));
        functionPriority = 1;
        isGlobal = 2;
        isTriggerActivated = 0;
        isDisposable = 0;
        author = MAINAUTHOR;
    };
};