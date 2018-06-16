#include "script_component.hpp"

[] spawn {
    disableSerialization;
    private ["_configs", "_result"];

    _result = [LLSTRING(SELFDESTRUCT_CONFIRM), LLSTRING(SELFDESTRUCT), LLSTRING(YES), LLSTRING(NO), DISPLAY(IDD_MAINMAP)] call BIS_fnc_guiMessage;
    if(!_result) exitWith {};

    _configs = configProperties [configFile >> "Extended_Put_Eventhandlers" >> "Man", 'isClass _x && { (configName _x find "putTracker") != -1 } && { (configName _x find QUOTE(PREFIX)) != -1 }'];

    {
        _item = _x;
        if(_item in TRACKER_ITEMS) then {
            _isAssigned = _item in assignedItems player;

            player unassignItem _item;
            player removeItem _item;

            {
                EXPLODE_2_PVT(_x,_items,_destructedItem);

                if(_item in _items) then {
                    player addItem _destructedItem;

                    if(_isAssigned) then {
                        player assignItem _destructedItem;
                    };
                };
            } foreach [
                [PDA_ITEMS, "EasyTrack_PDA_Destructed"],
                [TABLET_ITEMS, "EasyTrack_Tablet_Destructed"]
            ];

            {
                [player, objNull, _item] call compile getText(_x >> "put");
            } foreach _configs;
        };
    } foreach (items player + assignedItems player);
};
