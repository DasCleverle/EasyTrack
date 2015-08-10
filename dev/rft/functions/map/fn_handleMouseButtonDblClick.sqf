#include "script_component.hpp"

disableSerialization;
private ["_mapDisplay", "_grpMain", "_pos", "_icon", "_size", "_marker"];

params ["_mapControl", "_mouseButton", "_mouseX", "_mouseY", "_shiftState", "_ctrlState"];


if(!_ctrlState || {_mouseButton != 0} || {!HAS_TRACKER}) exitWith {};

// wait until the vanialla create marker display opens
// and close it right away
waitUntil { !isNull(findDisplay 54); };
(findDisplay 54) closeDisplay 2;

// Show the main control if it it was invisble
[_mapControl, "show"] call FUNC(toggleMainControl);

// create a new marker
_marker = [_mapControl, "new"] call FUNC(createMarker);
[_marker] call FUNC(ellipse_setText);
