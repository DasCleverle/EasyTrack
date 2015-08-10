#include "script_component.hpp"

params ["_control", "_mainYPos", "_args"];
_args params ["_text", "_fnc_onClick"];

_controlPos = ctrlPosition _control;
_controlPos set [0, BASE_X];
_controlPos set [1, _mainYPos];
_control ctrlSetPosition _controlPos;

_control ctrlSetText _text;
_control ctrlAddEventHandler ["ButtonClick", format ["_this spawn %1;", str _fnc_onClick]];

_control ctrlCommit 0;

(_controlPos select 3) + BASE_Y;
