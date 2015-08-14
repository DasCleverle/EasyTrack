#include "script_component.hpp"

if(!hasInterface) exitWith {};
waitUntil { !isNull findDisplay 46 };
waitUntil { !isNull player };

PARAMS_2(_logic,_units);

{
    if(local _x) then {
        private ["_marker"];
        _marker = _x getVariable [QGVAR(marker),NEW_MARKER];

        MARKER_SET_UNIT(_marker, _x);
        MARKER_SET_CALLSIGN(_marker, _logic getVariable "callsign");
        MARKER_SET_FREQUENCY(_marker, _logic getVariable "frequency");
        SET_ICON_PATH(MARKER_GET_ICON(_marker), _logic getVariable "symbol");
        SET_ICON_PATH(MARKER_GET_SIZE(_marker), _logic getVariable "size");

        _x setVariable [QGVAR(marker), _marker, true];
        _x setVariable [QGVAR(drawMarker), true, true];
    };
} foreach _units;