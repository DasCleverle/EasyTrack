#include "script_component.hpp"

disableSerialization;

params ["_mapControl"];

if (HAS_TRACKER) then {
    [_mapControl] call FUNC(drawNavIcons);
};