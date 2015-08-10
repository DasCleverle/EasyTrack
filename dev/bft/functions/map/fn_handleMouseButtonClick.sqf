#include "script_component.hpp"

disableSerialization;

params ["_mapControl", "_mouseButton", "_mouseX", "_mouseY", "_shiftState", "_ctrlState", "_altState"];

if(_mouseButton != 0 || !HAS_TABLET) exitWith {};

if(!isNil QGVAR(hoveredMarker)) then {
    // set the selected marker if in range
    GVAR(selectedMarker) = GVAR(hoveredMarker);

    private ["_mapDisplay"];
    _mapDisplay = ctrlParent _mapControl;
    {
        private ["_control", "_text"];
        _x params ["_type", "_params", "_name", "_idc"];
        _control = _mapDisplay displayCtrl _idc;
        _text = (call {
            if (_name == "txtCallsign") exitWith { MARKER_GET_CALLSIGN(GVAR(selectedMarker)) };
            if (_name == "txtFrequency") exitWith { MARKER_GET_FREQUENCY(GVAR(selectedMarker)) };
            if (_name == "txtPlayerName") exitWith { name MARKER_GET_UNIT(GVAR(selectedMarker)) };
        });
        if (!isNil "_text") then {
            _control ctrlSetText _text;
        };
    } count GVAR(mainControls);

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
