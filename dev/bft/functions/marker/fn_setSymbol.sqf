#include "script_component.hpp"

PARAMS_1(_symbolPath);
SET_ICON_PATH(MARKER_GET_ICON(GVAR(selectedMarker)), _symbolPath);

GVAR(txtFocused) = nil;