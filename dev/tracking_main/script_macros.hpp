#include "\x\cba\addons\main\script_macros_common.hpp"
#include "\x\cba\addons\xeh\script_xeh.hpp"

#include "ui_macros.hpp"

// Constants
#define MODULE_CATEGORY EGVAR(tracking_main,moduleCategory)

#define ICON_SIZE 40
#define ICON_SIZE_SIZE (ICON_SIZE * 1.2)
#define ICON_SIZE_DIR (ICON_SIZE * 4)
#define ICON_MIN_DISTANCE 0.0007

#define SIZE_BASE_SYS(var1) \a3\ui_f\data\map\Markers\NATO\group_##var1##.paa
#define SIZE_FIRETEAM   QUOTE(SIZE_BASE_SYS(0))
#define SIZE_UNIT       QUOTE(SIZE_BASE_SYS(1))
#define SIZE_SQUAD      QUOTE(SIZE_BASE_SYS(2))
#define SIZE_PLATOON    QUOTE(SIZE_BASE_SYS(3))

#define TABLET_ITEMS_SYS    "b_EasyTrack_Tablet", "o_EasyTrack_Tablet", "i_EasyTrack_Tablet"
#define PDA_ITEMS_SYS       "b_EasyTrack_PDA", "o_EasyTrack_PDA", "i_EasyTrack_PDA"
#define TRACKER_ITEMS_SYS   TABLET_ITEMS_SYS, PDA_ITEMS_SYS

#define TABLET_ITEMS    [TABLET_ITEMS_SYS]
#define PDA_ITEMS       [PDA_ITEMS_SYS]
#define TRACKER_ITEMS   [TRACKER_ITEMS_SYS]

#define UHAS_ITEMS(var1, var2) (count (var1 arrayIntersect (assignedItems var2) + (items var2)) > 0)
#define HAS_ITEMS(var1) UHAS_ITEMS(var1, player)

#define HAS_TRACKER     HAS_ITEMS(TRACKER_ITEMS)
#define HAS_TABLET      HAS_ITEMS(TABLET_ITEMS)
#define HAS_PDA         HAS_ITEMS(PDA_ITEMS)

#define UHAS_TRACKER(var1)     UHAS_ITEMS(TRACKER_ITEMS, var1)
#define UHAS_TABLET(var1)      UHAS_ITEMS(TABLET_ITEMS, var1)
#define UHAS_PDA(var1)         UHAS_ITEMS(PDA_ITEMS, var1)

// Functional macros
#undef QEGVAR
#define QEGVAR(var1,var2) QUOTE(EGVAR(var1,var2))
#define MFUNC(var1) EFUNC(MAINCOMPONENT,var1)

#define EDATAPATH(var1,var2) PATHTOF_SYS(PREFIX,var1,data\var2)
#define QEDATAPATH(var1,var2) QUOTE(EDATAPATH(var1,var2))
#define MAINDATAPATH(var1) EDATAPATH(tracking_main,var1)
#define QMAINDATAPATH(var1) QUOTE(MAINDATAPATH(var1))

#define DATAPATH(FILE) PATHTOF(data\FILE)
#define QDATAPATH(FILE) QUOTE(DATAPATH(FILE))
#define FUNCFILE(CLASS) PATHTOF(functions\CLASS)

#define X(var1) (var1 select 0)
#define Y(var1) (var1 select 1)

#define ICON_PATH(var1)     (var1 select 0)
#define ICON_COLOR(var1)    (var1 select 1)
#define ICON_POS(var1)      (var1 select 2)
#define ICON_SIZE_X(var1)   (var1 select 3)
#define ICON_SIZE_Y(var1)   (var1 select 4)
#define ICON_ANGLE(var1)    (var1 select 5)
#define ICON_TEXT(var1)     (var1 select 6)
#define ICON_SHADOW(var1)   (var1 select 7)
#define ICON_TEXTSIZE(var1) (var1 select 8)
#define ICON_ALIGN(var1)    (var1 select 9)

