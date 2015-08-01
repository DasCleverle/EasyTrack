#include "script_component.hpp"

PARAMS_3(_control,_mainYPos,_params);
EXPLODE_1_PVT(_params,_fnc_onChar);

_controlPos = ctrlPosition _control;
_controlPos set [0, BASE_X];
_controlPos set [1, _mainYPos];
_control ctrlSetPosition _controlPos;

_control ctrlAddEventHandler ["KeyUp", format ["_this call %1", _fnc_onChar]];
_control ctrlCommit 0;

(_controlPos select 3) + BASE_Y;