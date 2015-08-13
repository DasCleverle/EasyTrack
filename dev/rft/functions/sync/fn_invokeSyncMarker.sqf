#include "script_component.hpp"

PARAMS_2(_marker,_action);
private ["_packet", "_cancel"];

// exit if no property has changed
if((_action != "delete" && !MARKER_GET_CHANGED(_marker)) || MARKER_GET_ID(_marker) == -1) exitWith {};

// reset marker age
private ["_iconColor"];
_iconColor = ICON_COLOR(MARKER_GET_ICON(_marker));
SET_COLOR_A(_iconColor, 1);
MARKER_SET_TIME(_marker,TIME_VALUE);

GVAR(packet) = +_this;
publicVariable QGVAR(packet);

_this call FUNC(syncMarker);