#include "script_component.hpp"

disableSerialization;

PARAMS_1(_control);
private ["_unit"];

{
    if(ctrlText _control == name _x) exitWith {
        _unit = _x;
    };
} foreach allPlayers;
if(isNil "_unit") exitWith  {};

_drawMarker = _unit getVariable [QGVAR(drawMarker), false];
_unit setVariable [QGVAR(drawMarker), !_drawMarker, true];

if(!_drawMarker) then {
    _control ctrlSetBackgroundColor [COLOR_GREEN_TR];
    _control ctrlSetActiveColor [COLOR_GREEN_TR];
}
else {
    _control ctrlSetBackgroundColor [COLOR_RED_TR];
    _control ctrlSetActiveColor [COLOR_RED_TR];
};