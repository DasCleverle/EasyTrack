#include "script_component.hpp"

private ["_controlPos"];
params ["_control", "_yPos", "_args"];
_args params ["_text", ["_setPadding", true, [true]]];

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
} else {
    (_controlPos select 3);
};
