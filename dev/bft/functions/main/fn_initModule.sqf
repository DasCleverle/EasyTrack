#include "script_component.hpp"

GVAR(active) = true;

// Client init
if(hasInterface) then {
    waitUntil { !isNull player };
    waitUntil { !isNull (finddisplay 46) };

    // set player variables
    player setVariable [QGVAR(drawMarker), false, true];
    player setVariable [QGVAR(marker), NEW_MARKER, true];

    // GPS
    if(EGVAR(rft,active)) then {
        waitUntil { !isNil QEGVAR(rft,pfhGPS); };
    };

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
        },
        0,[]
    ] call CBA_fnc_addPerFrameHandler;
};

// Common init
GVAR(symbols) = [
    [QMAINDATAPATH(symbols\inf.paa),             "Infantry",                { [QMAINDATAPATH(symbols\inf.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\motinf.paa),          "Motorized Infantry",      { [QMAINDATAPATH(symbols\motinf.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\mechinf.paa),         "Mechanized Infantry",     { [QMAINDATAPATH(symbols\mechinf.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\recon.paa),           "Recon",                   { [QMAINDATAPATH(symbols\recon.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\hq.paa),              "HQ",                      { [QMAINDATAPATH(symbols\hq.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\armor.paa),           "Armor",                   { [QMAINDATAPATH(symbols\armor.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\artillery.paa),       "Artillery",               { [QMAINDATAPATH(symbols\artillery.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\heli.paa),            "Heli",                    { [QMAINDATAPATH(symbols\heli.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\jet.paa),             "Jet",                     { [QMAINDATAPATH(symbols\jet.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\logistics.paa),       "Logistics",               { [QMAINDATAPATH(symbols\logistics.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\medical.paa),         "Medical",                 { [QMAINDATAPATH(symbols\medical.paa)] call FUNC(setSymbol); }]
];

GVAR(sizes) = [
    [QMAINDATAPATH(sizes\fireteam.paa),         "Fire Team",                { [SIZE_FIRETEAM] call FUNC(setSize); }],
    [QMAINDATAPATH(sizes\unit.paa),             "Unit/Vehicle",             { [SIZE_UNIT] call FUNC(setSize); }],
    [QMAINDATAPATH(sizes\squad.paa),            "Squad",                    { [SIZE_SQUAD] call FUNC(setSize); }],
    [QMAINDATAPATH(sizes\platoon.paa),          "Platoon",                  { [SIZE_PLATOON] call FUNC(setSize); }]
];

GVAR(mainControls) = [
    [QEGVAR(tracking_main,LabelHeading),        ["Blue Force Tracking"]],
    [QEGVAR(tracking_main,Button),              ["Center on marker", FUNC(btn_centerOnIcon)]],
    [QEGVAR(tracking_main,Label),               ["Unit (read only)", false]],
    [QGVAR(TextBoxNoMapClose),                  [], "txtPlayerName"],
    [QEGVAR(tracking_main,Label),               ["Callsign", false]],
    [QGVAR(TextBoxNoMapClose),                  [], "txtCallsign"],
    [QEGVAR(tracking_main,Label),               ["Frequency/Channel", false]],
    [QGVAR(TextBoxNoMapClose),                  [], "txtFrequency"],
    [QEGVAR(tracking_main,Container),           ["symbols", GVAR(symbols), 6]],
    [QEGVAR(tracking_main,Container),           ["sizes",   GVAR(sizes),   4]]
];

GVAR(configureVisible) = false;
GVAR(configureUnits) = allPlayers;
GVAR(mapInitialized) = false;

waitUntil { !isNil QEGVAR(tracking_main,controlTypes) };
EGVAR(tracking_main,controlTypes) pushBack [QGVAR(TextBoxNoMapClose),FUNC(initTextBoxNoMapClose)];

[] spawn FUNC(initMap);
if(!EGVAR(rft,active)) then {
    [] spawn MFUNC(initMap);
};

["Configure BFT", { HAS_TABLET }, FUNC(actionConfigure)] call MFUNC(addAction);