#include "script_component.hpp"

disableSerialization;

PARAMS_2(_params,_scope);
EXPLODE_1_PVT(_params,_control);
private ["_mapDisplay","_code"];

_mapDisplay = ctrlParent _control;

switch(toLower _scope) do {
    case "all": {
        _code = { _this setVariable [QGVAR(drawMarker),
            true,
            true];
        };
    };
    case "none": {
        _code = { _this setVariable [QGVAR(drawMarker),
            false,
            true];
        };
    };
    case "toggle": {
        _code = { _this setVariable [QGVAR(drawMarker),
            !(_this getVariable [QGVAR(drawMarker), false]),
            true];
        };
    };
};

{
   _x call _code;
} foreach GVAR(configureUnits);

[_mapDisplay displayCtrl IDC_BTN_CONFIGURE] call FUNC(btn_configure);