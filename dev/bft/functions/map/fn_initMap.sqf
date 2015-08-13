#include "script_component.hpp"

if(GVAR(mapInitialized) || {!hasInterface}) exitWith {};

disableSerialization;
private ["_mapDisplay", "_mapControl", "_grpTooltip", "_grpMain"];

_mapDisplay = DISPLAY(IDD_MAINMAP);
_mapControl = _mapDisplay displayCtrl IDC_MAINMAP;

// Add eventhandlers to map and map display
_mapControl ctrlAddEventHandler ["Draw", FUNC(handleDraw)];
_mapControl ctrlAddEventHandler ["MouseButtonClick", FUNC(handleMouseButtonClick)];
_mapControl ctrlAddEventHandler ["MouseMoving", FUNC(handleMouseMoving)];
_mapControl ctrlAddEventHandler ["MouseHolding", FUNC(handleMouseMoving)];

_mapDisplay displayAddEventHandler ["KeyDown", FUNC(handleKeyDown)];

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
_btnConfigure ctrlAddEventHandler ["ButtonClick", FUNC(btn_configure)];
_btnConfigure ctrlShow HAS_TABLET;
_btnConfigure ctrlCommit 0;

_grpConfigure = _mapDisplay ctrlCreate [QGVAR(grpConfigureContainer), IDC_GRP_CONFIGURECONTAINER];
_grpConfigure ctrlShow false;

GVAR(mapInitialized) = true;