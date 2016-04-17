#include "script_component.hpp"

params ["_startPos", "_endPos", "_thickness"];
private ["_line", "_rect"];

_line = NEW_LINE;

LINE_SET_ID(_line, GVAR(lineId));
INC(GVAR(lineId));

_rect = LINE_GET_RECT(_line);

SET_RECT_WIDTH(_rect, _thickness);

[_line, _startPos, _endPos] call FUNC(setLinePos);

GVAR(lines) pushBack _line;