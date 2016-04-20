#include "script_component.hpp"

params ["_mapControl"];

if(!isNil QGVAR(selectedLine)) then {
    private ["_rect", "_emphasisRect", "_startEllipse", "_endEllipse", "_startPos", "_endPos"];
    _rect = LINE_GET_RECT(GVAR(selectedLine));

    // Draw a emphasis to show the selected line
    _emphasisRect = +_rect;
    SET_RECT_WIDTH(_emphasisRect, RECT_WIDTH(_emphasisRect) + 5);
    SET_RECT_HEIGHT(_emphasisRect, RECT_HEIGHT(_emphasisRect) + 5);
    SET_RECT_COLOR(_emphasisRect, [COLOR_YELLOW]);
    SET_RECT_FILL(_emphasisRect, "");

    // Draw ellipses at start and of line to be able to move it
    _startEllipse = LINE_ELLIPSE;
    SET_ELLIPSE_POS(_startEllipse, LINE_GET_START(GVAR(selectedLine)));

    _endEllipse = LINE_ELLIPSE;
    SET_ELLIPSE_POS(_endEllipse, LINE_GET_END(GVAR(selectedLine)));

    _inStart = [GVAR(mouseWorldPos), _startEllipse, false] call FUNC(inArea);
    _inEnd = [GVAR(mouseWorldPos), _endEllipse, false] call FUNC(inArea);

    if(_inStart) then {
        GVAR(hoveredLineEllipse) = "start";
    };

    if(_inEnd) then {
        GVAR(hoveredLineEllipse) = "end";
    };

    if(!_inStart && {!_inEnd}) then {
        GVAR(hoveredLineEllipse) = nil;
    };

    if(!isNil QGVAR(hoveredLineEllipse) && {GVAR(mouseButtonPressed)} && {isNil QGVAR(movingLineEllipse)}) then {
        GVAR(movingLineEllipse) = GVAR(hoveredLineEllipse);
    };

    if(!isNil QGVAR(movingLineEllipse)) then {
        _startPos = LINE_GET_START(GVAR(selectedLine));
        _endPos = LINE_GET_END(GVAR(selectedLine));

        switch(GVAR(movingLineEllipse)) do {
            case "start": {
                [GVAR(selectedLine), GVAR(mouseWorldPos), _endPos] call FUNC(setLinePos);
            };
            case "end": {
                [GVAR(selectedLine), _startPos, GVAR(mouseWorldPos)] call FUNC(setLinePos);
            };
        };
    };

    _mapControl drawRectangle _emphasisRect;
    _mapControl drawEllipse _startEllipse;
    _mapControl drawEllipse _endEllipse;
};


private _hoveringCount = 0;
{
    _x params ["_id", "_rect"];

    _area = +_rect;
    SET_RECT_WIDTH(_area, RECT_WIDTH(_area) + 20);
    SET_RECT_HEIGHT(_area, RECT_HEIGHT(_area) + 20);
    if([GVAR(mouseWorldPos), _area, true] call FUNC(inArea)) then {
        GVAR(hoveredLine) = _x;
        INC(_hoveringCount);
    };

    [_mapControl, _x] call FUNC(drawLine);
} foreach GVAR(lines);

if(_hoveringCount == 0) then {
    GVAR(hoveredLine) = nil;
};

// Draw a simple line to help the user imagine the dimensions
if(GVAR(lineStarted)) then {
    _mapControl drawLine [GVAR(lineStartPos), GVAR(mouseWorldPos), [COLOR_BLACK]];
};

// Draw an ellipse to indicate that line drawing has been started
if(GVAR(lineDrawStarted)) then {
    private _ellipse = LINE_ELLIPSE;
    SET_ELLIPSE_POS(_ellipse, GVAR(mouseWorldPos));

    _mapControl drawEllipse _ellipse;
};