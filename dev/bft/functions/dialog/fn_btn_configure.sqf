#include "script_component.hpp"

disableSerialization;

if(GVAR(configureVisible)) exitWith {};

PARAMS_1(_control);
private ["_mapDisplay", "_grpConfigureContainer", "_grpConfigure", "_background", "_y", "_idc"];

_mapDisplay = ctrlParent _control;
_grpConfigureContainer = _mapDisplay displayCtrl IDC_GRP_CONFIGURECONTAINER;
_grpConfigureContainer ctrlShow true;

_grpConfigure = _mapDisplay displayCtrl IDC_GRP_CONFIGURE;
_background = _mapDisplay displayCtrl IDC_BG_CONFIGURE;
if(isNull _background) then {
    _background = _mapDisplay ctrlCreate [QEGVAR(tracking_main,Background), IDC_BG_CONFIGURE, _grpConfigure];
};

for "_i" from IDC_BTN_CONFIGURE_CONTROL_START to IDC_BTN_CONFIGURE_CONTROL_START + GVAR(createdCheckboxes) do {
    private ["_ctrli"];
    _ctrli = (_mapDisplay displayCtrl _i);
    _ctrli ctrlSetPosition [0, 0, 0, 0];
    _ctrli ctrlCommit 0;
    _ctrli ctrlShow false;
    _ctrli ctrlEnable false;
};

_y = BASE_Y;
_idc = IDC_BTN_CONFIGURE_CONTROL_START;
{
    if([_x] call MFUNC(isFriend) && {UHAS_TRACKER(_x)}) then {
        private ["_checkbox"];
        _checkbox = _mapDisplay displayCtrl _idc;
        if(isNull _checkbox) then {
            _checkbox = _mapDisplay ctrlCreate [QGVAR(ButtonCheck), _idc, _grpConfigure];
            INC(GVAR(createdCheckboxes));
        };
        _checkbox ctrlShow true;
        _checkbox ctrlEnable true;
        _checkbox ctrlSetText name _x;
        _checkbox ctrlSetPosition [BASE_X, _y, CONFIG_WIDTH - 3 * BASE_X, BASE_H];

        if(_x getVariable [QGVAR(drawMarker), false]) then {
            _checkbox ctrlSetBackgroundColor [COLOR_GREEN_TR];
            _checkbox ctrlSetActiveColor [COLOR_GREEN_TR];
        }
        else {
            _checkbox ctrlSetBackgroundColor [COLOR_RED_TR];
            _checkbox ctrlSetActiveColor [COLOR_RED_TR];
        };

        _checkbox ctrlRemoveAllEventHandlers "ButtonClick";
        _checkbox ctrlAddEventHandler ["ButtonClick", { _this spawn FUNC(btn_configureChecked); }];
        _checkbox ctrlCommit 0;

        ADD(_y,BASE_H + BASE_Y);
        INC(_idc);
    };
} foreach allPlayers;


private ["_pos", "_hidePos", "_btnHide"];

_pos = [0, 0, CONFIG_WIDTH];
if(_y > CONFIG_HEIGHT) then {
    _pos pushBack _y;
}
else {
    _pos pushBack CONFIG_HEIGHT;
};

_background ctrlSetBackgroundColor [COLOR_BLACK_TR50];
_background ctrlSetPosition _pos;
_background ctrlCommit 0;

GVAR(configureVisible) = true;