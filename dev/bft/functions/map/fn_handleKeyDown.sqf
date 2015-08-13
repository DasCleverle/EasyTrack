#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

disableSerialization;
PARAMS_5(_mapDisplay,_keyCode,_shiftState,_ctrlState,_altState);

{
    if((_keyCode == _x || {_keyCode == DIK_ESCAPE})) exitWith {
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
} foreach actionKeys "hideMap";

nil;