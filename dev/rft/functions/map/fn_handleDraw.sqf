#include "script_component.hpp"

disableSerialization;

PARAMS_1(_mapControl);

private ["_selectedMarker"];
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
}
else {
    if(GVAR(mainControlsVisible)) then {
        GVAR(selectedMarker) = nil;
        [_mapControl, "hide"] call FUNC(toggleMainControl);
    };
};