#include "script_component.hpp"

params ["_control","_mainOrientationPos","_orientation","_params"];
EXPLODE_2_PVT(_params,_text,_fnc_onClick);

private ["_controlPos", "_return"];
_controlPos = ctrlPosition _control;

switch(_orientation) do {
    case "horizontal": {
        _controlPos set [0, _mainOrientationPos];
        _controlPos set [1, BASE_Y];
        _return = (_controlPos select 2) + BASE_X;
    };
    case "vertical": {
        _controlPos set [0, BASE_X];
        _controlPos set [1, _mainOrientationPos];
        _return = (_controlPos select 3) + BASE_Y;
    };
};

_control ctrlSetPosition _controlPos;

_control ctrlSetText _text;
_control ctrlAddEventHandler ["ButtonClick", format ["_this call %1;", str _fnc_onClick]];

_control ctrlCommit 0;

_return;