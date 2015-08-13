#include "script_component.hpp"

disableSerialization;

PARAMS_2(_control,_type);

private ["_mapDisplay", "_grpMain"];
_mapDisplay = DISPLAY(IDD_MAINMAP);
if(ctrlIDC _control == IDC_GRP_BFT) then {
    _grpMain = _control;
}
else {
    _grpMain = _mapDisplay displayCtrl IDC_GRP_BFT;
};

switch (toLower _type) do {
    case "show": {
        GVAR(selectedMarker) = GVAR(hoveredMarker);

        [_mapDisplay, GVAR(mainControls), [
            ["txtCallsign", { (_this select 0) ctrlSetText MARKER_GET_CALLSIGN(GVAR(selectedMarker)); }],
            ["txtFrequency", { (_this select 0) ctrlSetText MARKER_GET_FREQUENCY(GVAR(selectedMarker)) }],
            ["txtPlayerName", { (_this select 0) ctrlSetText name MARKER_GET_UNIT(GVAR(selectedMarker)); }]
        ]] call MFUNC(ctrlAction);

        _grpMain ctrlShow true;
        GVAR(mainControlsVisible) = true;

        if(EGVAR(rft,active) && {EGVAR(rft,mainControlsVisible)}) then {
            [_grpMain, "hide"] call EFUNC(rft,toggleMainControl);
        };
    };
    case "hide": {
        _grpMain ctrlShow false;
        GVAR(mainControlsVisible) = false;
        GVAR(txtFocused) = nil;

        if(!isNil QGVAR(selectedMarker)) then {
            [_mapDisplay, GVAR(mainControls), [
                ["txtCallsign", { (ctrlText (_this select 0)) call FUNC(setCallsign); }],
                ["txtFrequency", { (ctrlText (_this select 0)) call FUNC(setFrequency); }]
            ]] call MFUNC(ctrlAction);
        };

        if(!isNil QGVAR(selectedMarker)) then {
            private ["_unit"];
            _unit = MARKER_GET_UNIT(GVAR(selectedMarker));
            _unit setVariable [QGVAR(marker), GVAR(selectedMarker), true];
        };

        GVAR(selectedMarker) = nil;
    };
};