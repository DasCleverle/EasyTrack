#include "script_component.hpp"

private ["_dirString"];
PARAMS_2(_dir,_pos);

_dirString = switch(_dir) do {
    case -1:  { localize "STR_RFT_STATIC" };
    case 0:   { localize "STR_RFT_NORTH" };
    case 45:  { localize "STR_RFT_NORTHEAST" };
    case 90:  { localize "STR_RFT_EAST" };
    case 135: { localize "STR_RFT_SOUTHEAST" };
    case 180: { localize "STR_RFT_SOUTH" };
    case 225: { localize "STR_RFT_SOUTHWEST" };
    case 270: { localize "STR_RFT_WEST" };
    case 315: { localize "STR_RFT_NORTHWEST" };
    default   { localize "STR_RFT_CUSTOM" };
};

if(!isNil "_pos") then {
    if(_pos isEqualTo [-1]) then {
        _dirString = localize "STR_RFT_STATIC";
    };
};

_dirString;