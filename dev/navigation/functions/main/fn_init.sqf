#include "script_component.hpp"


GVAR(icons) = [
    [QMAINDATAPATH(symbols\unknown.paa), localize "STR_RFT_UNKNOWN", {  }],
    [QMAINDATAPATH(symbols\inf.paa), localize "STR_RFT_INF", {  }],
    [QMAINDATAPATH(symbols\motinf.paa), localize "STR_RFT_MOTINF", {  }],
    [QMAINDATAPATH(symbols\mechinf.paa), localize "STR_RFT_MECHINF", {  }],
    [QMAINDATAPATH(symbols\recon.paa), localize "STR_RFT_RECON", {  }],
    [QMAINDATAPATH(symbols\hq.paa), localize "STR_RFT_HQ", {  }],
    [QMAINDATAPATH(symbols\armor.paa), localize "STR_RFT_ARMOR", {  }],
    [QMAINDATAPATH(symbols\artillery.paa), localize "STR_RFT_ARTILLERY", {  }],
    [QMAINDATAPATH(symbols\heli.paa), localize "STR_RFT_HELI", {  }],
    [QMAINDATAPATH(symbols\jet.paa), localize "STR_RFT_JET", {  }],
    [QMAINDATAPATH(symbols\uav.paa), localize "STR_RFT_UAV", {  }],
    [QMAINDATAPATH(symbols\logistics.paa), localize "STR_RFT_LOGISTICS", {  }],
    [QMAINDATAPATH(symbols\medical.paa), localize "STR_RFT_MEDICAL", {  }],
    [QMAINDATAPATH(symbols\static.paa), localize "STR_RFT_STATIC", {  }]
];


GVAR(mainControls) = [
    [QEGVAR(tracking_main,Container),      ["icons", GVAR(icons),     6]],
    [QEGVAR(tracking_main,Container),      ["test", GVAR(icons),     3]]
];

call FUNC(initMap);

systemChat "init";