#include "script_component.hpp"

params ["", "", "_item"];

if(GVAR(active) && {_item in TRACKER_ITEMS} && {GVAR(mainControlsVisible)}) then {
    GVAR(selectedMarker) = nil;

    private ["_mapDisplay"];
    _mapDisplay = DISPLAY(IDD_MAINMAP);
    [_mapDisplay displayCtrl IDC_GRP_RFTREPORT, "hide"] call FUNC(toggleMainControl);
    (_mapDisplay displayCtrl IDC_GRP_MARKERTOOLTIP) ctrlShow false;
};
