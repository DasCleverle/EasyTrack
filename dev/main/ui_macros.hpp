// IDCs and IDDs

#define IDD_MAINMAP 12
#define IDC_MAINMAP 51

#define IDC_BTN_ACTIONS 16700
#define IDC_GRP_ACTIONS 16701
#define IDC_LST_ACTIONS 16702

// Functional Macros
#define GUIMIN_1(var1)                  GUIMIN_2(var1,var1)
#define GUIMIN_2(var1,var2)            (((safezoneW / safezoneH) min var1) / var2)
#define GUIMIN_3(var1,var2,var3)      (GUIMIN_2(var1,var2) / var3)
#define GUIMIN_3_2(var1,var2)          GUIMIN_3(var1,var1,var2)

// Position
#define POS(NUM) \
    x = QUOTE(BASE_X); \
    y = QUOTE((NUM) * (BASE_H + BASE_Y))

// Dimensions
#define DIM(WIDTH,HEIGHT) \
    w = QUOTE((WIDTH) * BASE_W); \
    h = QUOTE((HEIGHT) * BASE_H + ((HEIGHT - 1) * BASE_Y))

// Size == Pos + Dim
#define SIZE(Y,W,H) \
    POS(Y); \
    DIM(W, H)

#define YPOS(NUM) (NUM) * (BASE_H + BASE_Y)

// Constants
#define GRP_WIDTH (GUIMIN_3_2(1.2,2))
#define GRP_HEIGHT (safeZoneH - 1.5 * GUIMIN_3_2(1.2,25))

#define BASE_X (GUIMIN_3_2(1.2,50))
#define BASE_Y (BASE_X * 4/3)
#define BASE_W (GRP_WIDTH - 2 * BASE_X)
#define BASE_H (GRP_HEIGHT / 35)

#define CONTAINER_BASE_X (BASE_X * 0.7)
#define CONTAINER_BASE_Y (BASE_Y * 0.7)
#define CONTAINER_BASE_H (BASE_H * 1.3)

#define PADDING_X (CONTAINER_BASE_X * 0.5)
#define PADDING_Y (CONTAINER_BASE_Y * 0.5)

#define FONTSIZE (BASE_H * 0.8)

#define TOOLTIP_WIDTH       GUIMIN_3_2(1.2,3)
#define TOOLTIP_HEIGHT      (3 * TOOLTIP_ROW_HEIGHT)

#define TOOLTIP_COL_WIDTH   (TOOLTIP_WIDTH / 2.6)
#define TOOLTIP_ROW_HEIGHT  GUIMIN_3_2(1.2,25)

#define TOOLTIP_FONTSIZE (TOOLTIP_ROW_HEIGHT * 0.8)

#define TOOLTIP_COL(X) x = QUOTE(X * TOOLTIP_COL_WIDTH)
#define TOOLTIP_ROW(Y) y = QUOTE(Y * TOOLTIP_ROW_HEIGHT)
