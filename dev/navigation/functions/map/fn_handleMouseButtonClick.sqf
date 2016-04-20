#include "script_component.hpp"

params ["_mapControl", "_mouseButton", "_mouseX", "_mouseY", "_shiftState", "_ctrlState", "_altState"];

// left click
if(_mouseButton == 0) then {
    // Check for nil is needed here so that placement of new NavIcon does not select it
    // Also moving or rotating a unselected NavIcon should not selected it
    if(isNil QGVAR(newNavIcon) && {isNil QGVAR(movingNavIcon)} && {isNil QGVAR(rotatingNavIcon)}) then {
        GVAR(selectedNavIcon) = GVAR(hoveredNavIcon);
    };

    GVAR(newNavIcon) = nil;

    // Line was started, end the line here
    if(GVAR(lineStarted) && {!GVAR(lineDrawStarted)}) then {
        GVAR(lineEndPos) = GVAR(mouseWorldPos);

        [GVAR(lineStartPos), GVAR(lineEndPos), GVAR(lineThickness)] call FUNC(createLine);

        GVAR(lineStartPos) = nil;
        GVAR(lineEndPos) = nil;
        GVAR(lineThickness) = nil;
        GVAR(lineStarted) = false;
    };

    // Button for line creation was pressed, start the line here
    if(GVAR(lineDrawStarted)) then {
        GVAR(lineStartPos) = GVAR(mouseWorldPos);
        GVAR(lineStarted) = true;
        GVAR(lineDrawStarted) = false;
    };

    // Select a line only if no line ellipse is hovered, to keep it selected when moving the line
    if(isNil QGVAR(hoveredLineEllipse)) then {
        GVAR(selectedLine) = GVAR(hoveredLine);
    };
}
// right click
else {
    // Delete the newest NavIcon
    [NAVICON_GET_ID(GVAR(newNavIcon))] call FUNC(deleteNavIcon);

    // Abort line creation
    if(GVAR(lineStarted)) then {
        GVAR(lineStartPos) = nil;
        GVAR(lineEndPos) = nil;
        GVAR(lineThickness) = nil;
        GVAR(lineStarted) = false;
    };

    if(GVAR(lineDrawStarted)) then {
        GVAR(lineDrawStarted) = false;
    };
};