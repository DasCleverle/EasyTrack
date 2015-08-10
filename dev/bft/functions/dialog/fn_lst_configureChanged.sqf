#include "script_component.hpp"
disableSerialization;

private ["_unit", "_drawMarker"];

params ["_control", "_index"];

{
    if((_control lbText _index) == name _x) exitWith {
        _unit = _x;
    };
} count GVAR(configureUnits);
if(isNil "_unit") exitWith {};

_drawMarker = !(_unit getVariable [QGVAR(drawMarker), false]);
_unit setVariable [QGVAR(drawMarker), _drawMarker, true];

if(_drawMarker) then {
    _control lbSetPicture [_index, QMAINDATAPATH(symbols\inf.paa)];
}
else {
    _control lbSetPicture [_index, QDATAPATH(transparent.paa)];
};
