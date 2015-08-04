#include "script_component.hpp"

PARAMS_3(_unit,_container,_item);

if(GVAR(active) && {_item in TABLET_ITEMS}) then {
    private ["_mapDisplay", "_btnConfigure", "_grpConfigure"];
    _mapDisplay = DISPLAY(IDD_MAINMAP);
    _btnConfigure = _mapDisplay displayCtrl IDC_BTN_CONFIGURE;
    _btnConfigure ctrlShow true;
};