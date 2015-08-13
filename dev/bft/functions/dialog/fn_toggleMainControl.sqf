#include "script_component.hpp"

disableSerialization;
private ["_mapDisplay", "_grpMain"];
params ["_control", "_type"];

if(ctrlIDC _control == IDC_GRP_BFT) then {
    _grpMain = _control;
} else {
    _mapDisplay = ctrlParent _control;
    _grpMain = _mapDisplay displayCtrl IDC_GRP_BFT;
};

if (toLower _type == "show") then {
    _grpMain ctrlShow true;
    GVAR(mainControlsVisible) = true;

    if(EGVAR(rft,active) && {EGVAR(rft,mainControlsVisible)}) then {
        [_grpMain, "hide"] call EFUNC(rft,toggleMainControl);
    };
} else {
    _grpMain ctrlShow false;
    GVAR(mainControlsVisible) = false;
};
