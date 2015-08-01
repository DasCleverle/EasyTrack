#include "script_component.hpp"

private ["_dirString"];
PARAMS_2(_dir,_pos);

_dirString = switch(_dir) do {
    case -1:  { "static" };
    case 0:   { "north" };
    case 45:  { "north east" };
    case 90:  { "east" };
    case 135: { "south east" };
    case 180: { "south" };
    case 225: { "south west" };
    case 270: { "west" };
    case 315: { "north west" };
    default   { "custom" };
};

if(!isNil "_pos") then {
    if(_pos isEqualTo [-1]) then {
        _dirString = "static";
    };
};

_dirString;