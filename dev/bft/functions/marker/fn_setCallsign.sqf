#include "script_component.hpp"
params ["_callsign"];

MARKER_SET_CALLSIGN(GVAR(selectedMarker), _callsign);
