#include "script_component.hpp"

disableSerialization;
private ["_fav", "_favControls", "_selectedMarker"];
PARAMS_2(_control,_index);
_selectedMarker = GVAR(selectedMarker);

if(GVAR(ctrlPressed)) exitWith {
    _this call FUNC(btn_editFavorite);
};

if(isNil "_selectedMarker") exitWith {};


if(GVAR(editingFav) != -1) then {
    [_control, -1] call FUNC(btn_editFavorite);
};

_fav = GVAR(favorites) select _index;
_favControls = GVAR(favControls) select _index;

_icon = MARKER_GET_ICON(_selectedMarker);
_size = MARKER_GET_SIZE(_selectedMarker);

EXPLODE_3_PVT(_fav,_symbol,_sizePath,_color);
SET_ICON_PATH(_icon, _symbol);
SET_ICON_COLOR(_icon, _color);

SET_ICON_PATH(_size, _sizePath);

MARKER_SET_CHANGED(_selectedMarker, true);