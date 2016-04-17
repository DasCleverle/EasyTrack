#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

disableSerialization;
params ["_mapDisplay", "_keyCode", "_shiftState", "_ctrlState", "_altState"];

// Control button
if(_keyCode == DIK_LCONTROL || {_keyCode == DIK_RCONTROL}) then {
    GVAR(ctrlPressed) = true;
};

// Alt
if(_keyCode == DIK_LALT || {_keyCode == DIK_RALT}) then {
    GVAR(altPressed) = true;
};

// Delete
if(_keyCode == DIK_DELETE) then {
    if(!isNil QGVAR(hoveredNavIcon)) then {
        [NAVICON_GET_ID(GVAR(hoveredNavIcon))] call FUNC(deleteNavIcon);
    };

    if(!isNil QGVAR(hoveredLine)) then {
        [LINE_GET_ID(GVAR(hoveredLine))] call FUNC(deleteLine);
    };
};

nil;