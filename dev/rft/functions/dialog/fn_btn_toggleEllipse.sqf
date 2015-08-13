#include "script_component.hpp"

disableSerialization;
private ["_selectedMarker", "_ellipse", "_ellipsePos", "_icon", "_iconPos"];
params ["_control"];

_selectedMarker = GVAR(selectedMarker);
_ellipse = MARKER_GET_ELLIPSE(_selectedMarker);
_icon = MARKER_GET_ICON(_selectedMarker);
_ellipsePos = ELLIPSE_POS(_ellipse);
_iconPos = ICON_POS(_icon);

if(_ellipsePos isEqualTo [-1]) then {
    SET_ELLIPSE_POS(_ellipse, _iconPos);
    _control ctrlSetText "Hide Ellipse";
    _control ctrlCommit 0;
}
else {
    SET_ELLIPSE_POS(_ellipse, [-1]);
    _control ctrlSetText "Show Ellipse";
    _control ctrlCommit 0;
};

MARKER_SET_CHANGED(_selectedMarker, true);
