#include "script_component.hpp"

params ["_id"];

{
    if(LINE_GET_ID(_x) == _id) exitWith {
        _foreachIndex;
    };
} foreach GVAR(lines);