#include "script_component.hpp"

disableSerialization;

PARAMS_2(_control,_type);

private ["_mapDisplay", "_grpMain"];
if(ctrlIDC _control == IDC_GRP_BFT) then {
    _grpMain = _control;
}
else {
    _mapDisplay = ctrlParent _control;
    _grpMain = _mapDisplay displayCtrl IDC_GRP_BFT;
};

switch (toLower _type) do {
    case "show": {
        _grpMain ctrlShow true;
        GVAR(mainControlsVisible) = true;

        if(EGVAR(rft,active) && {EGVAR(rft,mainControlsVisible)}) then {
            [_grpMain, "hide"] call EFUNC(rft,toggleMainControl);
        };
    };
    case "hide": {
        _grpMain ctrlShow false;
        GVAR(mainControlsVisible) = false;
    };
};