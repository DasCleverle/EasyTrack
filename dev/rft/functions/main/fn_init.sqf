#include "script_component.hpp"

GVAR(active) = true;

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
                    _mapControl ctrlAddEventHandler ["draw", FUNC(handleDraw)];
                    _finished = true;
                };
            } forEach (uiNamespace getVariable "IGUI_displays");
            if(_finished) then {
                [_this select 1] call CBA_fnc_removePerFrameHandler;
            };
        },0,[]
    ] call CBA_fnc_addPerFrameHandler;
};

// Global variables for client and server
GVAR(symbols) = [
    [QMAINDATAPATH(symbols\unknown.paa),         localize "STR_RFT_UNKNOWN",                 { [QMAINDATAPATH(symbols\unknown.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\inf.paa),             localize "STR_RFT_INF",                { [QMAINDATAPATH(symbols\inf.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\motinf.paa),          localize "STR_RFT_MOTINF",      { [QMAINDATAPATH(symbols\motinf.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\mechinf.paa),         localize "STR_RFT_MECHINF",     { [QMAINDATAPATH(symbols\mechinf.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\recon.paa),           localize "STR_RFT_RECON",                   { [QMAINDATAPATH(symbols\recon.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\hq.paa),              localize "STR_RFT_HQ",                      { [QMAINDATAPATH(symbols\hq.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\armor.paa),           localize "STR_RFT_ARMOR",                   { [QMAINDATAPATH(symbols\armor.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\artillery.paa),       localize "STR_RFT_ARTILLERY",               { [QMAINDATAPATH(symbols\artillery.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\heli.paa),            localize "STR_RFT_HELI",                    { [QMAINDATAPATH(symbols\heli.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\jet.paa),             localize "STR_RFT_JET",                     { [QMAINDATAPATH(symbols\jet.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\uav.paa),             localize "STR_RFT_UAV",                     { [QMAINDATAPATH(symbols\uav.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\logistics.paa),       localize "STR_RFT_LOGISTICS",               { [QMAINDATAPATH(symbols\logistics.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\medical.paa),         localize "STR_RFT_MEDICAL",                 { [QMAINDATAPATH(symbols\medical.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\static.paa),          localize "STR_RFT_STATIC",                  { [QMAINDATAPATH(symbols\static.paa)] call FUNC(setSymbol); }]
];

GVAR(colors) = [
    [STRCOLOR(COLOR_GREY),      localize "STR_RFT_UNKNOWN",      { [COLOR_GREY]   call FUNC(setColor); }],
    [STRCOLOR(COLOR_OPFOR),     localize "STR_RFT_OPFOR",        { [COLOR_OPFOR]  call FUNC(setColor); }],
    [STRCOLOR(COLOR_BLUFOR),    localize "STR_RFT_BLUFOR",       { [COLOR_BLUFOR] call FUNC(setColor); }],
    [STRCOLOR(COLOR_INDEP),     localize "STR_RFT_INDEP",        { [COLOR_INDEP]  call FUNC(setColor); }],
    [STRCOLOR(COLOR_CIVIL),     localize "STR_RFT_CIVIL",        { [COLOR_CIVIL]  call FUNC(setColor); }]
];

GVAR(sizes) = [
    [QMAINDATAPATH(sizes\fireteam.paa),         localize "STR_RFT_FIRETEAM",                { [SIZE_FIRETEAM] call FUNC(setSize); }],
    [QMAINDATAPATH(sizes\unit.paa),             localize "STR_RFT_UNIT",             { [SIZE_UNIT] call FUNC(setSize); }],
    [QMAINDATAPATH(sizes\squad.paa),            localize "STR_RFT_SQUAD",                    { [SIZE_SQUAD] call FUNC(setSize); }],
    [QMAINDATAPATH(sizes\platoon.paa),          localize "STR_RFT_PLATOON",                  { [SIZE_PLATOON] call FUNC(setSize); }]
];

GVAR(directions) = [
    [QMAINDATAPATH(directions\static.paa),      localize "STR_RFT_STATIC",                   { [localize "STR_RFT_STATIC", -1] call FUNC(setDirection); }],
    [QMAINDATAPATH(directions\n.paa),           localize "STR_RFT_NORTH",                    { [localize "STR_RFT_NORTH", 0] call FUNC(setDirection); }],
    [QMAINDATAPATH(directions\ne.paa),          localize "STR_RFT_NORTHEAST",               { [localize "STR_RFT_NORTHEAST", 45] call FUNC(setDirection); }],
    [QMAINDATAPATH(directions\e.paa),           localize "STR_RFT_EAST",                     { [localize "STR_RFT_EAST", 90] call FUNC(setDirection); }],
    [QMAINDATAPATH(directions\se.paa),          localize "STR_RFT_SOUTHEAST",               { [localize "STR_RFT_SOUTHEAST", 135] call FUNC(setDirection); }],
    [QMAINDATAPATH(directions\custom.paa),      localize "STR_RFT_CUSTOM",                   {}],
    [QMAINDATAPATH(directions\s.paa),           localize "STR_RFT_SOUTH",                    { [localize "STR_RFT_SOUTH", 180] call FUNC(setDirection); }],
    [QMAINDATAPATH(directions\sw.paa),          localize "STR_RFT_SOUTHWEST",               { [localize "STR_RFT_SOUTHWEST", 225] call FUNC(setDirection); }],
    [QMAINDATAPATH(directions\w.paa),           localize "STR_RFT_WEST",                     { [localize "STR_RFT_WEST", 270] call FUNC(setDirection); }],
    [QMAINDATAPATH(directions\nw.paa),          localize "STR_RFT_NORTHWEST",               { [localize "STR_RFT_NORTHWEST", 315] call FUNC(setDirection); }]
];

GVAR(mainControls) = [
    [QEGVAR(tracking_main,LabelHeading),   [localize "STR_RFT_FAVHEADING", false]],            // favorites heading
    [QEGVAR(tracking_main,Label),          [localize "STR_RFT_FAVINFO1", false]],
    [QEGVAR(tracking_main,Label),          [localize "STR_RFT_FAVINFO2"]],
    [QGVAR(FavContainer),   []],
    [QEGVAR(tracking_main,LabelHeading),   [localize "STR_RFT_RFTNAME"]],                    // main heading
    [QEGVAR(tracking_main,Button),         [localize "STR_RFT_CENTERONICON", FUNC(btn_CenterOnIcon)]], // "center-on marker" button
    [QEGVAR(tracking_main,Container),      ["symbols", GVAR(symbols),     6]],        // report symbols
    [QEGVAR(tracking_main,Container),      ["colors",  GVAR(colors),      5]],        // report colors
    [QEGVAR(tracking_main,Container),      ["sizes",   GVAR(sizes),       4]],        // report sizes
    [QEGVAR(tracking_main,Container),      ["directions", GVAR(directions),  5]],        // report directions
    [QEGVAR(tracking_main,Button),         [localize "STR_RFT_BTN_SHOWELLIPSE", FUNC(btn_toggleEllipse)], "btnToggleEllipse"] // "toggle ellipse" button
];

ISNILS(GVAR(markers),[]);
ISNILS(GVAR(currentMarkerID),0);

GVAR(dir_controls) = [];

GVAR(mainControlsVisible) = false;
GVAR(ctrlPressed) = false;
GVAR(mouseButtonPressed) = false;
GVAR(mapInitialized) = false;
GVAR(pasted) = false;
GVAR(dblClick) = false;

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
[] call FUNC(initMap);
[] call MFUNC(initMap);

// syncing
QGVAR(packet) addPublicVariableEventHandler {
    (_this select 1) call FUNC(syncMarker);
};