#include "script_component.hpp"

PARAMS_1(_sizePath);

SET_ICON_PATH(MARKER_GET_SIZE(GVAR(selectedMarker)), _sizePath);
MARKER_SET_CHANGED(GVAR(selectedMarker), true);

if(GVAR(editingFav) != -1) then {
    private ["_selectedFav"];
    _selectedFav = GVAR(favorites) select GVAR(editingFav);

    SET_FAV_SIZE(_selectedFav, _sizePath);
    [GVAR(editingFav)] call FUNC(fav_updateControls);
};