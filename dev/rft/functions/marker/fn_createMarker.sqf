#include "script_component.hpp"

PARAMS_2(_mapControl,_source);
private ["_mousePos", "_icon", "_size", "_side", "_marker", "_dir", "_ellipse", "_index"];

_mousePos = _mapControl ctrlMapScreenToWorld GVAR(mousePos);
if(typeName _source == typeName "") then {
    _icon = ICON_DEFAULT;
    _size = ICON_SIZE_DEFAULT;
    _side = [player] call MFUNC(getSideFromItem);

    SET_ICON_POS(_icon, _mousePos);
    SET_ICON_POS(_size, _mousePos);

    _marker = NEW_MARKER(_icon, _size, _side);
    GVAR(selectedMarker) = _marker;

    [LLSTRING(STATIC)] call FUNC(dir_setSelected);
}
else {
    _marker = +_source;

    _icon = MARKER_GET_ICON(_marker);
    _size = MARKER_GET_SIZE(_marker);
    _dir = MARKER_GET_DIR(_marker);
    _ellipse = MARKER_GET_ELLIPSE(_marker);

    SET_ICON_POS(_icon, _mousePos);
    SET_ICON_POS(_size, _mousePos);

    if !(ICON_POS(_dir) isEqualTo [-1]) then {
        SET_ICON_POS(_dir, _mousePos);
    };

    if !(ELLIPSE_POS(_ellipse) isEqualTo [-1]) then {
        SET_ELLIPSE_POS(_ellipse, _mousePos);
    };

    MARKER_SET_CHANGED(_marker, true);
};

MARKER_SET_ID(_marker, GVAR(currentMarkerID));

[_marker, "create"] call FUNC(invokeSyncMarker);

_marker;