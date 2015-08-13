#include "script_component.hpp"

// sync if things on the map have changed
if(!isNil QGVAR(movingMarker)) then {
    private ["_index"];
    _index = GVAR(markers) find GVAR(movingMarker);
    if (isNil "_index") exitWith {};
    [GVAR(markers) select _index, "update"] call FUNC(invokeSyncMarker);
};

GVAR(mouseButtonPressed) = false;
GVAR(selectedCatch) = nil;
GVAR(currentDirectionArrow) = nil;
GVAR(movingMarker) = nil;
