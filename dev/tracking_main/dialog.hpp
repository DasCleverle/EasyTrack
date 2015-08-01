class RscText;
class RscButton;
class RscEdit;
class IGUIBack;
class RscControlsGroupNoScrollbars;

class GVAR(Label): RscText {
    idc = -1;
    //shadow = 0;
    sizeEx = FONTSIZE;
    style = 528;

    DIM(1, 1);

    colorText[] = {COLOR_WHITE};
};

class GVAR(LabelHeading): GVAR(Label) {
    sizeEx = 1.5 * FONTSIZE;
    DIM(1, 1.5 * 0.8);
};

class GVAR(LabelTooltip): GVAR(Label) {
    sizeEx = TOOLTIP_FONTSIZE;

    TOOLTIP_COL(0);
    TOOLTIP_ROW(0);
    w = TOOLTIP_COL_WIDTH;
    h = TOOLTIP_ROW_HEIGHT;
};

class GVAR(Button): RscButton {
    idc = -1;
    sizeEx = FONTSIZE;

    DIM(1,1);
};

class GVAR(ButtonInvisble): GVAR(Button) {
    colorText[] = {COLOR_WHITE};
    colorBackground[] = {COLOR_TR};
    colorBackgroundActive[] = {COLOR_WHITE_TR25};
    colorFocused[] = {COLOR_TR};
};

class GVAR(TextBox): RscEdit {
    idc = -1;
    sizeEx = FONTSIZE;

    colorBackground[] = {COLOR_BLACK_TR25};

    DIM(1,1);
};

class GVAR(Background): IGUIBack {
    idc = -1;

    x = 0;
    y = 0;
    DIM(1, 1);

    colorBackground[] = {COLOR_BLACK_TR25};
};

class GVAR(Container): RscControlsGroupNoScrollbars {
    idc = -1;
};