#include "script_component.hpp"

GVAR(active) = true;

if (hasInterface) then {[] call FUNC(initClient)};

// Common init
GVAR(symbols) = [
    [QMAINDATAPATH(symbols\inf.paa),             LLSTRING(INF),                { [QMAINDATAPATH(symbols\inf.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\motinf.paa),          LLSTRING(MOTINF),      { [QMAINDATAPATH(symbols\motinf.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\mechinf.paa),         LLSTRING(MECHINF),     { [QMAINDATAPATH(symbols\mechinf.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\recon.paa),           LLSTRING(RECON),                   { [QMAINDATAPATH(symbols\recon.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\hq.paa),              LLSTRING(HQ),                      { [QMAINDATAPATH(symbols\hq.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\armor.paa),           LLSTRING(ARMOR),                   { [QMAINDATAPATH(symbols\armor.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\artillery.paa),       LLSTRING(ARTILLERY),               { [QMAINDATAPATH(symbols\artillery.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\heli.paa),            LLSTRING(HELI),                    { [QMAINDATAPATH(symbols\heli.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\jet.paa),             LLSTRING(JET),                     { [QMAINDATAPATH(symbols\jet.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\logistics.paa),       LLSTRING(LOGISTICS),               { [QMAINDATAPATH(symbols\logistics.paa)] call FUNC(setSymbol); }],
    [QMAINDATAPATH(symbols\medical.paa),         LLSTRING(MEDICAL),                 { [QMAINDATAPATH(symbols\medical.paa)] call FUNC(setSymbol); }]
];

GVAR(sizes) = [
    [QMAINDATAPATH(sizes\fireteam.paa),         LLSTRING(FIRETEAM),                { [SIZE_FIRETEAM] call FUNC(setSize); }],
    [QMAINDATAPATH(sizes\unit.paa),             LLSTRING(UNIT),             { [SIZE_UNIT] call FUNC(setSize); }],
    [QMAINDATAPATH(sizes\squad.paa),            LLSTRING(SQUAD),                    { [SIZE_SQUAD] call FUNC(setSize); }],
    [QMAINDATAPATH(sizes\platoon.paa),          LLSTRING(PLATOON),                  { [SIZE_PLATOON] call FUNC(setSize); }]
];

GVAR(mainControls) = [
    [QEGVAR(main,LabelHeading),        [LLSTRING(BFTNAME)]],
    [QEGVAR(main,Button),              [LLSTRING(CENTERONICON), FUNC(btn_centerOnIcon)]],
    [QEGVAR(main,Label),               [LLSTRING(UNITRO), false]],
    [QGVAR(TextBoxNoMapCloseReadOnly),          [], "txtPlayerName"],
    [QEGVAR(main,Label),               [LLSTRING(CALLSIGN), false]],
    [QGVAR(TextBoxNoMapClose),                  [], "txtCallsign"],
    [QEGVAR(main,Label),               [LLSTRING(FREQUENCY), false]],
    [QGVAR(TextBoxNoMapClose),                  [], "txtFrequency"],
    [QEGVAR(main,Container),           ["symbols", GVAR(symbols), 6]],
    [QEGVAR(main,Container),           ["sizes",   GVAR(sizes),   4]]
];

GVAR(configureVisible) = false;
GVAR(configureUnits) = allPlayers;
GVAR(mapInitialized) = false;

[
    {!isNil QEGVAR(main,controlTypes)},
    {
        EGVAR(main,controlTypes) pushBack [QGVAR(TextBoxNoMapClose),FUNC(initTextBoxNoMapClose)];
        EGVAR(main,controlTypes) pushBack [QGVAR(TextBoxNoMapCloseReadOnly),FUNC(initTextBoxNoMapClose)];

        [] call FUNC(initMap);
        if(!EGVAR(rft,active)) then {
            [] call MFUNC(initMap);
        };

        [LLSTRING(CONFIGURE), { HAS_TABLET }, FUNC(actionConfigure)] call MFUNC(addAction);
    }
] call CBA_fnc_WaitUntilAndExecute;
