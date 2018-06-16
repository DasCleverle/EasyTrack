class CfgVehicles {

    class Logic;
    class Module_F: Logic {
        class ArgumentsBaseUnits {
          class Units;
        };
    };

    class MODULE_RFT: Module_F {
        scope = 1;
        displayName = CSTRING(Enable);
        icon = QDATAPATH(icon_module.paa);
        category = QUOTE(MODULE_CATEGORY);
        function = QUOTE(FUNC(initModule));
        functionPriority = 1;
        isGlobal = 2;
        isTriggerActivated = 0;
        isDisposable = 0;
        author = MAINAUTHOR;
    };
};
