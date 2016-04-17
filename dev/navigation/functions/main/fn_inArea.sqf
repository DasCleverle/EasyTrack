#include "script_component.hpp"

params ["_pos", "_geometry", "_isRectangle"];

if(_isRectangle) then {
    _pos inArea [RECT_POS(_geometry), RECT_WIDTH(_geometry), RECT_HEIGHT(_geometry), RECT_ANGLE(_geometry), true];
}
else {
    _pos inArea [ELLIPSE_POS(_geometry), ELLIPSE_A(_geometry), ELLIPSE_B(_geometry), ELLIPSE_ANGLE(_geometry), false];
};