#include "script_component.hpp"

disableSerialization;
PARAMS_7(_mapControl,_mouseButton,_mouseX,_mouseY,_shiftState,_ctrlState,_altState);

private ["_mapDisplay", "_grpMain", "_pos", "_icon", "_size", "_marker"];

if(!_altState || {_mouseButton != 0} || {!HAS_TRACKER}) exitWith {};

GVAR(dblClick) = true;

// Show the main control if it it was invisble
[_mapControl, "show"] call FUNC(toggleMainControl);

// create a new marker
_marker = [_mapControl, "new"] call FUNC(createMarker);
[_marker] call FUNC(ellipse_setText);