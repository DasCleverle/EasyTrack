#include "script_component.hpp"

PARAMS_1(_side);

switch(_side) do {
    case west: { [COLOR_BLUFOR]; };
    case east: { [COLOR_OPFOR]; };
    case independent: { [COLOR_INDEP]; };
    default { [COLOR_GREY]; };
};