#include "script_component.hpp"

PARAMS_3(_mapControl,_marker,_sync);

if(isNil "_marker") exitWith {};

if(!isNil QGVAR(selectedMarker)) then {
    if(MARKER_GET_ID(_marker) == MARKER_GET_ID(GVAR(hoveredMarker))) then {
        GVAR(selectedMarker) = nil;
    };
};

if(_sync) then {
    [_marker, "delete"] call FUNC(invokeSyncMarker);
};

_index = GVAR(markers) find GET_MARKER(MARKER_GET_ID(_marker));
[MARKER_GET_ID(_marker)] call FUNC(removeServerMarker);
GVAR(markers) deleteAt _index;


[_mapControl, "hide"] call FUNC(toggleMainControl);