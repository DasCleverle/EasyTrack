#include "script_component.hpp"

/*if(hasInterface) then {
    waitUntil { !isNull player };
    waitUntil { !isNull (finddisplay 46) };

    // remember friendly side for marker sync
    private ["_friends"];
    _friends = [];
    {
        if([side player, _x] call BIS_fnc_areFriendly) then {
            _friends pushBack _x;
        };
    } foreach [west, east, independent];
    player setVariable [QGVAR(friends), _friends];
};*/