#include "script_component.hpp"

PARAMS_1(_itemName);
DEFAULT_PARAM(1,_defaultSide,sideUnknown);

if(typeName _itemName == typeName objNull) then {
    _itemName = (TRACKER_ITEMS arrayIntersect ((items _itemName) + (assignedItems _itemName))) select 0;
};

switch(_itemName select [0,1]) do {
    case "b": { west };
    case "o": { east };
    case "i": { independent };
    default { _defaultSide };
};