#include "script_component.hpp"

disableSerialization;

PARAMS_1(_mapControl);

private ["_selectedMarker", "_mapDisplay"];
_mapDisplay = ctrlParent _mapControl;
_selectedMarker = GVAR(selectedMarker);

if(HAS_TRACKER) then {
    [_mapControl, _selectedMarker] call FUNC(drawEmphasis);

    [_mapControl, _selectedMarker] call FUNC(drawMarker);
}
else {
    if(GVAR(mainControlsVisible)) then {
        [_mapControl, "hide"] call FUNC(toggleMainControl);
    };
};

private ["_btnConfigure", "_grpConfigure"];
_btnConfigure = _mapDisplay displayCtrl IDC_BTN_CONFIGURE;
_btnConfigure ctrlShow HAS_TABLET;

if(GVAR(configureVisible)) then {
    _grpConfigure = _mapDisplay displayCtrl IDC_GRP_CONFIGURECONTAINER;
    _grpConfigure ctrlShow HAS_TABLET;
    GVAR(configureVisible) = HAS_TABLET;
};