class Extended_Put_Eventhandlers {
    class Man {
        class GVAR(putTracker) {
            put = QUOTE(_this call FUNC(xeh_handlePut));
        };
    };
};
class Extended_PreInit_Eventhandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};
