#include "script_component.hpp"

private ["_btnToggleEllipse", "_ellipsePos"];
params ["_marker"];

{
    private ["_control"];
    _x params ["", "", "_name", "_idc"];
    _control = DISPLAY(IDD_MAINMAP) displayCtrl _idc;

    if(_name == "btnToggleEllipse") exitWith {
        _btnToggleEllipse = _control;
    };
    true
} count GVAR(mainControls);

_ellipsePos = ELLIPSE_POS(MARKER_GET_ELLIPSE(_marker));

if(_ellipsePos isEqualTo [-1]) then {
    _btnToggleEllipse ctrlSetText "Show Ellipse";
}
else {
    _btnToggleEllipse ctrlSetText "Hide Ellipse";
};
