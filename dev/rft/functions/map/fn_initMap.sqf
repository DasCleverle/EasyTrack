#include "script_component.hpp"

if(GVAR(mapInitialized) || {!hasInterface}) exitWith {};

disableSerialization;
private ["_mapDisplay", "_mapControl", "_grpTooltip", "_grpMain"];

_mapDisplay = DISPLAY(IDD_MAINMAP);
_mapControl = _mapDisplay displayCtrl IDC_MAINMAP;

// Add eventhandlers to map and map display
_mapControl ctrlAddEventHandler ["Draw", { _this call FUNC(handleDraw); }];
_mapControl ctrlAddEventHandler ["MouseButtonDblClick", { _this spawn FUNC(handleMouseButtonDblClick); }];
_mapControl ctrlAddEventHandler ["MouseButtonClick", { _this spawn FUNC(handleMouseButtonClick); }];
_mapControl ctrlAddEventHandler ["MouseButtonDown", { _this spawn FUNC(handleMouseButtonDown); }];
_mapControl ctrlAddEventHandler ["MouseButtonUp", { _this spawn FUNC(handleMouseButtonUp); }];
_mapControl ctrlAddEventHandler ["MouseMoving", { _this call FUNC(handleMouseMoving); }];
_mapControl ctrlAddEventHandler ["MouseHolding", { _this call FUNC(handleMouseMoving); }];

_mapDisplay displayAddEventHandler ["KeyDown", { _this spawn FUNC(handleKeyDown); nil }];
_mapDisplay displayAddEventHandler ["KeyUp", { _this spawn FUNC(handleKeyUp); nil }];

// Create the tooltip group
_grpTooltip = _mapDisplay ctrlCreate [QGVAR(grpMarkerTooltip), IDC_GRP_MARKERTOOLTIP];
_grpTooltip ctrlShow false;

// Create the main ControlsGroup
_grpMain = _mapDisplay ctrlCreate [QGVAR(grpReport), IDC_GRP_RFTREPORT];
[_mapDisplay, _grpMain, GVAR(mainControls), IDC_FIRST] call MFUNC(initMainControl);

[_grpMain, "hide"] call FUNC(toggleMainControl);

GVAR(mapInitialized) = true;