#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

disableSerialization;
PARAMS_5(_mapDisplay,_keyCode,_shiftState,_ctrlState,_altState);

if(_keyCode == DIK_LALT || {_keyCode == DIK_RALT}) then {
    GVAR(altPressed) = false;
    call FUNC(resetAltState);
};

if(_ctrlState && _keyCode == DIK_V) then {
    GVAR(pasted) = false;
};

nil;