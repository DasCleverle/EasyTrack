#include "script_component.hpp"

PARAMS_2(_mapControl,_selectedMarker);

if(isNil "_selectedMarker") exitWith {};

private ["_selectedIcon", "_selectedIconPos", "_emphasisIcon", "_factor"];
_selectedIcon = MARKER_GET_ICON(_selectedMarker);
_selectedIconPos = ICON_POS(_selectedIcon);

_factor = 1.2;
if(!isNil QGVAR(hoveredMarker)) then {
    if(MARKER_GET_UNIT(GVAR(hoveredMarker)) isEqualTo MARKER_GET_UNIT(_selectedMarker)) then {
        _factor = 1.2 * 1.2;
    };
};

_emphasisIcon = ICON_DEFAULT;
SET_ICON_PATH(_emphasisIcon, QMAINDATAPATH(emphasis.paa));
SET_ICON_POS(_emphasisIcon, _selectedIconPos);
SET_ICON_COLOR(_emphasisIcon, [COLOR_YELLOW]);
SET_ICON_SIZE_X(_emphasisIcon, ICON_SIZE * _factor);
SET_ICON_SIZE_Y(_emphasisIcon, ICON_SIZE * _factor);

_mapControl drawIcon _emphasisIcon;