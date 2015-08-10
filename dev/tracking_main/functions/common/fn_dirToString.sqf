#include "script_component.hpp"

private ["_dirString"];
params ["_dir","_pos"];

_dirString = call {
    if (_dir == -1) exitWith { "static" };
    if (_dir == 0) exitWith { "north" };
    if (_dir == 45) exitWith { "north east" };
    if (_dir == 90) exitWith { "east" };
    if (_dir == 135) exitWith { "south east" };
    if (_dir == 180) exitWith { "south" };
    if (_dir == 225) exitWith { "south west" };
    if (_dir == 270) exitWith { "west" };
    if (_dir == 315) exitWith { "north west" };
    "custom"
};

if(!isNil "_pos") then {
    if(_pos isEqualTo [-1]) then {
        _dirString = "static";
    };
};

_dirString;
