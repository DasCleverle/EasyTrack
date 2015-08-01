#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

disableSerialization;
PARAMS_5(_mapDisplay,_keyCode,_shiftState,_ctrlState,_altState);

// Control button
if(_keyCode == DIK_LCONTROL || {_keyCode == DIK_RCONTROL}) then {
    GVAR(ctrlPressed) = true;
};

// Delete hovered marker when del button is pressed
if(_keyCode == DIK_DELETE && {!isNil QGVAR(hoveredMarker)}) then {
    [_mapDisplay displayCtrl IDC_MAINMAP, GVAR(hoveredMarker), true] call FUNC(deleteMarker);
};

// Clipboard actions
if(_ctrlState && {_keyCode == DIK_C} && {!isNil QGVAR(hoveredMarker)}) then {
    GVAR(clipboard) = +GVAR(hoveredMarker);
};

if(_ctrlState && {_keyCode == DIK_V} && {!GVAR(pasted)} && {!isNil QGVAR(clipboard)}) then {
    GVAR(pasted) = true;
    [_mapDisplay displayCtrl IDC_MAINMAP, GVAR(clipboard)] call FUNC(createMarker);
};

// sync if esc or hide map key was pressed
{
    if((_keyCode == _x || {_keyCode == DIK_ESCAPE}) && {!isNil QGVAR(selectedMarker)}) exitWith {
        [GVAR(selectedMarker), "update"] call FUNC(invokeSyncMarker);
    };
} foreach actionKeys "hideMap";