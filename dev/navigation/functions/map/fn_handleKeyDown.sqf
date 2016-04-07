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