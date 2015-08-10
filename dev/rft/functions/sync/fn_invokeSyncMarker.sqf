#include "script_component.hpp"

params ["_marker", "_action"];

// exit if no property has changed
if((_action != "delete" && !MARKER_GET_CHANGED(_marker)) || MARKER_GET_ID(_marker) == -1) exitWith {};

// reset marker color
private ["_iconColor"];
_iconColor = ICON_COLOR(MARKER_GET_ICON(_marker));
SET_COLOR_A(_iconColor, 1);

GVAR(packet) = +_this;
publicVariable QGVAR(packet);

_this call FUNC(syncMarker);
