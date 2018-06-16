#include "script_component.hpp"

PARAMS_1(_color);
format ["%1%2,%3,%4,%5)", STRCOLOR_BASE_SYS, _color select 0, _color select 1, _color select 2, _color select 3];