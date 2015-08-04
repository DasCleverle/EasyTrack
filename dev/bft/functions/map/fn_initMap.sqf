#include "script_component.hpp"

if(GVAR(mapInitialized) || {!hasInterface}) exitWith {};

disableSerialization;
private ["_mapDisplay", "_mapControl", "_grpTooltip", "_grpMain"];

_mapDisplay = DISPLAY(IDD_MAINMAP);
_mapControl = _mapDisplay displayCtrl IDC_MAINMAP;

// Add eventhandlers to map and map display
_mapControl ctrlAddEventHandler ["Draw", { _this call FUNC(handleDraw); }];
_mapControl ctrlAddEventHandler ["MouseButtonClick", { _this spawn FUNC(handleMouseButtonClick); }];
_mapControl ctrlAddEventHandler ["MouseMoving", { _this call FUNC(handleMouseMoving); }];
_mapControl ctrlAddEventHandler ["MouseHolding", { _this call FUNC(handleMouseMoving); }];

_mapDisplay displayAddEventHandler ["KeyDown", { _this spawn FUNC(handleKeyDown); nil }];

// Create the tooltip group
_grpTooltip = _mapDisplay ctrlCreate [QGVAR(grpMarkerTooltip), IDC_GRP_MARKERTOOLTIP];
_grpTooltip ctrlShow false;

// Create the main ControlsGroup
_grpMain = _mapDisplay ctrlCreate [QGVAR(grpBft), IDC_GRP_BFT];
[_mapDisplay, _grpMain, GVAR(mainControls), IDC_FIRST] call MFUNC(initMainControl);

[_grpMain, "hide"] call FUNC(toggleMainControl);

// Create Configuration button
_btnConfigure = _mapDisplay ctrlCreate [QEGVAR(tracking_main,Button), IDC_BTN_CONFIGURE];
_btnConfigure ctrlSetPosition [
    safeZoneX + safeZoneW - 20.5 * GUIMIN_2(1.2, 40) + GUIMIN_2(1.2, 40) - 7 * GUIMIN_2(1.2, 40),
    safeZoneY + 0.2 * GUIMIN_3_2(1.2, 25),
    7 * GUIMIN_2(1.2, 40),
    1.1 * GUIMIN_3_2(1.2, 25)
];
_btnConfigure ctrlSetText "Configure BFT";
_btnConfigure ctrlAddEventHandler ["ButtonClick", { _this spawn FUNC(btn_configure); }];
_btnConfigure ctrlCommit 0;

_grpConfigure = _mapDisplay ctrlCreate [QGVAR(grpConfigureContainer), IDC_GRP_CONFIGURECONTAINER];
_grpConfigure ctrlShow false;

/*x = safeZoneX + safeZoneW - GUIMIN_3_2(1.2, 2);
    y = safeZoneY + 1.5 * GUIMIN_3_2(1.2, 25);*/

GVAR(mapInitialized) = true;