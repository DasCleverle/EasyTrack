#include "script_component.hpp"

PARAMS_3(_control,_yPos,_params);
EXPLODE_1_PVT(_params,_text);

private ["_controlPos", "_setPadding"];
_setPadding = [_params, 1, true] call CBA_fnc_defaultParam;

// Set the label text
_control ctrlSetText _text;

// Set the label position
_controlPos = ctrlPosition _control;
_controlPos set [0, BASE_X];
_controlPos set [1, _yPos];
_control ctrlSetPosition _controlPos;
_control ctrlCommit 0;

// Return the new yPos
if(_setPadding) then {
    (_controlPos select 3) + BASE_Y;
}
else {
    (_controlPos select 3);
};