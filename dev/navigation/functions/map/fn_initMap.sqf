#include "script_component.hpp"

//if(GVAR(mapInitialized) || {!hasInterface}) exitWith {};

disableSerialization;
private ["_mapDisplay", "_mapControl", "_grpMain"];

_mapDisplay = DISPLAY(IDD_MAINMAP);
_mapControl = _mapDisplay displayCtrl IDC_MAINMAP;

_grpMain = _mapDisplay ctrlCreate [QGVAR(grpNavigation), IDC_GRP_NAVIGATION];
[_mapDisplay, _grpMain, GVAR(mainControls), IDC_FIRST, "horizontal"] call MFUNC(initMainControl);

systemChat "init map";