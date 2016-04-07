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


GVAR(mainControls) = [
    [QEGVAR(tracking_main,Container),      ["icons", GVAR(iconsControls),     5]]
];

GVAR(navIcons) = [];
GVAR(mapInitialized) = false;
GVAR(ctrlPressed) = false;
GVAR(altPressed) = false;

call FUNC(initMap);