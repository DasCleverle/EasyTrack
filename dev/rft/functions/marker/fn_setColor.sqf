#include "script_component.hpp"

SET_ICON_COLOR(MARKER_GET_ICON(GVAR(selectedMarker)), _this);
MARKER_SET_CHANGED(GVAR(selectedMarker), true);

if(GVAR(editingFav) != -1) then {
    private ["_selectedFav"];
    _selectedFav = GVAR(favorites) select GVAR(editingFav);

    SET_FAV_COLOR(_selectedFav, _this);
    [GVAR(editingFav)] call FUNC(fav_updateControls);
};