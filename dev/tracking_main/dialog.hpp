class RscText;
class RscButton;
class RscEdit;
class IGUIBack;
class RscListBox;
class RscControlsGroupNoScrollbars;
class RscControlsGroupNoHScrollbars;

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

class GVAR(grpActions): RscControlsGroupNoHScrollbars {
    idc = IDC_GRP_ACTIONS;

    x = safeZoneX + safeZoneW - 24 * GUIMIN_2(1.2, 40) - 7 * GUIMIN_2(1.2, 40);
    y = safeZoneY + 1.51 * GUIMIN_3_2(1.2, 25);
    w = 7 * GUIMIN_2(1.2, 40);
    h = 4/3 * 7 * GUIMIN_2(1.2, 40);

    class controls {
        class background: GVAR(Background) {
            x = 0;
            y = 0;
            w = 7 * GUIMIN_2(1.2, 40);
            h = 4/3 * 7 * GUIMIN_2(1.2, 40);

            colorBackground[] = {COLOR_BLACK_TR50};
        };

        class lstActions: RscListBox {
            idc = IDC_LST_ACTIONS;

            x = 0;
            y = 0;
            w = 7 * GUIMIN_2(1.2, 40);
            h = 4/3 * 7 * GUIMIN_2(1.2, 40);

            sizeEx = FONTSIZE;

            onLbSelChanged = _this call FUNC(lst_execAction);

            colorBackground[] = {COLOR_TR};
            colorSelect2[] = {COLOR_WHITE};
            colorSelect[] = {COLOR_WHITE};
            colorText[] = {COLOR_WHITE};
            colorSelectBackground2[] = {COLOR_TR};
            colorSelectBackground[] = {COLOR_TR};
            period = 0;
        };
    };
};