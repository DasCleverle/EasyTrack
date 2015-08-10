#include "script_component.hpp"
params ["_side"];

call {
    if (west == _side) exitWith { [COLOR_BLUFOR] };
    if (east == _side) exitWith { [COLOR_OPFOR] };
    if (independent == _side) exitWith { [COLOR_INDEP] };
    [COLOR_GREY]
}
switch(_side) do {

};
