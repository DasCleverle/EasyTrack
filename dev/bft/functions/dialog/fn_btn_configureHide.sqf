#include "script_component.hpp"

disableSerialization;

private ["_mapDisplay", "_grpConfigure"];

params ["_control"];

_mapDisplay = ctrlParent _control;
_grpConfigure = _mapDisplay displayCtrl IDC_GRP_CONFIGURECONTAINER;

_grpConfigure ctrlShow false;

GVAR(configureVisible) = false;
