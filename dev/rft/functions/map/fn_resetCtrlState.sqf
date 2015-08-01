#include "script_component.hpp"

// sync if things on the map have changed
if(!isNil QGVAR(movingMarker)) then {
    [GVAR(movingMarker), "update"] call FUNC(invokeSyncMarker);
};

GVAR(mouseButtonPressed) = false;
GVAR(selectedCatch) = nil;
GVAR(currentDirectionArrow) = nil;
GVAR(movingMarker) = nil;