#include "script_component.hpp"

disableSerialization;

private ["_mapDisplay", "_grpMain"];

params ["_control", "_type"];

if(ctrlIDC _control == IDC_GRP_RFTREPORT) then {
    _grpMain = _control;
} else {
    _mapDisplay = ctrlParent _control;
    _grpMain = _mapDisplay displayCtrl IDC_GRP_RFTREPORT;
};
_type = toLower _type;

if ("show" == _type) exitWith {
    _grpMain ctrlShow true;
    GVAR(mainControlsVisible) = true;

    if(EGVAR(bft,active) && {EGVAR(bft,mainControlsVisible)}) then {
        [_grpMain, "hide"] call EFUNC(bft,toggleMainControl);
    };
};
if ("hide" == _type) exitWith {
    _grpMain ctrlShow false;
    GVAR(mainControlsVisible) = false;
};
