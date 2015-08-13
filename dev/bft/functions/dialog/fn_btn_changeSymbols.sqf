#include "script_component.hpp"

disableSerialization;
private ["_mapDisplay","_code"];
params ["_args", "_scope"];
_args params ["_control"];

_mapDisplay = ctrlParent _control;

_scope = toLower _scope;

_code = call {
    if (_scope == "all") exitWith {
        { _this setVariable [QGVAR(drawMarker),
            true,
            true];
        }
    };
    if (_scope == "none") exitWith {
        { _this setVariable [QGVAR(drawMarker),
            false,
            true];
        }
    };
    if (_scope == "toggle") exitWith {
        { _this setVariable [QGVAR(drawMarker),
            !(_this getVariable [QGVAR(drawMarker), false]),
            true];
        }
    };
};

{
   _x call _code;
} count GVAR(configureUnits);

[_mapDisplay displayCtrl IDC_BTN_CONFIGURE] call FUNC(btn_configure);
