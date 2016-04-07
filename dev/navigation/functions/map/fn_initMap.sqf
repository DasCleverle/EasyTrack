#include "script_component.hpp"

if(GVAR(mapInitialized) || {!hasInterface}) exitWith {};

disableSerialization;
private ["_mapDisplay", "_mapControl", "_grpMain"];

_mapDisplay = DISPLAY(IDD_MAINMAP);
_mapControl = _mapDisplay displayCtrl IDC_MAINMAP;

_mapControl ctrlAddEventHandler ["Draw", FUNC(handleDraw)];
_mapControl ctrlAddEventHandler ["MouseButtonClick", FUNC(handleMouseButtonClick)];
_mapControl ctrlAddEventHandler ["MouseButtonDown", FUNC(handleMouseButtonDown)];
_mapControl ctrlAddEventHandler ["MouseButtonUp", FUNC(handleMouseButtonUp)];
_mapControl ctrlAddEventHandler ["MouseMoving", FUNC(handleMouseMoving)];

_mapDisplay displayAddEventHandler ["KeyDown", FUNC(handleKeyDown)];
_mapDisplay displayAddEventHandler ["KeyUp", FUNC(handleKeyUp)];

_grpMain = _mapDisplay ctrlCreate [QGVAR(grpNavigation), IDC_GRP_NAVIGATION];
[_mapDisplay, _grpMain, GVAR(mainControls), IDC_FIRST, "horizontal"] call MFUNC(initMainControl);

GVAR(mapInitialized) = true;