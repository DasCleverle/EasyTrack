#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

#define NUM_KEYS [DIK_NUMPAD0,DIK_NUMPAD1,DIK_NUMPAD2,DIK_NUMPAD3,DIK_NUMPAD4,DIK_NUMPAD5,DIK_NUMPAD6,DIK_NUMPAD7,DIK_NUMPAD8,DIK_NUMPAD9,DIK_NUMLOCK,DIK_DIVIDE,DIK_MULTIPLY,DIK_SUBTRACT,DIK_ADD,DIK_NUMPADENTER,DIK_DECIMAL]

disableSerialization;

PARAMS_5(_mapDisplay,_keyCode,_shiftState,_ctrlState,_altState);
private ["_exit", "_isHideKey"];

_isHideKey = _keyCode in (actionKeys "hideMap");

if(_isHideKey || {_keyCode == DIK_ESCAPE}) then {
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

    private ["_grpConfigure"];
    _grpConfigure = _mapDisplay displayCtrl IDC_GRP_CONFIGURECONTAINER;
    _grpConfigure ctrlShow false;
    GVAR(configureVisible) = false;
};

if((_isHideKey || _keyCode in NUM_KEYS) && {!isNil QGVAR(txtFocused)}) then {
    true;
}
else {
    nil;
};