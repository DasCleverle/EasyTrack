#include "script_component.hpp"

disableSerialization;
PARAMS_1(_control);

private ["_mapDisplay", "_grpConfigure"];
_mapDisplay = ctrlParent _control;
_grpConfigure = _mapDisplay displayCtrl IDC_GRP_CONFIGURECONTAINER;

_grpConfigure ctrlShow false;

GVAR(configureVisible) = false;