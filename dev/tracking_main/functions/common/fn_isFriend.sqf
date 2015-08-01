#include "script_component.hpp"

PARAMS_1(_target);

private ["_getItemSide"];

_getItemSide = {
    PARAMS_1(_unit);
    _itemName = (TRACKER_ITEMS arrayIntersect ((items _unit) + (assignedItems _unit))) select 0;
    if(isNil "_itemName") exitWith {
        sideUnknown;
    };
    [_itemName] call FUNC(getSideFromItem);
};

_playerSide = [player] call _getItemSide;
_targetSide = [_target] call _getItemSide;

_playerSide in ([_targetSide] call BIS_fnc_friendlySides);