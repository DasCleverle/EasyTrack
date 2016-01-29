#include "script_component.hpp"

params ["_logic", "_units"];

[
    _logic getVariable "callsign",
    _logic getVariable "frequency",
    _logic getVariable "symbol",
    _logic getVariable "size",
    _units
] call FUNC(initAssign);