#include "script_component.hpp"

PARAMS_4(_mapDisplay,_grpMain,_controls,_idc);

private ["_background"];
_background = _mapDisplay ctrlCreate [QGVAR(Background), -1, _grpMain];
_background ctrlSetBackgroundColor [COLOR_BLACK_TR50];

// The current y-position to create controls on
_yPos = 0;
{
    EXPLODE_3_PVT(_x,_controlType,_params,_name);
    private ["_control", "_arguments", "_result"];

    // Create the control
    _control = _mapDisplay ctrlCreate [_controlType, _idc, _grpMain];

    // Initialize control
    _arguments = [_control, _yPos, _params];
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

    ADD(_yPos,_result);
    ADD(_idc,1000);
} foreach _controls;

// increase height of background if contrls dont fit on the screen
private ["_bgPos", "_bgHeight"];
_bgPos = [0, 0, GRP_WIDTH, GRP_HEIGHT];
_background ctrlSetPosition _bgPos;
_bgHeight = _bgPos select 3;
if(_yPos > _bgHeight) then {
    _bgPos set [3, _yPos];
    _background ctrlSetPosition _bgPos;
};
_background ctrlCommit 0;