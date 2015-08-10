#include "script_component.hpp"

params ["_mapControl", "_marker", "_sync"];

if(isNil "_marker") exitWith {};

if(!isNil QGVAR(selectedMarker)) then {
    if(MARKER_GET_ID(_marker) == MARKER_GET_ID(GVAR(selectedMarker))) then {
        GVAR(selectedMarker) = nil;
        [_mapControl, "hide"] call FUNC(toggleMainControl);
    };
};

if(_sync) then {
    [_marker, "delete"] call FUNC(invokeSyncMarker);
};

_index = [_marker] call FUNC(getMarkerIndex);
GVAR(markers) deleteAt _index;
