#include "script_component.hpp"

params ["_mapControl", "_hoveringCount"];

_hoveringCount = 0;
{
    _x params ["_icon"];
    private ["_iconScreenPos", "_distance"];
    _iconScreenPos = _mapControl ctrlMapWorldToScreen ICON_POS(_icon);

    // Define the hovered NavIcon
    _distance = GVAR(mousePos) distance _iconScreenPos;
    if(_distance < 0.04) then {
        GVAR(hoveredNavIcon) = _x;
        INC(_hoveringCount);
    };

    _mapControl drawIcon _icon;
} foreach GVAR(navIcons);

if(_hoveringCount == 0) then {
    GVAR(hoveredNavIcon) = nil;
};

hintSilent str [GVAR(hoveredNavIcon),GVAR(rotatingNavIcon),GVAR(movingNavIcon)];

// Make the icon rotatable
if(!isNil QGVAR(hoveredNavIcon) && {isNil QGVAR(rotatingNavIcon)} && {GVAR(mouseButtonPressed)} && {GVAR(ctrlPressed)}) then {
    GVAR(rotatingNavIcon) = GVAR(hoveredNavIcon);
};

// Make the icon movable
if(!isNil QGVAR(hoveredNavIcon) && {isNil QGVAR(movingNavIcon)} && {GVAR(mouseButtonPressed)} && {GVAR(altPressed)}) then {
    GVAR(movingNavIcon) = GVAR(hoveredNavIcon);
};

// Rotate the hovered NavIcon if Control key is pressed
if(!isNil QGVAR(rotatingNavIcon)) then {
    private ["_icon", "_pos", "_dir"];
    _icon = NAVICON_GET_ICON(GVAR(rotatingNavIcon));
    _pos = _mapControl ctrlMapWorldToScreen ICON_POS(_icon);
    _dir = [_pos, GVAR(mousePos)] call BIS_fnc_dirTo;

    SET_ICON_ANGLE(_icon, -_dir);
};

// Move the hovered NavIcon along the mouse if Shift key is pressed
if(!isNil QGVAR(movingNavIcon)) then {
    private ["_icon", "_mousePos"];
    _icon = NAVICON_GET_ICON(GVAR(movingNavIcon));
    _mousePos = _mapControl ctrlMapScreenToWorld GVAR(mousePos);

    SET_ICON_POS(_icon, _mousePos);
};

if(!isNil QGVAR(newNavIcon) && {isNil QGVAR(movingNavIcon)}) then {
    private ["_icon", "_mousePos"];
    _icon = NAVICON_GET_ICON(GVAR(newNavIcon));
    _mousePos = _mapControl ctrlMapScreenToWorld GVAR(mousePos);

    SET_ICON_POS(_icon, _mousePos);
};