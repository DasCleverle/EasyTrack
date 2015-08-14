#include "script_component.hpp"

[] spawn {
    disableSerialization;
    private ["_configs", "_result"];

    _result = [localize "STR_MAIN_SELFDESTRUCT_CONFIRM", localize "STR_MAIN_SELFDESTRUCT", localize "STR_MAIN_YES", localize "STR_MAIN_NO", DISPLAY(IDD_MAINMAP)] call BIS_fnc_guiMessage;
    if(!_result) exitWith {};

    _configs = configProperties [configFile >> "Extended_Put_Eventhandlers" >> "Man", 'isClass _x && { (configName _x find "putTracker") != -1 } && { (configName _x find QUOTE(PREFIX)) != -1 }'];
    {
        _item = _x;
        player unassignItem _item;
        player removeItem _item;

        {
            [player, objNull, _item] call compile getText(_x >> "put");
        } foreach _configs;
    } foreach TRACKER_ITEMS;
};