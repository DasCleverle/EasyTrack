#include "script_component.hpp"

private "_return";
params ["_color"];

_return = ["%1%2,%3,%4,%5)", STRCOLOR_BASE_SYS];
_return append _color;

format [ _color select 0, _color select 1, _color select 2, _color select 3];
