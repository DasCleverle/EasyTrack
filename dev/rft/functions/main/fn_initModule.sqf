#include "script_component.hpp"

GVAR(active) = true;

// Server only init
/*if(isServer) then {
    GVAR(serverMarkersWEST) = [];
    GVAR(serverMarkersEAST) = [];
    GVAR(serverMarkersGUER) = [];
    GVAR(serverCurrentMarkerIDWEST) = 0;
    GVAR(serverCurrentMarkerIDEAST) = 0;
    GVAR(serverCurrentMarkerIDGUER) = 0;
};*/

// Client init
if(hasInterface) then {
    waitUntil { !isNull player };
    waitUntil { !isNull (finddisplay 46) };

    // JIP
    GVAR(markers) = [missionNamespace, QGVAR(markers), []] call BIS_fnc_getServerVariable;
    GVAR(currentMarkerID) = [missionNamespace, QGVAR(currentMarkerID), 0] call BIS_fnc_getServerVariable;

    {
        SET_MARKER(MARKER_GET_ID(_x), _x);
    } foreach GVAR(markers);

    // GPS
    GVAR(pfhGPS) = [
        {
            _finished = false;
            {
                if(ctrlIDD _x == 133) then {
                    _mapControl = _x displayCtrl 101;
                    _mapControl ctrlAddEventHandler ["draw", { _this call FUNC(handleDraw); }];
                    _finished = true;
                };
            } forEach (uiNamespace getVariable "IGUI_displays");
            if(_finished) then {
                [GVAR(pfhGPS)] call CBA_fnc_removePerFrameHandler;
            };
        },
        0,
        []
    ] call CBA_fnc_addPerFrameHandler;
};

// Global variables for client and server
GVAR(symbols) = [
    [QMAINDATAPATH(symbols\unknown.paa),         "Unknown",                 { [QMAINDATAPATH(symbols\unknown.paa)] spawn FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\inf.paa),             "Infantry",                { [QMAINDATAPATH(symbols\inf.paa)] spawn FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\motinf.paa),          "Motorized Infantry",      { [QMAINDATAPATH(symbols\motinf.paa)] spawn FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\mechinf.paa),         "Mechanized Infantry",     { [QMAINDATAPATH(symbols\mechinf.paa)] spawn FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\recon.paa),           "Recon",                   { [QMAINDATAPATH(symbols\recon.paa)] spawn FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\hq.paa),              "HQ",                      { [QMAINDATAPATH(symbols\hq.paa)] spawn FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\armor.paa),           "Armor",                   { [QMAINDATAPATH(symbols\armor.paa)] spawn FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\artillery.paa),       "Artillery",               { [QMAINDATAPATH(symbols\artillery.paa)] spawn FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\heli.paa),            "Heli",                    { [QMAINDATAPATH(symbols\heli.paa)] spawn FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\jet.paa),             "Jet",                     { [QMAINDATAPATH(symbols\jet.paa)] spawn FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\uav.paa),             "UAV",                     { [QMAINDATAPATH(symbols\uav.paa)] spawn FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\logistics.paa),       "Logistics",               { [QMAINDATAPATH(symbols\logistics.paa)] spawn FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\medical.paa),         "Medical",                 { [QMAINDATAPATH(symbols\medical.paa)] spawn FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\static.paa),          "Static",                  { [QMAINDATAPATH(symbols\static.paa)] spawn FUNC(setSymbol); }]
];

GVAR(colors) = [
    [STRCOLOR(COLOR_GREY),      "Unknown",      { [COLOR_GREY]   spawn FUNC(setColor); }],
    [STRCOLOR(COLOR_OPFOR),     "OPFOR",        { [COLOR_OPFOR]  spawn FUNC(setColor); }],
    [STRCOLOR(COLOR_BLUFOR),    "BLUFOR",       { [COLOR_BLUFOR] spawn FUNC(setColor); }],
    [STRCOLOR(COLOR_INDEP),     "Independent",  { [COLOR_INDEP]  spawn FUNC(setColor); }],
    [STRCOLOR(COLOR_CIVIL),     "Civil",        { [COLOR_CIVIL]  spawn FUNC(setColor); }]
];

