#include "script_component.hpp"

disableSerialization;

PARAMS_7(_mapControl,_mouseButton,_mouseX,_mouseY,_shiftState,_ctrlState,_altState);

if(_mouseButton != 0 || {GVAR(altPressed)}) exitWith {};

private ["_mapDisplay", "_grpMain", "_mousePos", "_mapMousePos"];

_mapDisplay = ctrlParent _mapControl;
_mousePos = [_mouseX, _mouseY];
_mapMousePos = _mapControl ctrlMapScreenToWorld _mousePos;

// Reset favorites
[_mapControl, -1] call FUNC(btn_editFavorite);

// Sync selected marker
if(!isNil QGVAR(selectedMarker)) then {
    [GVAR(selectedMarker), "update"] call FUNC(invokeSyncMarker);
};

if(!isNil QGVAR(hoveredMarker)) then {
    [_mapControl, "show"] call FUNC(toggleMainControl);
}
else {
    // hide the main control
    [_mapControl, "hide"] call FUNC(toggleMainControl);
};

false;