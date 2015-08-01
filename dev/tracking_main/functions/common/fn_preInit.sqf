#include "script_component.hpp"

/*private ["_functionClasses"];
_functionClasses = "true" configClasses (configFile >> "cfgFunctions" >> QUOTE(ADDON));

{
    _functions = "true" configClasses (_x);
    _file = getText (_x >> "file");
    {
        missionNamespace setVariable [QUOTE(DOUBLES(ADDON,fnc)) + "_" + configName _x, compile preProcessFileLineNumbers (_file + "\fn_" + configName _x + ".sqf")];
    } forEach _functions;
} foreach _functionClasses;*/

GVAR(components) = [
    "tracking_main",
    "bft",
    "rft"
];

GVAR(controlTypes) = [
    [QGVAR(Label), FUNC(initLabel)],
    [QGVAR(LabelHeading), FUNC(initLabel)],
    [QGVAR(Container), FUNC(initContainer)],
    [QGVAR(Button), FUNC(initButton)],
    [QGVAR(TextBox), FUNC(initTextBox)]
];

{
    missionNamespace setVariable [QUOTE(PREFIX) + "_" + _x + "_active", false];
} foreach GVAR(components);

GVAR(active) = true;