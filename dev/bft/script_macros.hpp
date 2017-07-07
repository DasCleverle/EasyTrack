#include "ui_macros.hpp"

// Constants
#define MODULE_BFT GVAR(module)
#define MODULE_BFT_ASSIGN GVAR(moduleAssign)

#define NEW_MARKER [player, localize "STR_BFT_CALLSIGN_DEFAULT", localize "STR_BFT_FREQUENCY_DEFAULT", ICON_DEFAULT, ICON_SIZE_DEFAULT]

#define MARKER_GET_UNIT(var1)           (var1 select 0)
#define MARKER_GET_CALLSIGN(var1)       (var1 select 1)
#define MARKER_GET_FREQUENCY(var1)      (var1 select 2)
#define MARKER_GET_ICON(var1)           (var1 select 3)
#define MARKER_GET_SIZE(var1)           (var1 select 4)

#define MARKER_SET_UNIT(var1, var2)           (var1 set [0, var2])
#define MARKER_SET_CALLSIGN(var1, var2)       (var1 set [1, var2])
#define MARKER_SET_FREQUENCY(var1, var2)      (var1 set [2, var2])
#define MARKER_SET_ICON(var1, var2)           (var1 set [3, var2])
#define MARKER_SET_SIZE(var1, var2)           (var1 set [4, var2])

#define ICON_DEFAULT [ \
    QMAINDATAPATH(symbols\inf.paa), \
    [side player] call FUNC(getSideColor), \
    [0,0], \
    ICON_SIZE, \
    ICON_SIZE, \
    0, \
    "", \
    1, \
    0, \
    "PuristaMedium", \
    "right" \
]

#define ICON_SIZE_DEFAULT [ \
    SIZE_UNIT, \
    [COLOR_BLACK], \
    [0, 0], \
    ICON_SIZE_SIZE, \
    ICON_SIZE_SIZE, \
    0, \
    "", \
    1, \
    0, \
    "PuristaMedium", \
    "right" \
]
