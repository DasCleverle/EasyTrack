#include "script_component.hpp"

params ["_mapControl", "_mouseButton", "_mouseX", "_mouseY", "_shiftState", "_ctrlState", "_altState"];

// Check for nil is needed here so that placement of new NavIcon does not select it
// Also moving or rotating a unselected NavIcon should not selected it
if(isNil QGVAR(newNavIcon) && {isNil QGVAR(movingNavIcon)} && {isNil QGVAR(rotatingNavIcon)}) then {
    GVAR(selectedNavIcon) = GVAR(hoveredNavIcon);
};

GVAR(newNavIcon) = nil;


if(GVAR(lineStarted) && {!GVAR(lineDrawStarted)}) then {
    GVAR(lineEndPos) = GVAR(mouseWorldPos);

    [GVAR(lineStartPos), GVAR(lineEndPos), GVAR(lineThickness)] call FUNC(createLine);

    GVAR(lineStartPos) = nil;
    GVAR(lineEndPos) = nil;
    GVAR(lineThickness) = nil;
    GVAR(lineStarted) = false;
};

if(GVAR(lineDrawStarted)) then {
    GVAR(lineStartPos) = GVAR(mouseWorldPos);
    GVAR(lineStarted) = true;
    GVAR(lineDrawStarted) = false;
};

GVAR(selectedLine) = GVAR(hoveredLine);