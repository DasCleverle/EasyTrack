#include "script_component.hpp"

disableSerialization;
params ["_index"];

if(_index == -1) exitWith {};

(GVAR(favControls) select _index) params ["_picSymbol", "_picSize"];
(GVAR(favorites) select _index) params ["_symbol", "_size", "_color"];

_picSymbol ctrlSetTextColor _color;
_picSymbol ctrlSetText _symbol;
_picSize ctrlSetText _size;

_picSymbol ctrlCommit 0;
_picSize ctrlCommit 0;
