#include "script_component.hpp"

disableSerialization;

private ["_selectedMarker", "_mapDisplay"];
params ["_mapControl"];

_mapDisplay = ctrlParent _mapControl;
_selectedMarker = GVAR(selectedMarker);

if(HAS_TRACKER) then {
    [_mapControl, _selectedMarker] call FUNC(drawEmphasis);

    [_mapControl, _selectedMarker] call FUNC(drawMarker);
};
