#include "script_component.hpp"

disableSerialization;
PARAMS_2(_dirString,_direction);

[_dirString] call FUNC(dir_setSelected);

private ["_icon", "_directionIcon", "_iconColor", "_iconPos"];
_icon = MARKER_GET_ICON(GVAR(selectedMarker));
_directionIcon = MARKER_GET_DIR(GVAR(selectedMarker));

_iconColor = ICON_COLOR(_icon);
_iconPos =  ICON_POS(_icon);

if(_direction == -1) then {
    SET_ICON_POS(_directionIcon, [-1]);
}
else {
    SET_ICON_POS(_directionIcon, _iconPos);
    SET_ICON_ANGLE(_directionIcon, _direction);
};

MARKER_SET_DIR_CHANGED(GVAR(selectedMarker), true);