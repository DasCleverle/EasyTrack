#include "ui_macros.hpp"

#define NAVICON_SIZE 40

#define NEW_NAVICON [-1, NAVICON_ICON_DEFAULT]

#define NAVICON_GET_ID(var1) (var1 select 0)
#define NAVICON_GET_ICON(var1) (var1 select 1)

#define NAVICON_SET_ID(var1, var2) (var1 set [0, var2])
#define NAVICON_SET_ICON(var1, var2) (var1 set [1, var2])

#define NAVICON_ICON_DEFAULT [ \
    QDATAPATH(icons\dot.paa), \
    [COLOR_BLACK], \
    [0,0], \
    NAVICON_SIZE, \
    NAVICON_SIZE, \
    0, \
    "", \
    1, \
    0, \
    "RobotoCondensed", \
    "right" \
]

#define THICKNESS_THIN 10
#define THICKNESS_MIDDLE 20
#define THICKNESS_THICK 35

#define LINE_DISTANCE_FACTOR 4

#define NEW_LINE [-1, LINE_RECT_DEFAULT, "default", [0,0,0], [0,0,0]]

#define LINE_GET_ID(var1) (var1 select 0)
#define LINE_GET_RECT(var1) (var1 select 1)
#define LINE_GET_TYPE(var1) (var1 select 2)
#define LINE_GET_START(var1) (var1 select 3)
#define LINE_GET_END(var1) (var1 select 4)

#define LINE_SET_ID(var1, var2) (var1 set [0, var2])
#define LINE_SET_RECT(var1, var2) (var1 set [1, var2])
#define LINE_SET_TYPE(var1, var2) (var1 set [2, var2])
#define LINE_SET_START(var1, var2) (var1 set [3, var2])
#define LINE_SET_END(var1, var2) (var1 set [4, var2])

#define LINE_RECT_DEFAULT [ \
    [0,0,0], \
    THICKNESS_MIDDLE, \
    100, \
    0, \
    [COLOR_BLACK], \
    STRCOLOR(COLOR_BLACK) \
]

#define LINE_ELLIPSE [ \
    [0, 0], \
    50, \
    50, \
    0, \
    [COLOR_BLACK], \
    "" \
]