#include "script_component.hpp"

params ["_mapDisplay","_grpMain","_controls","_idc",["_orientation", "vertical"]];

private ["_background", "_orientationPos"];
_background = _mapDisplay ctrlCreate [QGVAR(Background), -1, _grpMain];
_background ctrlSetBackgroundColor [COLOR_BLACK_TR50];

// The current y-position to create controls on
switch(_orientation) do {
    case "vertical": {
        _orientationPos = BASE_Y;
    };
    case "horizontal": {
        _orientationPos = BASE_X;
    };
};

{
    EXPLODE_3_PVT(_x,_controlType,_params,_name);
    private ["_control", "_arguments", "_result"];

    // Create the control
    _control = _mapDisplay ctrlCreate [_controlType, _idc, _grpMain];

    // Initialize control
    _arguments = [_control, _orientationPos, _orientation, _params];
    _result = 0;
    {
        EXPLODE_2_PVT(_x,_type,_fnc);

        if(_type == _controlType) exitWith {
            _result = _arguments call _fnc;
        };
    } foreach GVAR(controlTypes);

    if(isNil "_name") then {
        _x pushBack "";
    };
    _x pushBack _idc;

    ADD(_orientationPos,_result);
    ADD(_idc,1000);
} foreach _controls;

// increase height of background if contrls dont fit on the screen
private ["_bgPos", "_bgOrientationPos", "_index"];

switch(_orientation) do {
    case "vertical": {
        _index = 3;
        _bgPos = [0, 0, GRP_WIDTH, GRP_HEIGHT];
    };
    case "horizontal": {
        _index = 2;
        _bgPos = [0, 0, safeZoneW, 0.3 * safeZoneH];
    };
};

_bgOrientationPos = _bgPos select _index;
if(_orientationPos > _bgOrientationPos) then {
    _bgPos set [_index, _orientationPos];

};
_background ctrlSetPosition _bgPos;
_background ctrlCommit 0;