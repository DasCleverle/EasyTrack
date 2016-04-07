#include "ui_macros.hpp"

#define NAVICON_SIZE 30

#define NEW_NAVICON [NAVICON_ICON_DEFAULT]

#define NAVICON_GET_ICON(var1) (var1 select 0)

#define NAVICON_SET_ICON(var1, var2) (var1 set [0, var2])

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