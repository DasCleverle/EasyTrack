#include "script_component.hpp"

params ["_line", "_startPos", "_endPos"];

if(count _startPos == 2) then {
    _startPos pushBack 0;
};

if(count _endPos == 2) then {
    _endPos pushBack 0;
};

_vector = _endPos vectorDiff _startPos vectorMultiply 0.5;
_centerPos = _startPos vectorAdd _vector;
_length = vectorMagnitude _vector;
_direction = [_startPos, _endPos] call BIS_fnc_dirTo;

LINE_SET_START(_line, _startPos);
LINE_SET_END(_line, _endPos);

_rect = LINE_GET_RECT(_line);

SET_RECT_POS(_rect, _centerPos);
SET_RECT_HEIGHT(_rect, _length);
SET_RECT_ANGLE(_rect, _direction);