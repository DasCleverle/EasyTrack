#include "script_component.hpp"

private ["_hoveringCount", "_itemName"];

_hoveringCount = 0;
{
    if(_x getVariable QGVAR(drawMarker) && { [_x] call MFUNC(isFriend) }) then {
        private ["_marker", "_icon", "_size"];
        _marker = _x getVariable QGVAR(marker);

        _icon = MARKER_GET_ICON(_marker);
        _size = MARKER_GET_SIZE(_marker);

        SET_ICON_POS(_icon, getPos _x);
        SET_ICON_POS(_size, getPos _x);

        _iconScreenPos = _mapControl ctrlMapWorldToScreen ICON_POS(_icon);
        _iconSizeFactor = 1;

        _distance = _iconScreenPos distance GVAR(mousePos);
        if(_distance / ICON_SIZE < ICON_MIN_DISTANCE) then {
            _iconSizeFactor = 1.2;
            GVAR(hoveredMarker) = _marker;
            INC(_hoveringCount);
        };

        SET_ICON_SIZE_X(_icon, ICON_SIZE * _iconSizeFactor);
        SET_ICON_SIZE_Y(_icon, ICON_SIZE * _iconSizeFactor);

        _color = [[_x] call MFUNC(getSideFromItem)] call FUNC(getSideColor);
        SET_ICON_COLOR(_icon, _color);

        SET_ICON_SIZE_X(_size, ICON_SIZE_SIZE * _iconSizeFactor);
        SET_ICON_SIZE_Y(_size, ICON_SIZE_SIZE * _iconSizeFactor);

        _mapControl drawIcon _icon;
        _mapControl drawIcon _size;
    };
    true
} count allPlayers;

if(_hoveringCount == 0) then {
    GVAR(hoveredMarker) = nil;
};

private ["_grpToolitp", "_mapDisplay"];
_mapDisplay = ctrlParent _mapControl;
_grpToolitp = _mapDisplay displayCtrl IDC_GRP_MARKERTOOLTIP;
if(!isNil QGVAR(hoveredMarker)) then {
    private ["_marker", "_markerPos", "_markerScreenPos", "_pos", "_age"];

    _marker = GVAR(hoveredMarker);
    _markerPos = ICON_POS(MARKER_GET_ICON(_marker));
    _markerScreenPos = _mapControl ctrlMapWorldToScreen _markerPos;
    _pos = ctrlPosition _grpToolitp;

    _pos set [0, X(_markerScreenPos) + GUIMIN_3_2(1.2, 20)];
    _pos set [1, Y(_markerScreenPos) - GUIMIN_3_2(1.2, 17)];

    (_mapDisplay displayCtrl IDC_LBL_UNIT) ctrlSetText          name MARKER_GET_UNIT(_marker);
    (_mapDisplay displayCtrl IDC_LBL_CALLSIGN) ctrlSetText      MARKER_GET_CALLSIGN(_marker);
    (_mapDisplay displayCtrl IDC_LBL_FREQUENCY) ctrlSetText     MARKER_GET_FREQUENCY(_marker);

    _grpToolitp ctrlShow true;
    _grpToolitp ctrlSetPosition _pos;
    _grpToolitp ctrlCommit 0;
}
else {
    _grpToolitp ctrlShow false;
};
