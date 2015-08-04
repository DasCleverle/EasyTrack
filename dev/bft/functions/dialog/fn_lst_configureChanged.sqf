#include "script_component.hpp"

disableSerialization;
PARAMS_2(_control,_index);

private ["_unit", "_drawMarker"];
{
    if((_control lbText _index) == name _x) exitWith {
        _unit = _x;
    };
} foreach allPlayers;
if(isNil "_unit") exitWith {};

_drawMarker = _unit getVariable [QGVAR(drawMarker), false];
_drawMarker = !_drawMarker;
_unit setVariable [QGVAR(drawMarker), _drawMarker, true];

if(_drawMarker) then {
    _control lbSetPicture [_index, QMAINDATAPATH(symbols\inf.paa)];
}
else {
    _control lbSetPicture [_index, QDATAPATH(transparent.paa)];
};