#include "script_component.hpp"

disableSerialization;

private ["_mapDisplay", "_mapControl", "_selectedIcon", "_selectedIconPos"];
params ["_control"];

_mapDisplay = ctrlParent _control;
_mapControl = _mapDisplay displayCtrl IDC_MAINMAP;

_selectedIcon = MARKER_GET_ICON(GVAR(selectedMarker));
_selectedIconPos = ICON_POS(_selectedIcon);

_mapControl ctrlMapAnimAdd [0.5, ctrlMapScale _mapControl, _selectedIconPos];
ctrlMapAnimCommit _mapControl;
