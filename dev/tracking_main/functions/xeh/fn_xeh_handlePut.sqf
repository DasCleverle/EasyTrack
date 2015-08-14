#include "script_component.hpp"

PARAMS_3(_unit,_container,_item);

private ["_mapDisplay", "_btnActions", "_grpActions"];
_mapDisplay = DISPLAY(IDD_MAINMAP);

if(GVAR(mapInitialized) && {_item in TRACKER_ITEMS}) then {
    _btnActions = _mapDisplay displayCtrl IDC_BTN_ACTIONS;
    _grpActions = _mapDisplay displayCtrl IDC_GRP_ACTIONS;

    _btnActions ctrlShow false;
    _grpActions ctrlShow false;

    {
        if(ctrlIDC _x != -1) then {
            diag_log ctrlIDC _x;
        };
    } foreach allControls _mapDisplay;
};

