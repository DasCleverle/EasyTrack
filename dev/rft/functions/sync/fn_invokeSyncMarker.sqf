#include "script_component.hpp"

PARAMS_2(_marker,_action);
EXPLODE_11_PVT(_marker,_icon,_size,_dir,_ellipse,_iconChanged,_sizeChanged,_dirChanged,_ellipseChanged,_time,_playerName,_index);
private ["_packet", "_cancel"];

// exit if no property has changed
_cancel = 0;
{
    if(_x || {_action == "delete"}) exitWith {
        INC(_cancel);
    };
} foreach [_iconChanged, _sizeChanged, _dirChanged, _ellipseChanged];

if(_cancel == 0 || _index == -1) exitWith {};

// reset marker color
private ["_iconColor"];
_iconColor = ICON_COLOR(_icon);
SET_COLOR_A(_iconColor, 1);

// the packet containg the changed properties
_packet = [];

{
    EXPLODE_3_PVT(_x,_condition,_value,_i);

    if(isNil "_i") then {
        _i = _foreachIndex;
    };

    if(_condition) then {
        _packet pushBack [_i, _value];
    };
} foreach [
    [_iconChanged,      _icon],
    [_sizeChanged,      _size],
    [_dirChanged,       _dir],
    [_ellipseChanged,   _ellipse],
    [true,              time,           8],
    [true,              _playerName,    9],
    [true,              _index,         10]
];

MARKER_SET_ICON_CHANGED(_marker, false);
MARKER_SET_SIZE_CHANGED(_marker, false);
MARKER_SET_DIR_CHANGED(_marker, false);
MARKER_SET_ELLIPSE_CHANGED(_marker, false);
MARKER_SET_TIME(_marker, time);

GVAR(packet) = [_index, _packet, side player, _action];
publicVariable QGVAR(packet);