#include "script_component.hpp"

disableSerialization;
PARAMS_1(_toolip);

{
    EXPLODE_2_PVT(_x,_xTooltip,_controls);
    EXPLODE_3_PVT(_controls,_button,_picture,_background);

    if(_xTooltip == _toolip) then {
        _picture ctrlSetTextColor [COLOR_YELLOW];
    }
    else {
        _picture ctrlSetTextColor [COLOR_GREY];
    };
    _picture ctrlCommit 0;
} foreach GVAR(dir_controls);