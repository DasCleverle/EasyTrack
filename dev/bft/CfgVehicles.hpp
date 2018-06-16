#define SYMBOL(ID, NAME) class ID { name = QUOTE(NAME); value = QMAINDATAPATH(symbols\ID.paa); }
#undef SIZE
#define SIZE(ID, NAME, VALUE) class ID { name = QUOTE(NAME); value = VALUE; }
#define SIZE_DEF(ID, NAME, VALUE) class ID { name = QUOTE(NAME); value = VALUE; default = 1; }

class CfgVehicles {

    class Logic;
    class Module_F: Logic {
        class ArgumentsBaseUnits {
            class Units {
                class values {
                    class Objects;
                    class ObjectsAndGroups;
                    class Trigger;
                };
            };
        };
    };

    class MODULE_BFT: Module_F {
        scope = 1;
        displayName = CSTRING(Enable);
        icon = QDATAPATH(icon_module.paa);
        category = QUOTE(MODULE_CATEGORY);
        function = FUNC(initModule);
        functionPriority = 1;
        isGlobal = 2;
        isTriggerActivated = 0;
        isDisposable = 0;
        author = MAINAUTHOR;
    };

    class MODULE_BFT_ASSIGN: Module_F {
        scope = 2;
        displayName = $STR_MODULE_BFT_ASSIGN_NAME;
        icon = QDATAPATH(icon_module_assign.paa);
        category = QUOTE(MODULE_CATEGORY);
        function = FUNC(initModuleAssign);
        functionPriority = 1;
        isGlobal = 2;
        isTriggerActivated = 0;
        isDisposable = 0;
        author = MAINAUTHOR;


        class Arguments : ArgumentsBaseUnits {
            class Units: Units {
                class values: values {
                    class Objects: Objects { default = 1; };
                    class ObjectsAndGroups: ObjectsAndGroups { default = 0; };
                };
            };

            class Callsign {
                displayName = $STR_BFT_CALLSIGN;
                description = $STR_BFT_CALLSIGN_DESC;
                defaultValue = $STR_BFT_CALLSIGN_DEFAULT;
            };

            class Frequency {
                displayName = $STR_BFT_FREQUENCY;
                description = $STR_BFT_FREQUENCY_DESC;
                defaultValue = $STR_BFT_FREQUENCY;
            };

            class Symbol {
                displayName = $STR_BFT_SYMBOL;
                description = "$STR_BFT_SYMBOL_DESC";
                class values {
                    SYMBOL(inf,$STR_BFT_INF);
                    SYMBOL(motinf,$STR_BFT_MOTINF);
                    SYMBOL(mechinf,$STR_BFT_MECHINF);
                    SYMBOL(recon,$STR_BFT_RECON);
                    SYMBOL(hq,$STR_BFT_HQ);
                    SYMBOL(armor,$STR_BFT_ARMOR);
                    SYMBOL(artillery,$STR_BFT_ARTILLERY);
                    SYMBOL(heli,$STR_BFT_HELI);
                    SYMBOL(jet,$STR_BFT_JET);
                    SYMBOL(logistics,$STR_BFT_LOGISTICS);
                    SYMBOL(medical,$STR_BFT_MEDICAL);
                };
            };

            class Size {
                displayName = $STR_BFT_SIZE;
                description = $STR_BFT_SIZE_DESC;

                class values {
                    SIZE(fireteam,$STR_BFT_FIRETEAM,SIZE_FIRETEAM);
                    SIZE_DEF(unit,$STR_BFT_UNIT,SIZE_UNIT);
                    SIZE(squad,$STR_BFT_SQUAD,SIZE_SQUAD);
                    SIZE(platoon,$STR_BFT_PLATOON,SIZE_PLATOON);
                };
            };
        };
    };
};
