#include "script_component.hpp"

disableSerialization;

private ["_configs"];
_configs = configProperties [configFile >> "Extended_Put_Eventhandlers" >> "Man", 'isClass _x && { (configName _x find "putTracker") != -1 } && { (configName _x find QUOTE(PREFIX)) != -1 }'];

{
    _item = _x;
    player unassignItem _item;
    player removeItem _item;

    {
        [player, objNull, _item] call compile getText(_x >> "put");
    } foreach _configs;
} foreach TRACKER_ITEMS;