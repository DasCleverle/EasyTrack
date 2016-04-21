#include "script_component.hpp"

if(!isNil QGVAR(movingNavIcon)) exitWith {};

params ["_iconPath"];

private ["_navIcon", "_icon"];

if(isNil QGVAR(selectedNavIcon)) then {
    _navIcon = NEW_NAVICON;

    NAVICON_SET_ID(_navIcon, GVAR(navIconId));
    INC(GVAR(navIconId));

    _icon = NAVICON_GET_ICON(_navIcon);

    SET_ICON_PATH(_icon, _iconPath);

    GVAR(navIcons) pushBack _navIcon;
    GVAR(newNavIcon) = _navIcon;
}
else {
    _icon = NAVICON_GET_ICON(GVAR(selectedNavIcon));

    SET_ICON_PATH(_icon, _iconPath);
};