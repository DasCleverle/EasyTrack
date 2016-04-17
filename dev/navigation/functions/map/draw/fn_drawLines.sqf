#include "script_component.hpp"

params ["_mapControl"];

if(!isNil QGVAR(selectedLine)) then {
    private ["_rect", "_emphasisRect"];
    _rect = LINE_GET_RECT(GVAR(selectedLine));

    _emphasisRect = +_rect;
    SET_RECT_WIDTH(_emphasisRect, RECT_WIDTH(_emphasisRect) + 5);
    SET_RECT_HEIGHT(_emphasisRect, RECT_HEIGHT(_emphasisRect) + 5);
    SET_RECT_COLOR(_emphasisRect, [COLOR_YELLOW]);
    SET_RECT_FILL(_emphasisRect, STRCOLOR(COLOR_YELLOW));

    _mapControl drawRectangle _emphasisRect;
};


private _hoveringCount = 0;
{
    _x params ["_id", "_rect"];

    if(GVAR(mouseWorldPos) inArea [RECT_POS(_rect), RECT_WIDTH(_rect), RECT_HEIGHT(_rect), RECT_ANGLE(_rect), true]) then {
        GVAR(hoveredLine) = _x;
        INC(_hoveringCount);
    };

    _mapControl drawRectangle _rect;
} foreach GVAR(lines);

if(_hoveringCount == 0) then {
    GVAR(hoveredLine) = nil;
};

// Draw a simple line to help the user imagine the dimensions
if(GVAR(lineStarted)) then {
    _mapControl drawLine [GVAR(lineStartPos), GVAR(mouseWorldPos), [COLOR_BLACK]];
};

