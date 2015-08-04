#include "script_component.hpp"

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