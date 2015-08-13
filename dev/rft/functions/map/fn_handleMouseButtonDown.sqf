#include "script_component.hpp"

disableSerialization;
params ["_mapControl", "_mouseButton", "_mouseX", "_mouseY", "_shiftState", "_ctrlState"];

if(_mouseButton != 0) exitWith {};

GVAR(mouseButtonPressed) = true;
