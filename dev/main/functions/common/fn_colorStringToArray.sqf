#include "script_component.hpp"

PARAMS_1(_colorString);
private ["_return"];

_colorString = [_colorString, STRCOLOR_BASE_SYS, ""] call CBA_fnc_replace;
_colorString = [_colorString, ")", ""] call CBA_fnc_replace;

_return = [];
{
    _return pushBack parseNumber _x;
} foreach ([_colorString, ","] call CBA_fnc_split);