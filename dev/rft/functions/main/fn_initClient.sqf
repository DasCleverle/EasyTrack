#include "script_component.hpp"

[
    {!((isNull player) or (isNull (finddisplay 46)))},
    {	// JIP
        private _getMarkers = [missionNamespace, QGVAR(markers), []] spawn BIS_fnc_getServerVariable;
        [{scriptDone _getMarkers}, {
            { SET_MARKER(MARKER_GET_ID(_x), _x) } foreach GVAR(markers);
        }] call CBA_fnc_waitUntilAndExecute;
        [missionNamespace, QGVAR(currentMarkerID), 0] spawn BIS_fnc_getServerVariable;

        // GPS
        GVAR(pfhGPS) = [
            {
                _finished = false;
                {
                    if(ctrlIDD _x == 311) then {
                        _mapControl = _x displayCtrl 101;
                        _mapControl ctrlAddEventHandler ["draw", FUNC(handleDraw)];
                        _finished = true;
                    };
                } forEach (uiNamespace getVariable "IGUI_displays");
                if(_finished) then {
                    [_this select 1] call CBA_fnc_removePerFrameHandler;
                };
            },0,[]
        ] call CBA_fnc_addPerFrameHandler;
    }
] call CBA_fnc_waitUntilAndExecute;
