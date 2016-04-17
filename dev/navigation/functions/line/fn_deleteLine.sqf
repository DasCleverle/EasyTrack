#include "script_component.hpp"

params ["_id"];

if(LINE_GET_ID(GVAR(selectedLine)) == _id) then {
    GVAR(selectedLine) = nil;
};

private _index = [_id] call FUNC(getLineIndex);
GVAR(lines) deleteAt _index;