GVAR(sizes) = [
    [QMAINDATAPATH(sizes\fireteam.paa),         "Fire Team",                { [SIZE_FIRETEAM] spawn FUNC(setSize); }],
    [QMAINDATAPATH(sizes\unit.paa),             "Unit/Vehicle",             { [SIZE_UNIT] spawn FUNC(setSize); }],
    [QMAINDATAPATH(sizes\squad.paa),            "Squad",                    { [SIZE_SQUAD] spawn FUNC(setSize); }],
    [QMAINDATAPATH(sizes\platoon.paa),          "Platoon",                  { [SIZE_PLATOON] spawn FUNC(setSize); }]
];

GVAR(directions) = [
    [QMAINDATAPATH(directions\static.paa),      "Static",                   { ["static", -1] spawn FUNC(setDirection); }],
    [QMAINDATAPATH(directions\n.paa),           "North",                    { ["north", 0] spawn FUNC(setDirection); }],
    [QMAINDATAPATH(directions\ne.paa),          "North East",               { ["north east", 45] spawn FUNC(setDirection); }],
    [QMAINDATAPATH(directions\e.paa),           "East",                     { ["east", 90] spawn FUNC(setDirection); }],
    [QMAINDATAPATH(directions\se.paa),          "South East",               { ["south east", 135] spawn FUNC(setDirection); }],
    [QMAINDATAPATH(directions\custom.paa),      "Custom",                   {}],
    [QMAINDATAPATH(directions\s.paa),           "South",                    { ["south", 180] spawn FUNC(setDirection); }],
    [QMAINDATAPATH(directions\sw.paa),          "South West",               { ["south west", 225] spawn FUNC(setDirection); }],
    [QMAINDATAPATH(directions\w.paa),           "West",                     { ["west", 270] spawn FUNC(setDirection); }],
    [QMAINDATAPATH(directions\nw.paa),          "North West",               { ["north west", 315] spawn FUNC(setDirection); }]
];

GVAR(mainControls) = [
    [QEGVAR(tracking_main,LabelHeading),   ["Favorites", false]],            // favorites heading
    [QEGVAR(tracking_main,Label),          ["CTRL + Left Click to select for", false]],
    [QEGVAR(tracking_main,Label),          ["editing"]],
    [QGVAR(FavContainer),   []],
    [QEGVAR(tracking_main,LabelHeading),   ["Red Force Tracking"]],                    // main heading
    [QEGVAR(tracking_main,Button),         ["Center on marker", FUNC(btn_CenterOnIcon)]], // "center-on marker" button
    [QEGVAR(tracking_main,Container),      ["symbols", GVAR(symbols),     6]],        // report symbols
    [QEGVAR(tracking_main,Container),      ["colors",  GVAR(colors),      5]],        // report colors
    [QEGVAR(tracking_main,Container),      ["sizes",   GVAR(sizes),       4]],        // report sizes
    [QEGVAR(tracking_main,Container),      ["directions", GVAR(directions),  5]],        // report directions
    [QEGVAR(tracking_main,Button),         ["Show Ellipse", FUNC(btn_toggleEllipse)], "btnToggleEllipse"] // "toggle ellipse" button
];

ISNILS(GVAR(markers),[]);
ISNILS(GVAR(currentMarkerID),0);

GVAR(dir_controls) = [];

GVAR(mainControlsVisible) = false;
GVAR(ctrlPressed) = false;
GVAR(mouseButtonPressed) = false;
GVAR(mapInitialized) = false;
GVAR(pasted) = false;

GVAR(editingFav) = -1;
GVAR(favControls) = [];
GVAR(favorites) = [
    [QMAINDATAPATH(symbols\unknown.paa), SIZE_UNIT, [COLOR_GREY]],
    [QMAINDATAPATH(symbols\unknown.paa), SIZE_UNIT, [COLOR_GREY]],
    [QMAINDATAPATH(symbols\unknown.paa), SIZE_UNIT, [COLOR_GREY]],
    [QMAINDATAPATH(symbols\unknown.paa), SIZE_UNIT, [COLOR_GREY]]
];

waitUntil { !isNil QEGVAR(tracking_main,controlTypes); };
EGVAR(tracking_main,controlTypes) pushBack [QGVAR(FavContainer),FUNC(initFavContainer)];

// Map init
[] spawn FUNC(initMap);

// syncing
QGVAR(packet) addPublicVariableEventHandler {
    (_this select 1) call FUNC(syncMarker);
};

