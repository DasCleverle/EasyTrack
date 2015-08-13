#include "script_component.hpp"

private ["_return"];
params ["_colorString"];

_colorString = [_colorString, STRCOLOR_BASE_SYS, ""] call CBA_fnc_replace;
_colorString = [_colorString, ")", ""] call CBA_fnc_replace;

_return = [];
{
    _return pushBack parseNumber _x;
} count ([_colorString, ","] call CBA_fnc_split);
