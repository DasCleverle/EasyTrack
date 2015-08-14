#include "script_component.hpp"

disableSerialization;
PARAMS_1(_control);
private ["_mapDisplay", "_grpActions", "_lstActions"];

_mapDisplay = ctrlParent _control;
_grpActions = _mapDisplay displayCtrl IDC_GRP_ACTIONS;
_lstActions = _mapDisplay displayCtrl IDC_LST_ACTIONS;

lbClear _lstActions;
{
    EXPLODE_2_PVT(_x,_text,_condition);
    if(call _condition) then {
        _lstActions lbAdd _text;
    };
} foreach GVAR(actions);

_grpActions ctrlShow !(ctrlShown _grpActions);