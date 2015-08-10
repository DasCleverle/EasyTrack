#include "script_component.hpp"
params ["_frequency"];

MARKER_SET_FREQUENCY(GVAR(selectedMarker), _frequency);
