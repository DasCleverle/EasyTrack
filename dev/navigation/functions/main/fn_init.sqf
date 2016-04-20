#include "script_component.hpp"

GVAR(iconsControls) = [
    [QDATAPATH(icons\ambush.paa), "Ambush", { [QDATAPATH(icons\ambush.paa)] call FUNC(createNavIcon) }],
    [QDATAPATH(icons\arrow.paa), "Arrow", { [QDATAPATH(icons\arrow.paa)] call FUNC(createNavIcon)  }],
    [QDATAPATH(icons\arrow2.paa), "Arrow", { [QDATAPATH(icons\arrow2.paa)] call FUNC(createNavIcon) }],
    [QDATAPATH(icons\destroy.paa), "Destroy", { [QDATAPATH(icons\destroy.paa)] call FUNC(createNavIcon) }],
    [QDATAPATH(icons\dot.paa), "Dot", { [QDATAPATH(icons\dot.paa)] call FUNC(createNavIcon) }],
    [QDATAPATH(icons\end.paa), "End", { [QDATAPATH(icons\end.paa)] call FUNC(createNavIcon) }],
    [QDATAPATH(icons\flag.paa), "Flag", { [QDATAPATH(icons\flag.paa)] call FUNC(createNavIcon) }],
    [QDATAPATH(icons\join.paa), "Join", { [QDATAPATH(icons\join.paa)] call FUNC(createNavIcon) }],
    [QDATAPATH(icons\marker.paa), "Marker", { [QDATAPATH(icons\marker.paa)] call FUNC(createNavIcon) }],
    [QDATAPATH(icons\objective.paa), "Objective", { [QDATAPATH(icons\objective.paa)] call FUNC(createNavIcon) }],
    [QDATAPATH(icons\pickup.paa), "Pickup", { [QDATAPATH(icons\pickup.paa)] call FUNC(createNavIcon) }],
    [QDATAPATH(icons\start.paa), "Start", { [QDATAPATH(icons\start.paa)] call FUNC(createNavIcon) }],
    [QDATAPATH(icons\warning.paa), "Warning", { [QDATAPATH(icons\warning.paa)] call FUNC(createNavIcon) }]
];

GVAR(linesControls) = [
    [QDATAPATH(lines\line_thin.paa), "Thin Line", { [THICKNESS_THIN] call FUNC(startLineDraw); }],
    [QDATAPATH(lines\line_middle.paa), "Middle Line", { [THICKNESS_MIDDLE] call FUNC(startLineDraw); }],
    [QDATAPATH(lines\line_thick.paa), "Thick Line", { [THICKNESS_THICK] call FUNC(startLineDraw); }],
    [QDATAPATH(lines\line_free.paa), "Free Line", {}],
    [QDATAPATH(lines\line_middle.paa), "Default Line", { LINE_SET_TYPE(GVAR(selectedLine), "default") }],
    [QDATAPATH(lines\line_dotted.paa), "Dotted Line", { LINE_SET_TYPE(GVAR(selectedLine), "dotted") }],
    [QDATAPATH(lines\line_dashed.paa), "Dashed Line", { LINE_SET_TYPE(GVAR(selectedLine), "dashed") }],
    [QDATAPATH(lines\arrow.paa), "Arrow", { LINE_SET_TYPE(GVAR(selectedLine), "arrow") }]
];


GVAR(mainControls) = [
    [QEGVAR(tracking_main,Container),      ["icons", GVAR(iconsControls),     5, 0.75 * BASE_W]],
    [QEGVAR(tracking_main,Container),      ["lines", GVAR(linesControls),     4, 0.6 * BASE_W]]
];

GVAR(navIconId) = 1;
GVAR(navIcons) = [];
GVAR(mapInitialized) = false;
GVAR(ctrlPressed) = false;
GVAR(altPressed) = false;

GVAR(lineDrawStarted) = false;
GVAR(lineStarted) = false;
GVAR(lines) = [];
GVAR(lineId) = 1;

call FUNC(initMap);