#include "script_component.hpp"

params ["_mapControl", "_line"];
_line params ["_id", "_rect", "_lineType", "_startPos", "_endPos"];

switch(_lineType) do {
    case "default": {
        _mapControl drawRectangle _rect;
    };
    case "arrow": {
        private ["_leftPos", "_rightPos", "_topPos"];

        _vector = [[0, RECT_WIDTH(_rect) * 3, 0], -RECT_ANGLE(_rect)] call BIS_fnc_rotateVector2D;

        _leftPos = _endPos vectorAdd ([_vector, 90] call BIS_fnc_rotateVector2D);
        _rightPos = _endPos vectorAdd ([_vector, -90] call BIS_fnc_rotateVector2D);
        _topPos = _endPos vectorAdd _vector;

        _mapControl drawRectangle _rect;
        _mapControl drawPolygon [[_leftPos, _rightPos, _topPos], RECT_COLOR(_rect)];
    };
    case "dotted";
    case "dashed": {
        private ["_vector", "_length", "_j"];
        _vector = _endPos vectorDiff _startPos;
        _length = vectorMagnitude _vector;
        _j = 1;

        for "_i" from 0 to 1 step ((LINE_DISTANCE_FACTOR * RECT_WIDTH(_rect)) / _length) do {
            if(_j mod 2 == 0) then {
                private ["_pos", "_direction", "_geometry"];
                _pos = _startPos vectorAdd (_vector vectorMultiply _i);
                _geometry = [
                    _pos,
                    RECT_WIDTH(_rect),
                    (LINE_DISTANCE_FACTOR / 2) * RECT_WIDTH(_rect),
                    RECT_ANGLE(_rect),
                    RECT_COLOR(_rect),
                    RECT_FILL(_rect)
                ];

                switch(_lineType) do {
                    case "dotted": {
                        SET_RECT_HEIGHT(_geometry, RECT_WIDTH(_geometry));
                        _mapControl drawEllipse _geometry;
                    };
                    case "dashed": { _mapControl drawRectangle _geometry };
                };
            };

            INC(_j);
        };
    };
};