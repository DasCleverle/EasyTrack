#include "script_component.hpp"

params ["_thickness"];

if(isNil QGVAR(selectedLine)) then {
    GVAR(lineDrawStarted) = true;
    GVAR(lineThickness) = _thickness;
}
else {
    private _rect = LINE_GET_RECT(GVAR(selectedLine));
    SET_RECT_WIDTH(_rect, _thickness);
};