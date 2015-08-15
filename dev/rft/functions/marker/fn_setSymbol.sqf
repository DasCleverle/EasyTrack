#include "script_component.hpp"

PARAMS_1(_symbolPath);

if(GVAR(editingFav) != -1) then {
    private ["_selectedFav"];
    _selectedFav = GVAR(favorites) select GVAR(editingFav);

    SET_FAV_ICON(_selectedFav, _symbolPath);
    [GVAR(editingFav)] call FUNC(fav_updateControls);
}
else {
    SET_ICON_PATH(MARKER_GET_ICON(GVAR(selectedMarker)), _symbolPath);
    MARKER_SET_CHANGED(GVAR(selectedMarker), true);
};