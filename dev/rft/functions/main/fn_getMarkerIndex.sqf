#include "script_component.hpp"

private ["_markerIds"];
params ["_marker"];

_markerIds = [];
{
    _markerIds pushBack MARKER_GET_ID(_x);
    true
} count GVAR(markers);

if (!isNil "_marker") exitWith {};
_markerIds find MARKER_GET_ID(_marker);
