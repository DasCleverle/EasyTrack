#define SYMBOL(ID, NAME) class ID { name = CSTRING(NAME); value = QMAINDATAPATH(symbols\ID.paa); }
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
        function = QFUNC(initModule);
        functionPriority = 1;
        isGlobal = 2;
        isTriggerActivated = 0;
        isDisposable = 0;
        author = MAINAUTHOR;
    };

    class MODULE_BFT_ASSIGN: Module_F {
        scope = 2;
        displayName = CSTRING(MODULE_ASSIGN_NAME);
        icon = QDATAPATH(icon_module_assign.paa);
        category = QUOTE(MODULE_CATEGORY);
        function = QFUNC(initModuleAssign);
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
                displayName = CSTRING(CALLSIGN);
                description = CSTRING(CALLSIGN_DESC);
                defaultValue = CSTRING(CALLSIGN_DEFAULT);
            };

            class Frequency {
                displayName = CSTRING(FREQUENCY);
                description = CSTRING(FREQUENCY_DESC);
                defaultValue = CSTRING(FREQUENCY);
            };

            class Symbol {
                displayName = CSTRING(SYMBOL);
                description = CSTRING(SYMBOL_DESC);
                class values {
                    SYMBOL(inf,INF);
                    SYMBOL(motinf,MOTINF);
                    SYMBOL(mechinf,MECHINF);
                    SYMBOL(recon,RECON);
                    SYMBOL(hq,HQ);
                    SYMBOL(armor,ARMOR);
                    SYMBOL(artillery,ARTILLERY);
                    SYMBOL(heli,HELI);
                    SYMBOL(jet,JET);
                    SYMBOL(logistics,LOGISTICS);
                    SYMBOL(medical,MEDICAL);
                };
            };

            class Size {
                displayName = CSTRING(SIZE);
                description = CSTRING(SIZE_DESC);

                class values {
                    SIZE(fireteam,FIRETEAM,SIZE_FIRETEAM);
                    SIZE_DEF(unit,UNIT,SIZE_UNIT);
                    SIZE(squad,SQUAD,SIZE_SQUAD);
                    SIZE(platoon,PLATOON,SIZE_PLATOON);
                };
            };
        };
    };
};
