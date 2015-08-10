#include "script_component.hpp"

disableSerialization;
params ["_mapControl", "_mouseButton", "_mouseX", "_mouseY", "_shiftState", "_ctrlState", "_altState"];

if(_mouseButton != 0 || {GVAR(ctrlPressed)}) exitWith {};

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
    // set the selected marker if in range
    GVAR(selectedMarker) = GVAR(hoveredMarker);

    // set the selected direction button in main control
    private ["_dir", "_angle", "_dirString"];
    _dir = MARKER_GET_DIR(GVAR(selectedMarker));
    _angle = ICON_ANGLE(_dir);
    _pos = ICON_POS(_dir);
    _dirString = [_angle, _pos] call MFUNC(dirToString);
    [_dirString] call FUNC(dir_setSelected);

    // determine ellipse ctrl text
    [GVAR(selectedMarker)] call FUNC(ellipse_setText);

    [_mapControl, "show"] call FUNC(toggleMainControl);
}
else {
    // hide the main control
    GVAR(selectedMarker) = nil;
    [_mapControl, "hide"] call FUNC(toggleMainControl);
};
