#include "script_component.hpp"

PARAMS_1(_markerID);

private ["_serverMarkers", "_index"];
_serverMarkers = [missionNamespace, QGVAR(serverMarkers) + str side player, []] call BIS_fnc_getServerVariable;
_index = _serverMarkers find GET_MARKER(_markerID);
_serverMarkers deleteAt _index;
[missionNamespace, QGVAR(serverMarkers) + str side player, _serverMarkers] call BIS_fnc_setServerVariable;