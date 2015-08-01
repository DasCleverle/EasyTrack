#include "script_component.hpp"

#define PADDING_X (3 * CONTAINER_BASE_X)

PARAMS_3(_control,_mainYPos,_params);

private ["_favCount", "_mapDisplay", "_background",  "_newXPos", "_newYPos", "_newWidth", "_newHeight", "_height"];

_favCount = 4;
_mapDisplay = ctrlParent _control;
_background = _mapDisplay ctrlCreate [QEGVAR(tracking_main,Background), -1, _control];

_newXPos = CONTAINER_BASE_X;
_newYPos = CONTAINER_BASE_Y;
_newWidth = ((BASE_W - 2 * CONTAINER_BASE_X) - ((_favCount - 1) * PADDING_X)) / _favCount;
_newHeight = _newWidth * 4/3;

_height = 2 * CONTAINER_BASE_Y + _newHeight;

{
    EXPLODE_3_PVT(_x,_symbol,_size,_color);
    private ["_picSymbol", "_picSize", "_btnAction", "_picEmphasis"];

    _picSymbol = _mapDisplay ctrlCreate ["RscPicture", -1, _control];
    _picSize = _mapDisplay ctrlCreate ["RscPicture", -1, _control];
    _btnAction = _mapDisplay ctrlCreate [QEGVAR(tracking_main,ButtonInvisble), -1, _control];
    _picEmphasis = _mapDisplay ctrlCreate ["RscPicture", -1, _control];

    _picSymbol ctrlSetTextColor _color;
    _picEmphasis ctrlSetTextColor [COLOR_YELLOW];

    _picSymbol ctrlSetText _symbol;
    _picSize ctrlSetText _size;

    _btnAction ctrlAddEventHandler ["ButtonClick", format["[_this,%1] spawn %2;", _foreachIndex, FUNC(btn_setFavorite)]];

    _pos = [_newXPos, _newYPos, _newWidth, _newHeight];
    _picSymbol ctrlSetPosition _pos;
    _picSize ctrlSetPosition _pos;
    _btnAction ctrlSetPosition _pos;
    _picEmphasis ctrlSetPosition _pos;

    _picSymbol ctrlCommit 0;
    _picSize ctrlCommit 0;
    _btnAction ctrlCommit 0;
    _picEmphasis ctrlCommit 0;

    ADD(_newXPos,_newWidth + PADDING_X);
    GVAR(favControls) pushBack [_picSymbol, _picSize, _picEmphasis];
} foreach GVAR(favorites);

_control ctrlSetPosition [BASE_X, _mainYPos, BASE_W, _height];
_background ctrlSetPosition [0, 0, BASE_W, _height];

_control ctrlCommit 0;
_background ctrlCommit 0;

_height + BASE_Y;