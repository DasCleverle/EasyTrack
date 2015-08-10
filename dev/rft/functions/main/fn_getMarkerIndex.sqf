#include "script_component.hpp"

PARAMS_1(_marker);

private ["_markerIds"];
_markerIds = [];
{
    _markerIds pushBack MARKER_GET_ID(_x);
    true
} count GVAR(markers);

_markerIds find MARKER_GET_ID(_marker);
