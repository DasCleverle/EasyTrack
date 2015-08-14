#include "script_component.hpp"

PARAMS_2(_mapControl,_selectedMarker);

if(!GVAR(ctrlPressed) || {isNil "_selectedMarker"} || {!isNil QGVAR(selectedCatch)}) exitWith {};

private ["_mousePos"];
_mousePos = _mapControl ctrlMapScreenToWorld GVAR(mousePos);

if(GVAR(mouseButtonPressed)) then {
    private ["_direction", "_dirPos", "_dirAngle"];
    _direction = MARKER_GET_DIR(_selectedMarker);
    _dirPos = ICON_POS(_direction);
    _dirAngle = ICON_ANGLE(_direction);

    if!(_dirPos isEqualTo [-1]) then {
        private ["_dirScreenPos", "_dist", "_arrowPos"];
        _dirScreenPos = _mapControl ctrlMapWorldToScreen _dirPos;
        _dirAngle = if (_dirAngle > 180) then {
            270 - _dirAngle + 270
        } else {
            90 + (90 - _dirAngle)
        };

        _arrowPos = [X(_dirScreenPos) + 0.09 * sin _dirAngle, Y(_dirScreenPos) + 0.09 * cos _dirAngle];

        if(_arrowPos distance GVAR(mousePos) <= 0.03) then {
            GVAR(currentDirectionArrow) = _direction;
        };
    };
};

if(!isNil QGVAR(currentDirectionArrow)) then {
    private ["_dirAngle", "_dirPos"];
    _dirPos = ICON_POS(GVAR(currentDirectionArrow));
    _dirAngle = [_dirPos, _mousePos] call BIS_fnc_dirTo;
    [localize "STR_RFT_CUSTOM", _dirAngle] call FUNC(setDirection);
};