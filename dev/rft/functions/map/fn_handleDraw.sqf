#include "script_component.hpp"

disableSerialization;

private ["_selectedMarker"];
params ["_mapControl"];

_selectedMarker = GVAR(selectedMarker);

if (HAS_TRACKER) then {
    // Emphasize the selected icon
    [_mapControl, _selectedMarker] call FUNC(drawEmphasis);

    // Draw marker
    [_mapControl, _selectedMarker] call FUNC(drawMarker);

    // Resize Ellipse
    [_mapControl, _selectedMarker] call FUNC(drawResizeEllipse);

    // Rotate Direction Arrow
    [_mapControl, _selectedMarker] call FUNC(drawRotateDirection);
};
