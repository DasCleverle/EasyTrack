#include "script_component.hpp"

disableSerialization;

PARAMS_2(_control,_index);

GVAR(editingFav) = _index;

{
    private ["_picEmphasis"];
    _picEmphasis = _x select 2;

    if(_foreachIndex != _index) then {
        _picEmphasis ctrlSetText "";
    }
    else {
        _picEmphasis ctrlSetText QMAINDATAPATH(emphasis.paa);
    };

    _picEmphasis ctrlCommit 0;
} foreach GVAR(favControls);
