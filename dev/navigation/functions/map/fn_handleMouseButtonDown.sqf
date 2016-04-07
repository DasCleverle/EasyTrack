#include "script_component.hpp"

disableSerialization;
params ["_mapControl", "_mouseButton"];

if(_mouseButton != 0) exitWith {};

GVAR(mouseButtonPressed) = true;