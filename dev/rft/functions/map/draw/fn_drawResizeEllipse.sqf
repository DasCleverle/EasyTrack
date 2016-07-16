#include "script_component.hpp"

PARAMS_2(_mapControl,_selectedMarker);

if(!GVAR(altPressed) || {isNil "_selectedMarker"} || {!isNil QGVAR(currentDirectionArrow)}) exitWith {};

// Resize ellipse
private ["_selectedEllipse", "_mousePos"];
_mousePos = _mapControl ctrlMapScreenToWorld GVAR(mousePos);
_selectedEllipse = MARKER_GET_ELLIPSE(_selectedMarker);

EXPLODE_4_PVT(_selectedEllipse,_pos,_a,_b,_angle);
if (_pos isEqualTo [-1]) exitWith {};

{
    private ["_catch", "_dim", "_catchPos", "_dir", "_dist"];
    _catch = ELLIPSE_CATCH;
    _dim = (1/4 * (_a min _b)) min 50;
    _dir = _angle + _x;

    SET_ELLIPSE_A(_catch, _dim);
    SET_ELLIPSE_B(_catch, _dim);

    if(_x == 0 || {_x == 180}) then {
        _dist = _b;
    }
    else {
        _dist = _a;
    };

    _catchPos = [X(_pos) + _dist * sin _dir, Y(_pos) + _dist * cos _dir];

    SET_ELLIPSE_POS(_catch, _catchPos);

    _mapControl drawEllipse _catch;

    if(_mousePos distance _catchPos <= _dim && {GVAR(mouseButtonPressed)}) then {
        GVAR(selectedCatch) = [_selectedEllipse, _x];
    };
} foreach [0, 90, 180, 270];

if(!isNil QGVAR(selectedCatch) && {GVAR(mouseButtonPressed)}) then {
    private ["_catch", "_catchPos", "_catchDir", "_dist"];
    _catch = GVAR(selectedCatch);
    EXPLODE_2_PVT(_catch,_catchEllipse,_dir);
    _catchPos = ELLIPSE_POS(_catchEllipse);
    _catchDir = ELLIPSE_ANGLE(_catchEllipse);

    _dist = _mousePos distance _catchPos;
    _catchDir = ([_catchPos, _mousePos] call BIS_fnc_dirTo) - _dir;

    if(_dir == 0 || {_dir == 180}) then {
        SET_ELLIPSE_B(_catchEllipse, _dist);
    }
    else {
        SET_ELLIPSE_A(_catchEllipse, _dist);
    };
    SET_ELLIPSE_ANGLE(_catchEllipse, _catchDir);
    MARKER_SET_CHANGED(_selectedMarker, true);
};