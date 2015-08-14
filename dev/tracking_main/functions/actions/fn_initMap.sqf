#include "script_component.hpp"

disableSerialization;
private ["_mapDisplay", "_mapControl", "_btnActions"];

_mapDisplay = DISPLAY(IDD_MAINMAP);

_mapControl = _mapDisplay displayCtrl IDC_MAINMAP;
_mapControl ctrlAddEventHandler ["MouseButtonClick", { ((ctrlParent (_this select 0)) displayCtrl IDC_GRP_ACTIONS) ctrlShow false; }];

_btnActions = _mapDisplay ctrlCreate [QGVAR(Button), IDC_BTN_ACTIONS];
_btnActions ctrlSetPosition [
    safeZoneX + safeZoneW - 20.5 * GUIMIN_2(1.2, 40) + GUIMIN_2(1.2, 40) - 7 * GUIMIN_2(1.2, 40),
    safeZoneY + 0.2 * GUIMIN_3_2(1.2, 25),
    7 * GUIMIN_2(1.2, 40),
    1.1 * GUIMIN_3_2(1.2, 25)
];
_btnActions ctrlSetText localize "STR_MAIN_MAINNAME";
_btnActions ctrlAddEventHandler ["ButtonClick", FUNC(btn_toggleActions)];
_btnActions ctrlShow HAS_TRACKER;
_btnActions ctrlCommit 0;

_grpActions = _mapDisplay ctrlCreate [QGVAR(grpActions), IDC_GRP_ACTIONS];
_grpActions ctrlShow false;

GVAR(mapInitialized) = true;