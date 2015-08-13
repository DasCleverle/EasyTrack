#include "script_component.hpp"
private "_itemSide";
params ["_itemName", ["_defaultSide", sideUnknown, [sideUnknown]]];

if(typeName _itemName == "OBJECT") then {
    _itemName = (TRACKER_ITEMS arrayIntersect ((items _itemName) + (assignedItems _itemName))) select 0;
};
_itemSide = _itemName select [0,1];
call {
    if (_itemSide == "b") exitWith { west };
    if (_itemSide == "o") exitWith { east };
    if (_itemSide == "i") exitWith { independent };
    _defaultSide
};
