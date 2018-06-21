#include "script_component.hpp"

[
    {!((isNull player) or (isNull (finddisplay 46)))},
    {	// set player variables
        player setVariable [QGVAR(drawMarker), false, true];
        player setVariable [QGVAR(marker), NEW_MARKER, true];

        // GPS
        private _AddGpsPfh = {
            GVAR(pfhGPS) = [
                {
                    private _finished = false;
                    {
                        if (ctrlIDD _x == 311) then {
                            private _mapControl = _x displayCtrl 101;
                            _mapControl ctrlAddEventHandler ["draw", FUNC(handleDraw)];
                            _finished = true;
                        };
                    } forEach (uiNamespace getVariable "IGUI_displays");
                    if (_finished) then {
                        [_this select 1] call CBA_fnc_removePerFrameHandler;
                    };
                },
                0,[]
            ] call CBA_fnc_addPerFrameHandler;
        };

        [
            {!((missionNamespace getVariable [QEGVAR(rft,active), false]) && isNil QEGVAR(rft,pfhGPS))},
            {[] call _this},
            _addGpsPfh
        ] call CBA_fnc_waitUntilAndExecute;
        
        GVAR(initClient) = true;
    }
] call CBA_fnc_waitUntilAndExecute;
