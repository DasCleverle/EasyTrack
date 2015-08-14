#include "script_component.hpp"

PARAMS_1(_marker);
private ["_btnToggleEllipse", "_ellipsePos"];

{
    EXPLODE_4_PVT(_x,_type,_params,_name,_idc);
    private ["_control"];
    _control = DISPLAY(IDD_MAINMAP) displayCtrl _idc;

    if(_name == "btnToggleEllipse") exitWith {
        _btnToggleEllipse = _control;
    };
} foreach GVAR(mainControls);

_ellipsePos = ELLIPSE_POS(MARKER_GET_ELLIPSE(_marker));

if(_ellipsePos isEqualTo [-1]) then {
    _btnToggleEllipse ctrlSetText localize "STR_RFT_BTN_SHOWELLIPSE";
}
else {
    _btnToggleEllipse ctrlSetText localize "STR_RFT_BTN_HIDEELLIPSE";
};