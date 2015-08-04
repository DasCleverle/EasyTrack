#include "ui_macros.hpp"

// Constants
#define MODULE_RFT GVAR(module)

// Marker Data access
#define NEW_MARKER(var1, var2, var3) [var1, var2, ICON_DIR_DEFAULT, ELLIPSE_DEFAULT, true, time, name player, -1, var3]

#define GET_MARKER(var1) (missionNamespace getVariable (QGVAR(marker_) + str var1))
#define SET_MARKER(var1, var2) (missionNamespace setVariable [QGVAR(marker_) + str var1, var2])

#define MARKER_GET_ICON(var1)               (var1 select 0)
#define MARKER_GET_SIZE(var1)               (var1 select 1)
#define MARKER_GET_DIR(var1)                (var1 select 2)
#define MARKER_GET_ELLIPSE(var1)            (var1 select 3)
#define MARKER_GET_CHANGED(var1)            (var1 select 4)
#define MARKER_GET_TIME(var1)               (var1 select 5)
#define MARKER_GET_PLAYER(var1)             (var1 select 6)
#define MARKER_GET_ID(var1)                 (var1 select 7)
#define MARKER_GET_SIDE(var1)               (var1 select 8)

#define MARKER_SET_ICON(var1, var2)               (var1 set [0, var2]); MARKER_SET_CHANGED(var1, true)
#define MARKER_SET_SIZE(var1, var2)               (var1 set [1, var2]); MARKER_SET_CHANGED(var1, true)
#define MARKER_SET_DIR(var1, var2)                (var1 set [2, var2]); MARKER_SET_CHANGED(var1, true)
#define MARKER_SET_ELLIPSE(var1, var2)            (var1 set [3, var2]); MARKER_SET_CHANGED(var1, true)
#define MARKER_SET_CHANGED(var1, var2)            (var1 set [4, var2])
#define MARKER_SET_TIME(var1, var2)               (var1 set [5, var2])
#define MARKER_SET_PLAYER(var1, var2)             (var1 set [6, var2])
#define MARKER_SET_ID(var1, var2)                 (var1 set [7, var2])
#define MARKER_SET_SIDE(var1, var2)               (var1 set [8, var2])

#define FAV_ICON(var1)  (var1 select 0)
#define FAV_SIZE(var1)  (var1 select 1)
#define FAV_COLOR(var1) (var1 select 2)

#define SET_FAV_ICON(var1, var2)  (var1 set [0, var2])
#define SET_FAV_SIZE(var1, var2)  (var1 set [1, var2])
#define SET_FAV_COLOR(var1, var2) (var1 set [2, var2])

// Default values
#define ICON_DEFAULT [ \
    QMAINDATAPATH(symbols\unknown.paa), \
    [COLOR_GREY], \
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

#define ICON_DIR_DEFAULT [ \
    QDATAPATH(direction.paa), \
    [COLOR_GREY], \
    [-1], \
    ICON_SIZE_DIR, \
    ICON_SIZE_DIR, \
    0, \
    "", \
    1, \
    0, \
    "PuristaMedium", \
    "right" \
]

#define ELLIPSE_DEFAULT [ \
    [-1], \
    150, \
    150, \
    0, \
    [COLOR_GREY], \
    STRCOLOR(COLOR_GREY) \
]

#define ELLIPSE_CATCH [ \
    [0, 0], \
    50, \
    50, \
    0, \
    [COLOR_BLACK], \
    "" \
]