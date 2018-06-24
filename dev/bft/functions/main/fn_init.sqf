#include "script_component.hpp"

GVAR(active) = true;

if (hasInterface) then {[] call FUNC(initClient)};

// Common init
GVAR(symbols) = [
    [QMAINDATAPATH(symbols\inf.paa),             localize "STR_BFT_INF",                { [QMAINDATAPATH(symbols\inf.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\motinf.paa),          localize "STR_BFT_MOTINF",      { [QMAINDATAPATH(symbols\motinf.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\mechinf.paa),         localize "STR_BFT_MECHINF",     { [QMAINDATAPATH(symbols\mechinf.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\recon.paa),           localize "STR_BFT_RECON",                   { [QMAINDATAPATH(symbols\recon.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\hq.paa),              localize "STR_BFT_HQ",                      { [QMAINDATAPATH(symbols\hq.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\armor.paa),           localize "STR_BFT_ARMOR",                   { [QMAINDATAPATH(symbols\armor.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\artillery.paa),       localize "STR_BFT_ARTILLERY",               { [QMAINDATAPATH(symbols\artillery.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\heli.paa),            localize "STR_BFT_HELI",                    { [QMAINDATAPATH(symbols\heli.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\jet.paa),             localize "STR_BFT_JET",                     { [QMAINDATAPATH(symbols\jet.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\logistics.paa),       localize "STR_BFT_LOGISTICS",               { [QMAINDATAPATH(symbols\logistics.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\medical.paa),         localize "STR_BFT_MEDICAL",                 { [QMAINDATAPATH(symbols\medical.paa)] call FUNC(setSymbol); }]
];

GVAR(sizes) = [
    [QMAINDATAPATH(sizes\fireteam.paa),         localize "STR_BFT_FIRETEAM",                { [SIZE_FIRETEAM] call FUNC(setSize); }],
    [QMAINDATAPATH(sizes\unit.paa),             localize "STR_BFT_UNIT",             { [SIZE_UNIT] call FUNC(setSize); }],
    [QMAINDATAPATH(sizes\squad.paa),            localize "STR_BFT_SQUAD",                    { [SIZE_SQUAD] call FUNC(setSize); }],
    [QMAINDATAPATH(sizes\platoon.paa),          localize "STR_BFT_PLATOON",                  { [SIZE_PLATOON] call FUNC(setSize); }]
];

GVAR(mainControls) = [
    [QEGVAR(tracking_main,LabelHeading),        [localize "STR_BFT_BFTNAME"]],
    [QEGVAR(tracking_main,Button),              [localize "STR_BFT_CENTERONICON", FUNC(btn_centerOnIcon)]],
    [QEGVAR(tracking_main,Label),               [localize "STR_BFT_UNITRO", false]],
    [QGVAR(TextBoxNoMapCloseReadOnly),          [], "txtPlayerName"],
    [QEGVAR(tracking_main,Label),               [localize "STR_BFT_CALLSIGN", false]],
    [QGVAR(TextBoxNoMapClose),                  [], "txtCallsign"],
    [QEGVAR(tracking_main,Label),               [localize "STR_BFT_FREQUENCY", false]],
    [QGVAR(TextBoxNoMapClose),                  [], "txtFrequency"],
    [QEGVAR(tracking_main,Container),           ["symbols", GVAR(symbols), 6]],
    [QEGVAR(tracking_main,Container),           ["sizes",   GVAR(sizes),   4]]
];

GVAR(configureVisible) = false;
GVAR(configureUnits) = allPlayers;
GVAR(mapInitialized) = false;

[
    {(!isNil QEGVAR(tracking_main,controlTypes)) && !((isNull player) or (isNull (finddisplay 46)))},
    {
        EGVAR(tracking_main,controlTypes) pushBack [QGVAR(TextBoxNoMapClose),FUNC(initTextBoxNoMapClose)];
        EGVAR(tracking_main,controlTypes) pushBack [QGVAR(TextBoxNoMapCloseReadOnly),FUNC(initTextBoxNoMapClose)];

        [] call FUNC(initMap);
        if(!EGVAR(rft,active)) then {
            [] call MFUNC(initMap);
        };

        [localize "STR_BFT_CONFIGURE", { HAS_TABLET }, FUNC(actionConfigure)] call MFUNC(addAction);
    }
] call CBA_fnc_WaitUntilAndExecute;
