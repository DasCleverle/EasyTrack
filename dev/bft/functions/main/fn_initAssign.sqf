#include "script_component.hpp"

if (!hasInterface) exitWith {};

[
    {
        missionNamespace getVariable [QGVAR(initClient), false]
    },
    {
        params ["_callsign", "_frequency", "_symbol", "_size", "_units"];

        {
            if (local _x) then {
                private ["_marker"];
                _marker = _x getVariable [QGVAR(marker),NEW_MARKER];

                MARKER_SET_UNIT(_marker, _x);
                MARKER_SET_CALLSIGN(_marker, _callsign);
                MARKER_SET_FREQUENCY(_marker, _frequency);
                SET_ICON_PATH(MARKER_GET_ICON(_marker), _symbol);
                SET_ICON_PATH(MARKER_GET_SIZE(_marker), _size);

                _x setVariable [QGVAR(marker), _marker, true];
                _x setVariable [QGVAR(drawMarker), true, true];
            };
        } foreach _units;
    },
    _this
] call CBA_fnc_waitUntilAndExecute;
