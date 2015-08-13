#include "script_component.hpp"
params ["_sizePath"];

SET_ICON_PATH(MARKER_GET_SIZE(GVAR(selectedMarker)), _sizePath);
