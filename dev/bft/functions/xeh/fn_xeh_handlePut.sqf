#include "script_component.hpp"

if(!GVAR(active)) exitWith {};
private ["_mapDisplay", "_btnConfigure", "_grpConfigure"];
params ["_unit", "_container", "_item"];

_mapDisplay = DISPLAY(IDD_MAINMAP);

if(_item in TABLET_ITEMS) then {
    _btnConfigure = _mapDisplay displayCtrl IDC_BTN_CONFIGURE;
    _btnConfigure ctrlShow false;

    if(GVAR(configureVisible)) then {
        _grpConfigure = _mapDisplay displayCtrl IDC_GRP_CONFIGURECONTAINER;
        _grpConfigure ctrlShow false;
        GVAR(configureVisible) = false;
    };
};

if(_item in TRACKER_ITEMS && {GVAR(mainControlsVisible)}) then {
    GVAR(selectedMarker) = nil;
    [_mapDisplay displayCtrl IDC_GRP_BFT, "hide"] call FUNC(toggleMainControl);
    (_mapDisplay displayCtrl IDC_GRP_MARKERTOOLTIP) ctrlShow false;
};
