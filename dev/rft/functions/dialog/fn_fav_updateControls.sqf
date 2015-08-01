#include "script_component.hpp"

disableSerialization;
PARAMS_1(_index);

if(_index == -1) exitWith {};

EXPLODE_2_PVT((GVAR(favControls) select _index),_picSymbol,_picSize);
EXPLODE_3_PVT((GVAR(favorites) select _index),_symbol,_size,_color);

_picSymbol ctrlSetTextColor _color;
_picSymbol ctrlSetText _symbol;
_picSize ctrlSetText _size;

_picSymbol ctrlCommit 0;
_picSize ctrlCommit 0;