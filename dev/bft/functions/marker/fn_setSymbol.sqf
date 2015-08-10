#include "script_component.hpp"

params ["_symbolPath"];
SET_ICON_PATH(MARKER_GET_ICON(GVAR(selectedMarker)), _symbolPath);
