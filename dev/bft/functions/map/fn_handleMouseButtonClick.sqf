#include "script_component.hpp"

disableSerialization;

PARAMS_7(_mapControl,_mouseButton,_mouseX,_mouseY,_shiftState,_ctrlState,_altState);

if(_mouseButton != 0 || !HAS_TABLET) exitWith {};

if(!isNil QGVAR(hoveredMarker)) then {
    // set the selected marker if in range
    GVAR(selectedMarker) = GVAR(hoveredMarker);

    private ["_mapDisplay"];
    _mapDisplay = ctrlParent _mapControl;
    {
        EXPLODE_4_PVT(_x,_type,_params,_name,_idc);
        private ["_control"];
        _control = _mapDisplay displayCtrl _idc;

        switch (_name) do {
            case "txtCallsign": { _control ctrlSetText MARKER_GET_CALLSIGN(GVAR(selectedMarker)); };
            case "txtFrequency": { _control ctrlSetText MARKER_GET_FREQUENCY(GVAR(selectedMarker)); };
            case "lblPlayerName": { _control ctrlSetText "Unit: " + name MARKER_GET_UNIT(GVAR(selectedMarker)); };
        };
    } foreach GVAR(mainControls);

    [_mapControl, "show"] call FUNC(toggleMainControl);
}
else {
    // hide the main control
    if(!isNil QGVAR(selectedMarker)) then {
        private ["_unit"];
        _unit = MARKER_GET_UNIT(GVAR(selectedMarker));
        _unit setVariable [QGVAR(marker), GVAR(selectedMarker), true];
    };

    GVAR(selectedMarker) = nil;
    [_mapControl, "hide"] call FUNC(toggleMainControl);
};