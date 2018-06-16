#include "script_component.hpp"

ADDON = false;

#include "initSettings.sqf"
if (GVAR(enable)) then { [] spawn FUNC(init); };

ADDON = true;