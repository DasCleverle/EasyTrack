#include "script_component.hpp"

disableSerialization;

PARAMS_1(_mapControl);

private ["_selectedMarker", "_mapDisplay"];
_mapDisplay = ctrlParent _mapControl;
_selectedMarker = GVAR(selectedMarker);

if(HAS_TRACKER) then {
    [_mapControl, _selectedMarker] call FUNC(drawEmphasis);

    [_mapControl, _selectedMarker] call FUNC(drawMarker);
};