#define SET_ICON_PATH(var1, var2)     (var1 set [0, var2])
#define SET_ICON_COLOR(var1, var2)    (var1 set [1, var2])
#define SET_ICON_POS(var1, var2)      (var1 set [2, var2])
#define SET_ICON_SIZE_X(var1, var2)   (var1 set [3, var2])
#define SET_ICON_SIZE_Y(var1, var2)   (var1 set [4, var2])
#define SET_ICON_ANGLE(var1, var2)    (var1 set [5, var2])
#define SET_ICON_TEXT(var1, var2)     (var1 set [6, var2])
#define SET_ICON_SHADOW(var1, var2)   (var1 set [7, var2])
#define SET_ICON_TEXTSIZE(var1, var2) (var1 set [8, var2])
#define SET_ICON_ALIGN(var1, var2)    (var1 set [9, var2])

#define ELLIPSE_POS(var1)       (var1 select 0)
#define ELLIPSE_A(var1)         (var1 select 1)
#define ELLIPSE_B(var1)         (var1 select 2)
#define ELLIPSE_ANGLE(var1)     (var1 select 3)
#define ELLIPSE_COLOR(var1)     (var1 select 4)
#define ELLIPSE_FILL(var1)      (var1 select 5)

#define SET_ELLIPSE_POS(var1, var2)       (var1 set [0, var2])
#define SET_ELLIPSE_A(var1, var2)         (var1 set [1, var2])
#define SET_ELLIPSE_B(var1, var2)         (var1 set [2, var2])
#define SET_ELLIPSE_ANGLE(var1, var2)     (var1 set [3, var2])
#define SET_ELLIPSE_COLOR(var1, var2)     (var1 set [4, var2])
#define SET_ELLIPSE_FILL(var1, var2)      (var1 set [5, var2])

// COLORS
#define STRCOLOR_BASE_SYS "#(argb,8,8,3)color("
#define STRCOLOR_SYS(var1) STRCOLOR_BASE_SYS + var1 + ")"
#define COLOR_FLATTEN_SYS(R, B, G, A) R,B,G,A

#define STRCOLOR(var1) STRCOLOR_SYS(QUOTE(var1))
#define STRCOLOR_LONG(R, B, G, A) STRCOLOR(COLOR_FLATTEN_SYS(R, B, G, A))

#define COLOR_R(var1)   (var1 select 0)
#define COLOR_G(var1)   (var1 select 1)
#define COLOR_B(var1)   (var1 select 2)
#define COLOR_A(var1)   (var1 select 3)

#define SET_COLOR_R(var1, var2)   (var1 set [0, var2])
#define SET_COLOR_G(var1, var2)   (var1 set [1, var2])
#define SET_COLOR_B(var1, var2)   (var1 set [2, var2])
#define SET_COLOR_A(var1, var2)   (var1 set [3, var2])

#define COLOR_TR 0,0,0,0

#define COLOR_BLACK_TR25 0,0,0,0.25
#define COLOR_BLACK_TR50 0,0,0,0.5
#define COLOR_BLACK 0,0,0,1

#define COLOR_WHITE_TR25 1,1,1,0.25
#define COLOR_WHITE_TR50 1,1,1,0.5
#define COLOR_WHITE 1,1,1,1

#define COLOR_RED_TR 1,0,0,0.5
#define COLOR_RED 1,0,0,1

#define COLOR_GREEN 0,0.44,0,1
#define COLOR_GREEN_TR 0,0.44,0,0.5

#define COLOR_YELLOW 1,1,0,1

#define COLOR_GREY          0.5,0.5,0.5,1
#define COLOR_BLUFOR        0,0.3,0.6,1
#define COLOR_OPFOR         0.5,0,0,1
#define COLOR_INDEP         0,0.5,0,1
#define COLOR_CIVIL         0.4,0,0.5,1
