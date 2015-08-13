#include "script_component.hpp"

disableSerialization;

PARAMS_7(_mapControl,_mouseButton,_mouseX,_mouseY,_shiftState,_ctrlState,_altState);

if(_mouseButton != 0 || !HAS_TABLET) exitWith {};

if(!isNil QGVAR(hoveredMarker)) then {
    [_mapControl, "show"] call FUNC(toggleMainControl);
}
else {
    [_mapControl, "hide"] call FUNC(toggleMainControl);
};