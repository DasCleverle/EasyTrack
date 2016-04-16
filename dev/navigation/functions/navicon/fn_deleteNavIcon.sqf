#include "script_component.hpp"

params ["_id"];

if(NAVICON_GET_ID(GVAR(selectedNavIcon)) == _id) then {
    GVAR(selectedNavIcon) = nil;
};

private _index = [_id] call FUNC(getNavIconIndex);
GVAR(navIcons) deleteAt _index;