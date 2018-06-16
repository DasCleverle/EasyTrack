#include "script_component.hpp"

GVAR(active) = true;

// Client init
if (hasInterface) then {
    [] call FUNC(initClient);
};

// Global variables for client and server
GVAR(symbols) = [
    [QMAINDATAPATH(symbols\unknown.paa),         LLSTRING(UNKNOWN),     { [QMAINDATAPATH(symbols\unknown.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\inf.paa),             LLSTRING(INF),         { [QMAINDATAPATH(symbols\inf.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\motinf.paa),          LLSTRING(MOTINF),      { [QMAINDATAPATH(symbols\motinf.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\mechinf.paa),         LLSTRING(MECHINF),     { [QMAINDATAPATH(symbols\mechinf.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\recon.paa),           LLSTRING(RECON),       { [QMAINDATAPATH(symbols\recon.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\hq.paa),              LLSTRING(HQ),          { [QMAINDATAPATH(symbols\hq.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\armor.paa),           LLSTRING(ARMOR),       { [QMAINDATAPATH(symbols\armor.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\artillery.paa),       LLSTRING(ARTILLERY),   { [QMAINDATAPATH(symbols\artillery.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\heli.paa),            LLSTRING(HELI),        { [QMAINDATAPATH(symbols\heli.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\jet.paa),             LLSTRING(JET),         { [QMAINDATAPATH(symbols\jet.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\uav.paa),             LLSTRING(UAV),         { [QMAINDATAPATH(symbols\uav.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\logistics.paa),       LLSTRING(LOGISTICS),   { [QMAINDATAPATH(symbols\logistics.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\medical.paa),         LLSTRING(MEDICAL),     { [QMAINDATAPATH(symbols\medical.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\static.paa),          LLSTRING(STATIC),      { [QMAINDATAPATH(symbols\static.paa)] call FUNC(setSymbol); }]
];

GVAR(colors) = [
    [STRCOLOR(COLOR_GREY),      LLSTRING(UNKNOWN),      { [COLOR_GREY]   call FUNC(setColor); }],
    [STRCOLOR(COLOR_OPFOR),     LLSTRING(OPFOR),        { [COLOR_OPFOR]  call FUNC(setColor); }],
    [STRCOLOR(COLOR_BLUFOR),    LLSTRING(BLUFOR),       { [COLOR_BLUFOR] call FUNC(setColor); }],
    [STRCOLOR(COLOR_INDEP),     LLSTRING(INDEP),        { [COLOR_INDEP]  call FUNC(setColor); }],
    [STRCOLOR(COLOR_CIVIL),     LLSTRING(CIVIL),        { [COLOR_CIVIL]  call FUNC(setColor); }]
];

GVAR(sizes) = [
    [QMAINDATAPATH(sizes\fireteam.paa),         LLSTRING(FIRETEAM),                { [SIZE_FIRETEAM] call FUNC(setSize); }],
    [QMAINDATAPATH(sizes\unit.paa),             LLSTRING(UNIT),             { [SIZE_UNIT] call FUNC(setSize); }],
    [QMAINDATAPATH(sizes\squad.paa),            LLSTRING(SQUAD),                    { [SIZE_SQUAD] call FUNC(setSize); }],
    [QMAINDATAPATH(sizes\platoon.paa),          LLSTRING(PLATOON),                  { [SIZE_PLATOON] call FUNC(setSize); }]
];

GVAR(directions) = [
    [QMAINDATAPATH(directions\static.paa),      LLSTRING(STATIC),                   { [LLSTRING(STATIC), -1] call FUNC(setDirection); }],
    [QMAINDATAPATH(directions\n.paa),           LLSTRING(NORTH),                    { [LLSTRING(NORTH), 0] call FUNC(setDirection); }],
    [QMAINDATAPATH(directions\ne.paa),          LLSTRING(NORTHEAST),               { [LLSTRING(NORTHEAST), 45] call FUNC(setDirection); }],
    [QMAINDATAPATH(directions\e.paa),           LLSTRING(EAST),                     { [LLSTRING(EAST), 90] call FUNC(setDirection); }],
    [QMAINDATAPATH(directions\se.paa),          LLSTRING(SOUTHEAST),               { [LLSTRING(SOUTHEAST), 135] call FUNC(setDirection); }],
    [QMAINDATAPATH(directions\custom.paa),      LLSTRING(CUSTOM),                   {}],
    [QMAINDATAPATH(directions\s.paa),           LLSTRING(SOUTH),                    { [LLSTRING(SOUTH), 180] call FUNC(setDirection); }],
    [QMAINDATAPATH(directions\sw.paa),          LLSTRING(SOUTHWEST),               { [LLSTRING(SOUTHWEST), 225] call FUNC(setDirection); }],
    [QMAINDATAPATH(directions\w.paa),           LLSTRING(WEST),                     { [LLSTRING(WEST), 270] call FUNC(setDirection); }],
    [QMAINDATAPATH(directions\nw.paa),          LLSTRING(NORTHWEST),               { [LLSTRING(NORTHWEST), 315] call FUNC(setDirection); }]
];

GVAR(mainControls) = [
    [QEGVAR(main,LabelHeading),   [LLSTRING(FAVHEADING), false]],            // favorites heading
    [QEGVAR(main,Label),          [LLSTRING(FAVINFO1), false]],
    [QEGVAR(main,Label),          [LLSTRING(FAVINFO2)]],
    [QGVAR(FavContainer),   []],
    [QEGVAR(main,LabelHeading),   [LLSTRING(RFTNAME)]],                    // main heading
    [QEGVAR(main,Button),         [LLSTRING(CENTERONICON), FUNC(btn_CenterOnIcon)]], // "center-on marker" button
    [QEGVAR(main,Container),      ["symbols", GVAR(symbols),     6]],        // report symbols
    [QEGVAR(main,Container),      ["colors",  GVAR(colors),      5]],        // report colors
    [QEGVAR(main,Container),      ["sizes",   GVAR(sizes),       4]],        // report sizes
    [QEGVAR(main,Container),      ["directions", GVAR(directions),  5]],        // report directions
    [QEGVAR(main,Button),         [LLSTRING(BTN_SHOWELLIPSE), FUNC(btn_toggleEllipse)], "btnToggleEllipse"] // "toggle ellipse" button
];

ISNILS(GVAR(markers),[]);
ISNILS(GVAR(currentMarkerID),0);

GVAR(dir_controls) = [];

GVAR(mainControlsVisible) = false;
GVAR(altPressed) = false;
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

[
    {!isNil QEGVAR(main,controlTypes)},
    {
        EGVAR(main,controlTypes) pushBack [QGVAR(FavContainer),FUNC(initFavContainer)];

        // Map init
        [] call FUNC(initMap);
        [] call MFUNC(initMap);

        // syncing
        QGVAR(packet) addPublicVariableEventHandler {
            (_this select 1) call FUNC(syncMarker);
        };
    }
] call CBA_fnc_waitUntilAndExecute;
