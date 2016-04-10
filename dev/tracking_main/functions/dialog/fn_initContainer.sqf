#include "script_component.hpp"

params ["_control","_mainOrientationPos","_orientation","_params"];
_params params ["_id", "_source", "_perColumn", ["_width", BASE_W]];

private ["_mapDisplay", "_background", "_totalHeight", "_newXPos", "_newYPos", "_newWidth", "_newHeight", "_idc", "_return"];

// Create the background
_mapDisplay = ctrlParent _control;
_background = _mapDisplay ctrlCreate [QGVAR(Background), -1, _control];

// Initialize needed variables
_idc = ctrlIDC _control;
_totalHeight = CONTAINER_BASE_Y;
_newXPos = CONTAINER_BASE_X;
_newYPos = CONTAINER_BASE_Y;
_newWidth = ((_width - 2 * CONTAINER_BASE_X) - ((_perColumn - 1) * PADDING_X)) / _perColumn; // (Base width - padding from border - padding between columns) / pictures per column
_newHeight = CONTAINER_BASE_H;

{
    EXPLODE_3_PVT(_x,_picOrColor,_tooltip,_fnc_onClick);

    private ["_backgroundPic", "_newPic", "_newButton", "_pos"];

    // Create a new RscPicture control for the visual and a RscButton for the functional
    ADD(_idc, 10);
    _backgroundPic = _mapDisplay ctrlCreate ["RscPicture", _idc, _control];
    ADD(_idc, 10);
    _newPic = _mapDisplay ctrlCreate ["RscPicture", _idc, _control];
    ADD(_idc, 10);
    _newButton = _mapDisplay ctrlCreate [QGVAR(ButtonInvisble), _idc, _control];

    // Handle special cases
    if(_id == "symbols" || { _id == "icons" }) then {
        _backgroundPic ctrlSetText STRCOLOR(COLOR_TR);
    }
    else {
        _backgroundPic ctrlSetText STRCOLOR(COLOR_BLACK_TR25);
    };

    if(_id == "directions" && {EGVAR(rft,active)}) then {
        EGVAR(rft,dir_controls) pushBack [toLower _tooltip, [_newButton, _newPic, _backgroundPic]];
    };

    // Determine whether the input string is a picture or color
    if(_picOrColor find ".paa" != -1) then {
        // Set the height accordingly
        _newHeight = _newWidth * 4/3;

        // Set background color of pic
        _newPic ctrlSetTextColor [COLOR_WHITE];
    }
    else {
        _newHeight = CONTAINER_BASE_H;
    };

    // Set the new controls position
    _pos = [_newXPos, _newYPos, _newWidth, _newHeight];
    _backgroundPic ctrlSetPosition _pos;
    _newPic ctrlSetPosition _pos;
    _newButton ctrlSetPosition _pos;

    // Set the pictures path or the color
    _newPic ctrlSetText _picOrColor;

    // Set button tooltip
    _newButton ctrlSetTooltip _tooltip;

    // Add eventhandler for button
    _newButton ctrlAddEventHandler ["ButtonClick", format ["[_this select 0, %1, %2] call %3;", ctrlIDC _newPic, ctrlIDC _backgroundPic, _fnc_onClick]];

    // Commit the changes
    _newPic ctrlCommit 0;
    _newButton ctrlCommit 0;
    _backgroundPic ctrlCommit 0;

    // Update the variables
    ADD(_newXPos,_newWidth + PADDING_X);
    ADD(_idc, 100);

    if((_foreachIndex + 1) mod _perColumn == 0 || {(_foreachIndex + 1) >= count _source}) then {
        private ["_heightIncrease"];
        _heightIncrease = _newHeight + (PADDING_Y);
        _newYPos = _newYPos + _heightIncrease;
        _newXPos = CONTAINER_BASE_X;

        _totalHeight = _totalHeight + _newHeight + (PADDING_Y);
    };
} foreach _source;

// Double padding underneath last line
_totalHeight = _totalHeight + (PADDING_Y);

// Set the control's and the background's position
switch(_orientation) do {
    case "horizontal": {
        _control ctrlSetPosition [_mainOrientationPos, BASE_Y, _width, _totalHeight];
        _return = _width + BASE_X;
    };
    case "vertical": {
        _control ctrlSetPosition [BASE_X, _mainOrientationPos, _width, _totalHeight];
        _return = _totalHeight + BASE_Y;
    };
};
_background ctrlSetPosition [0, 0, _width, _totalHeight];

_control ctrlCommit 0;
_background ctrlCommit 0;

// Return the height of the control for yPos calculation
_return;