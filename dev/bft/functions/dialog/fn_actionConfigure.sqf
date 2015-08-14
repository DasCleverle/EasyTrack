#include "script_component.hpp"

disableSerialization;
private ["_mapDisplay", "_grpConfigureContainer", "_lstConfigure", "_background", "_y", "_idc"];

_mapDisplay = DISPLAY(IDD_MAINMAP);
_grpConfigureContainer = _mapDisplay displayCtrl IDC_GRP_CONFIGURECONTAINER;
_grpConfigureContainer ctrlShow true;

_lstConfigure = _mapDisplay displayCtrl IDC_LST_CONFIGURE;

lbClear _lstConfigure;
{
    if([_x] call MFUNC(isFriend) && {UHAS_TRACKER(_x)} && {isPlayer _x}) then {
        private ["_index"];
        _index = _lstConfigure lbAdd name _x;

        if(_x getVariable [QGVAR(drawMarker), false]) then {
            _lstConfigure lbSetPicture [_index, QMAINDATAPATH(symbols\inf.paa)];
        }
        else {
            _lstConfigure lbSetPicture [_index, QDATAPATH(transparent.paa)];
        };
    };
} foreach GVAR(configureUnits);
lbSort [_lstConfigure, "ASC"];

GVAR(configureVisible) = true;