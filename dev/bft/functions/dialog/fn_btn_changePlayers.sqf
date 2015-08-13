#include "script_component.hpp"

disableSerialization;

private ["_mapDisplay", "_lstConfigure"];
params ["_args", "_scope"];
_args params ["_control"];
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
if (toLower _scope == "leader") then {
    {
        GVAR(configureUnits) pushBack (leader _x);
        true
    } count allGroups;
if (toLower _scope == "all") then {
    GVAR(configureUnits) = allUnits;
};

[_mapDisplay displayCtrl IDC_BTN_CONFIGURE] call FUNC(btn_configure);
