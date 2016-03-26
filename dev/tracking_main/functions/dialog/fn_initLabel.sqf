#include "script_component.hpp"

params ["_control","_mainOrientationPos","_orientation","_params"];
_params params ["_text",["_setPadding",true]];

private ["_return"];

// Set the label text
_control ctrlSetText _text;

// Set the label position
private _controlPos = ctrlPosition _control;

switch(_orientation) do {
    case "horizontal": {
        _controlPos set [0, _mainOrientationPos];
        _controlPos set [1, BASE_Y];

        _padding = ([0,BASE_X] select _setPadding);
        _return = (_controlPos select 2) + _padding;
    };
    case "vertical": {
        _controlPos set [0, BASE_X];
        _controlPos set [1, _mainOrientationPos];

        _padding = ([0,BASE_Y] select _setPadding);
        _return = (_controlPos select 3) + _padding;
    };
};

_control ctrlSetPosition _controlPos;
_control ctrlCommit 0;

// Return the new yPos
_return;