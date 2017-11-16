#include "script_component.hpp"

disableSerialization;

PARAMS_2(_params,_scope);
EXPLODE_1_PVT(_params,_control);
private ["_mapDisplay", "_lstConfigure"];

_mapDisplay = ctrlParent _control;

GVAR(configureUnits) = [];

switch (toLower _scope) do {
    case "leaders": {
        {
            GVAR(configureUnits) pushBack (leader _x);
        } foreach allGroups;
    };
    case "all": {
        GVAR(configureUnits) = allPlayers;
    };
};

[_mapDisplay displayCtrl IDC_BTN_CONFIGURE] call FUNC(btn_configureHide);
[] call FUNC(actionConfigure);