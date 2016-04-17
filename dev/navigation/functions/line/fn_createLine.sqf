#include "script_component.hpp"

params ["_startPos", "_endPos", "_thickness"];

if(count _startPos == 2) then {
    _startPos pushBack 0;
};

if(count _endPos == 2) then {
    _endPos pushBack 0;
};

private ["_vector", "_centerPos", "_length", "_direction", "_line", "_rect"];

_vector = _endPos vectorDiff _startPos vectorMultiply 0.5;
_centerPos = _startPos vectorAdd _vector;
_length = vectorMagnitude _vector;
_direction = [_startPos, _endPos] call BIS_fnc_dirTo;

_line = NEW_LINE;

LINE_SET_ID(_line, GVAR(lineId));
INC(GVAR(lineId));

_rect = LINE_GET_RECT(_line);

SET_RECT_POS(_rect, _centerPos);
SET_RECT_WIDTH(_rect, _thickness);
SET_RECT_HEIGHT(_rect, _length);
SET_RECT_ANGLE(_rect, _direction);

GVAR(lines) pushBack _line;