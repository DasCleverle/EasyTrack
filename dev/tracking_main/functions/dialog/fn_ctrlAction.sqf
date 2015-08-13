#include "script_component.hpp"

PARAMS_3(_display,_controls,_actionParams);

{
    EXPLODE_4_PVT(_x,_type,_params,_name,_idc);
    private ["_control"];
    _control = _display displayCtrl _idc;

    {
        EXPLODE_2_PVT(_x,_xName,_xFunc);
        if(_xName == _name) then {
            [_control] call _xFunc;
        };
    } foreach _actionParams;
} foreach _controls;