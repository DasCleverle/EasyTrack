#include "script_component.hpp"

private ["_fnc_getItemSides", "_playerSides", "_targetSides", "_result"];
params ["_target"];

_fnc_getItemSides = {
    PARAMS_1(_unit);
    _itemNames = (TRACKER_ITEMS arrayIntersect ((items _unit) + (assignedItems _unit)));
    _sides = [];
    {
        _sides pushBack ([_x] call FUNC(getSideFromItem));
        true
    } count _itemNames;

    _sides;
};

_playerSides = [player] call _fnc_getItemSides;
_targetSides = [_target] call _fnc_getItemSides;

_result = false;
scopeName "main";
{
    _playerSide = _x;
    {
        _result = _playerSide in ([_x] call BIS_fnc_friendlySides);
        if(_result) then { breakTo "main"; };
            true
    } count _targetSides;
    true
} count _playerSides;

_result;
