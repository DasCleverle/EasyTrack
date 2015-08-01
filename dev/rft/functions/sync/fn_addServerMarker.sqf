#include "script_component.hpp"

PARAMS_1(_marker);

private ["_serverMarkers"];
_serverMarkers = [missionNamespace, QGVAR(serverMarkers) + str side player, []] call BIS_fnc_getServerVariable;
_serverMarkers pushBack _marker;
[missionNamespace, QGVAR(serverMarkers) + str side player, _serverMarkers] call BIS_fnc_setServerVariable;