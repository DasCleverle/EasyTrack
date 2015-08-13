#include "script_component.hpp"

disableSerialization;
params ["_toolip"];

{
    _x params ["_xTooltip", "_controls"];
    _controls params ["_button", "_picture", "_background"];

    if(_xTooltip == _toolip) then {
        _picture ctrlSetTextColor [COLOR_YELLOW];
    }
    else {
        _picture ctrlSetTextColor [COLOR_GREY];
    };
    _picture ctrlCommit 0;
} count GVAR(dir_controls);
