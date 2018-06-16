#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cba_main", QUOTE(DOUBLES(PREFIX,main))};
        author = MAINAUTHOR;
        authors[] = {AUTHORS};
        url = "http://www.gruppe-w.de/";
        VERSION_CONFIG;
    };
    class CL_rft {author="";};
};

#include "CfgFunctions.hpp"
#include "CfgVehicles.hpp"
#include "dialog.hpp"
#include "Extended_Eventhandlers.hpp"
