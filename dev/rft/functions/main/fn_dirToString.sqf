#include "script_component.hpp"

private ["_dirString"];
PARAMS_2(_dir,_pos);

_dirString = switch (_dir) do {
    case -1:  { LLSTRING(STATIC) };
    case 0:   { LLSTRING(NORTH) };
    case 45:  { LLSTRING(NORTHEAST) };
    case 90:  { LLSTRING(EAST) };
    case 135: { LLSTRING(SOUTHEAST) };
    case 180: { LLSTRING(SOUTH) };
    case 225: { LLSTRING(SOUTHWEST) };
    case 270: { LLSTRING(WEST) };
    case 315: { LLSTRING(NORTHWEST) };
    default   { LLSTRING(CUSTOM) };
};

if (!isNil "_pos") then {
    if (_pos isEqualTo [-1]) then {
        _dirString = LLSTRING(STATIC);
    };
};

_dirString;