#define SYMBOL(ID, NAME) class ID { name = QUOTE(NAME); value = QMAINDATAPATH(symbols\ID.paa); }
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
                }
            };
        };
    };

    class MODULE_BFT: Module_F {
        scope = 2;
        displayName = "Enable Blue Force Tracking";
        category = QUOTE(MODULE_CATEGORY);
        function = QUOTE(FUNC(initModule));
        functionPriority = 1;
        isGlobal = 2;
        isTriggerActivated = 0;
        isDisposable = 0;
        author = MAINAUTHOR;
    };

    class MODULE_BFT_ASSIGN: Module_F {
        scope = 2;
        displayName = "Assign Blue Force Information";
        category = QUOTE(MODULE_CATEGORY);
        function = QUOTE(FUNC(initModuleAssign));
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
                displayName = "Callsign";
                description = "The callsign of the unit";
                defaultValue = "NO CALLSIGN";
            };

            class Frequency {
                displayName = "Frequency/Channel";
                description = "Internal frequency (TFAR) or channel (ACRE) of the unit";
                defaultValue = "NO FREQ";
            };

            class Symbol {
                displayName = "Symbol";
                description = "The NATO symbol that represents the unit";
                class values {
                    SYMBOL(inf,Infantry);
                    SYMBOL(motinf,Motorized Infantry);
                    SYMBOL(mechinf,Mechanized Infantry);
                    SYMBOL(recon,Recon);
                    SYMBOL(hq,HQ);
                    SYMBOL(armor,Armor);
                    SYMBOL(artillery,Artillery);
                    SYMBOL(heli,Heli);
                    SYMBOL(jet,Jet);
                    SYMBOL(logistics,Logistics);
                    SYMBOL(medical,Medical);
                }
            };

            class Size {
                displayName = "Size";
                description = "The size of the unit";

                class values {
                    SIZE(fireteam,Fireteam,SIZE_FIRETEAM);
                    SIZE_DEF(unit,Unit/Vehicle,SIZE_UNIT);
                    SIZE(squad,Squad,SIZE_SQUAD);
                    SIZE(platoon,Platoon,SIZE_PLATOON);
                };
            };
        };
    };
};