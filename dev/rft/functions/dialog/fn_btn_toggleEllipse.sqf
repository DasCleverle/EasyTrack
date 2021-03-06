#include "script_component.hpp"

disableSerialization;
PARAMS_1(_control);

private ["_selectedMarker", "_ellipse", "_ellipsePos", "_icon", "_iconPos"];

_selectedMarker = GVAR(selectedMarker);
_ellipse = MARKER_GET_ELLIPSE(_selectedMarker);
_icon = MARKER_GET_ICON(_selectedMarker);
_ellipsePos = ELLIPSE_POS(_ellipse);
_iconPos = ICON_POS(_icon);

if(_ellipsePos isEqualTo [-1]) then {
    SET_ELLIPSE_POS(_ellipse, _iconPos);
    _control ctrlSetText localize "STR_RFT_BTN_HIDEELLIPSE";
    _control ctrlCommit 0;
}
else {
    SET_ELLIPSE_POS(_ellipse, [-1]);
    _control ctrlSetText localize "STR_RFT_BTN_SHOWELLIPSE";
    _control ctrlCommit 0;
};

MARKER_SET_CHANGED(_selectedMarker, true);