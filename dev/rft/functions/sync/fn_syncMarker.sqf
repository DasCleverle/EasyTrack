#include "script_component.hpp"

PARAMS_2(_marker,_action);

MARKER_SET_CHANGED(_marker, false);

switch (toLower _action) do {
    case "create": {
        GVAR(markers) pushBack _marker;
        SET_MARKER(GVAR(currentMarkerID), _marker);
        INC(GVAR(currentMarkerID));
    };
    case "update": {
        private ["_index"];
        _index = [_marker] call FUNC(getMarkerIndex);
        GVAR(markers) set [_index, _marker];

        if(!isNil QGVAR(selectedMarker) && {MARKER_GET_ID(GVAR(selectedMarker)) == MARKER_GET_ID(_marker)}) then {
            GVAR(selectedMarker) = _marker;
        };
    };
    case "delete": {
        [DISPLAY(IDD_MAINMAP) displayCtrl IDC_MAINMAP, _marker, false] call FUNC(deleteMarker);
    };
};