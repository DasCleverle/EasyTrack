#include "script_component.hpp"

PARAMS_4(_index,_packet,_side,_action);

private ["_marker", "_isFriend"];

_isFriend = side player in ([_side] call BIS_fnc_friendlySides);
if (!_isFriend && !isServer) exitWith {};

if(_action != "create") then {
    _marker = GET_MARKER(_index);
};

switch (toLower _action) do {
    case "create": {
        _marker = NEW_MARKER(ICON_DEFAULT, ICON_SIZE_DEFAULT);
        GVAR(markers) pushBack _marker;

        SET_MARKER(GVAR(currentMarkerID), _marker);
        INC(GVAR(currentMarkerID));
    };

    case "delete": {
        [DISPLAY(IDD_MAINMAP) displayCtrl IDC_MAINMAP, _marker, false] call FUNC(deleteMarker);
    };
};

if(_action != "delete") then {
    {
        EXPLODE_2_PVT(_x,_markerProperty,_value);

        _marker set [_markerProperty, _value];
    } foreach _packet;
    MARKER_SET_ICON_CHANGED(_marker, false);
    MARKER_SET_SIZE_CHANGED(_marker, false);
    MARKER_SET_DIR_CHANGED(_marker, false);
    MARKER_SET_ELLIPSE_CHANGED(_marker, false);
};