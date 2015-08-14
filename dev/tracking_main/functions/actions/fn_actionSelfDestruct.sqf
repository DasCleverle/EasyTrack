#include "script_component.hpp"

[] spawn {
    disableSerialization;
    private ["_configs", "_result"];

    _result = ["Do you really want to self destruct your EasyTrack Device?", "Self Destruction", "Yes", "No", DISPLAY(IDD_MAINMAP)] call BIS_fnc_guiMessage;
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