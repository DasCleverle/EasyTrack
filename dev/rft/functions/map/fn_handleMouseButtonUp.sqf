#include "script_component.hpp"

disableSerialization;
PARAMS_6(_mapControl,_mouseButton,_mouseX,_mouseY,_shiftState,_ctrlState);

if(_mouseButton != 0) exitWith {};

call FUNC(resetCtrlState);