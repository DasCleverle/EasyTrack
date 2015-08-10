#include "script_component.hpp"

disableSerialization;
params ["_control", "_index"];

GVAR(editingFav) = _index;

{
    _x params ["_picEmphasis"];

    if(_foreachIndex != _index) then {
        _picEmphasis ctrlSetText "";
    }
    else {
        _picEmphasis ctrlSetText QMAINDATAPATH(emphasis.paa);
    };

    _picEmphasis ctrlCommit 0;
} foreach GVAR(favControls);
