#include "script_component.hpp"

PARAMS_2(_control,_index);

private ["_text", "_mapDisplay", "_grpActions"];
_text = _control lbText _index;
{
    EXPLODE_3(_x,_xText,_condition,_fnc_onAct);
    if(_xText == _text) then {
        call _fnc_onAct;
    };
} foreach GVAR(actions);

_mapDisplay = ctrlParent _control;
_grpActions = _mapDisplay displayCtrl IDC_GRP_ACTIONS;
_grpActions ctrlShow false;