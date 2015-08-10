#include "script_component.hpp"

if(GVAR(mapInitialized) || {!hasInterface}) exitWith {};

disableSerialization;
private ["_mapDisplay", "_mapControl", "_grpTooltip", "_grpMain"];

_mapDisplay = DISPLAY(IDD_MAINMAP);
_mapControl = _mapDisplay displayCtrl IDC_MAINMAP;

// Add eventhandlers to map and map display
_mapControl ctrlAddEventHandler ["Draw", FUNC(handleDraw)];
_mapControl ctrlAddEventHandler ["MouseButtonDblClick", FUNC(handleMouseButtonDblClick)];
_mapControl ctrlAddEventHandler ["MouseButtonClick", FUNC(handleMouseButtonClick)];
_mapControl ctrlAddEventHandler ["MouseButtonDown", FUNC(handleMouseButtonDown)];
_mapControl ctrlAddEventHandler ["MouseButtonUp", FUNC(handleMouseButtonUp)];
_mapControl ctrlAddEventHandler ["MouseMoving", FUNC(handleMouseMoving)];
_mapControl ctrlAddEventHandler ["MouseHolding", FUNC(handleMouseMoving)];

_mapDisplay displayAddEventHandler ["KeyDown", FUNC(handleKeyDown)];
_mapDisplay displayAddEventHandler ["KeyUp", FUNC(handleKeyUp)];

// Create the tooltip group
_grpTooltip = _mapDisplay ctrlCreate [QGVAR(grpMarkerTooltip), IDC_GRP_MARKERTOOLTIP];
_grpTooltip ctrlShow false;

// Create the main ControlsGroup
_grpMain = _mapDisplay ctrlCreate [QGVAR(grpReport), IDC_GRP_RFTREPORT];
[_mapDisplay, _grpMain, GVAR(mainControls), IDC_FIRST] call MFUNC(initMainControl);

[_grpMain, "hide"] call FUNC(toggleMainControl);

GVAR(mapInitialized) = true;
