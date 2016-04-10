#include "script_component.hpp"

params ["_id"];

private _index = [_id] call FUNC(getNavIconIndex);
GVAR(navIcons) deleteAt _index;