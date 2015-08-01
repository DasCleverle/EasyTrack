#include "script_component.hpp"

PARAMS_2(_mapControl,_selectedMarker);

private ["_hoveringCount", "_mapDisplay"];
_mapDisplay = ctrlParent _mapControl;
_hoveringCount = 0;
{
    EXPLODE_4_PVT(_x,_icon,_size,_direction,_ellipse);
    private ["_iconColor", "_iconPos", "_iconSize", "_iconSizeFactor", "_iconScreenPos", "_distance", "_timeFade"];

    _iconColor = ICON_COLOR(_icon);
    _iconPos = ICON_POS(_icon);
    _iconSize = ICON_SIZE_X(_icon);
    _iconScreenPos = _mapControl ctrlMapWorldToScreen _iconPos;
    _iconSizeFactor = 1;

    // manipulate the icon color
    _timeFade = 0.3 * (((time - (MARKER_GET_TIME(_x))) / 1800) min 1);
    SET_COLOR_A(_iconColor, 1 - 2 * _timeFade);

    // Determine Icon and size size
    _distance = _iconScreenPos distance GVAR(mousePos);
    if(_distance / ICON_SIZE < ICON_MIN_DISTANCE) then {
        _iconSizeFactor = 1.2;
        GVAR(hoveredMarker) = _x;
        INC(_hoveringCount);
    };

    SET_ICON_SIZE_X(_icon, ICON_SIZE * _iconSizeFactor);
    SET_ICON_SIZE_Y(_icon, ICON_SIZE * _iconSizeFactor);

    SET_ICON_COLOR(_size, _iconColor);
    SET_ICON_SIZE_X(_size, ICON_SIZE_SIZE * _iconSizeFactor);
    SET_ICON_SIZE_Y(_size, ICON_SIZE_SIZE * _iconSizeFactor);

    // Draw direction arrow
    private ["_directionPos"];
    _directionPos = ICON_POS(_direction);
    if!(_directionPos isEqualTo [-1]) then {
        SET_ICON_COLOR(_direction, _iconColor);
        SET_ICON_SIZE_X(_direction, ICON_SIZE_DIR * _iconSizeFactor);
        SET_ICON_SIZE_Y(_direction, ICON_SIZE_DIR * _iconSizeFactor);

        _mapControl drawIcon _direction;
    };

    // Draw ellipse
    private ["_ellipsePos", "_ellipseColor"];
    _ellipsePos = ELLIPSE_POS(_ellipse);
    if!(_ellipsePos isEqualTo [-1]) then {
        _ellipseColor = +_iconColor;
        SET_COLOR_A(_ellipseColor, 0.5);
        SET_ELLIPSE_COLOR(_ellipse, _ellipseColor);
        SET_ELLIPSE_FILL(_ellipse, [_ellipseColor] call MFUNC(colorArrayToString));

        _mapControl drawEllipse _ellipse;
    };

    SET_ICON_COLOR(_icon, _iconColor);
    _mapControl drawIcon _icon;
    _mapControl drawIcon _size;
} foreach GVAR(markers);

if(_hoveringCount == 0) then {
    GVAR(hoveredMarker) = nil;
};

// show tooltip
private ["_grpToolitp"];
_grpToolitp = _mapDisplay displayCtrl IDC_GRP_MARKERTOOLTIP;
if(!isNil QGVAR(hoveredMarker)) then {
    private ["_marker", "_markerPos", "_markerScreenPos", "_pos", "_age"];

    _marker = GVAR(hoveredMarker);
    _markerPos = ICON_POS(MARKER_GET_ICON(_marker));
    _markerScreenPos = _mapControl ctrlMapWorldToScreen _markerPos;
    _pos = ctrlPosition _grpToolitp;

    _pos set [0, X(_markerScreenPos) + GUIMIN_3_2(1.2, 20)];
    _pos set [1, Y(_markerScreenPos) - GUIMIN_3_2(1.2, 17)];

    _age = round ((time - MARKER_GET_TIME(_marker)) / 60);

    (_mapDisplay displayCtrl IDC_LBL_ID) ctrlSetText        str MARKER_GET_ID(_marker);
    (_mapDisplay displayCtrl IDC_LBL_AGE) ctrlSetText       format ["%1 min.", _age];
    (_mapDisplay displayCtrl IDC_LBL_CREATOR) ctrlSetText   MARKER_GET_PLAYER(_marker);

    _grpToolitp ctrlShow true;
    _grpToolitp ctrlSetPosition _pos;
    _grpToolitp ctrlCommit 0;
}
else {
    _grpToolitp ctrlShow false;
};

// Make the marker moveable
if(!isNil QGVAR(hoveredMarker) && {GVAR(ctrlPressed)} && {GVAR(mouseButtonPressed)} && {isNil QGVAR(selectedCatch)} && {isNil QGVAR(currentDirectionArrow)}) then {
    GVAR(movingMarker) = GVAR(hoveredMarker);
};

if(!isNil QGVAR(movingMarker)) then {
    private ["_mousePos"];
    EXPLODE_4_PVT(GVAR(movingMarker),_icon,_size,_dir,_ellipse);

    _mousePos = _mapControl ctrlMapScreenToWorld GVAR(mousePos);
    SET_ICON_POS(_icon, _mousePos);
    SET_ICON_POS(_size, _mousePos);

    MARKER_SET_ICON_CHANGED(GVAR(movingMarker), true);
    MARKER_SET_SIZE_CHANGED(GVAR(movingMarker), true);

    if !(ICON_POS(_dir) isEqualTo [-1]) then {
        SET_ICON_POS(_dir, _mousePos);
        MARKER_SET_DIR_CHANGED(GVAR(movingMarker), true);
    };

    if !(ELLIPSE_POS(_ellipse) isEqualTo [-1]) then {
        SET_ELLIPSE_POS(_ellipse, _mousePos);
        MARKER_SET_ELLIPSE_CHANGED(GVAR(movingMarker), true);
    };
};