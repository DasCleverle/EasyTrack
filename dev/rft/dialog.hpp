class RscControlsGroupNoHScrollbars;
class RscControlsGroupNoScrollbars;
class EGVAR(tracking_main,Label);
class EGVAR(tracking_main,Container);
class EGVAR(tracking_main,Background);
class EGVAR(tracking_main,LabelTooltip);

class GVAR(FavContainer) : EGVAR(tracking_main,Container) {};

class GVAR(grpReport): RscControlsGroupNoHScrollbars {
    idc = IDC_GRP_RFTREPORT;

    x = safeZoneX + safeZoneW - GUIMIN_3_2(1.2, 2);
    y = safeZoneY + 1.5 * GUIMIN_3_2(1.2, 25);
    w = GRP_WIDTH;
    h = GRP_HEIGHT;

    class controls {
        // Background
        /*class ctrlBackground: GVAR(Background) {
            idc = IDC_GRP_BACKGROUND;

            w = GRP_WIDTH;
            h = GRP_HEIGHT;

            colorBackground[] = {COLOR_BLACK_TR50};
        };*/
    };
};

class GVAR(grpMarkerTooltip) : RscControlsGroupNoScrollbars {
    idc = IDC_GRP_MARKERTOOLTIP;

    x = 0;
    y = 0;
    w = TOOLTIP_WIDTH;
    h = TOOLTIP_HEIGHT;

    class controls {
        class ctrlBackground : EGVAR(tracking_main,Background) {
            w = TOOLTIP_WIDTH;
            h = TOOLTIP_HEIGHT;

            colorBackground[] = {COLOR_BLACK_TR50};
        };

        class lblTextID: EGVAR(tracking_main,LabelTooltip) {
            text = "ID:";

            TOOLTIP_COL(0);
            TOOLTIP_ROW(0);
        };

        class lblTextAge: EGVAR(tracking_main,LabelTooltip) {
            text = "Last edited:";

            TOOLTIP_COL(0);
            TOOLTIP_ROW(1);
        };

        class lblTextCreator: EGVAR(tracking_main,LabelTooltip) {
            text = "Creator:";

            TOOLTIP_COL(0);
            TOOLTIP_ROW(2);
        };

        class lblID: EGVAR(tracking_main,LabelTooltip) {
            idc = IDC_LBL_ID;
            text = "-1";

            TOOLTIP_COL(1);
            TOOLTIP_ROW(0);

            w = 2.5 * TOOLTIP_COL_WIDTH;
        };

        class lblAge: EGVAR(tracking_main,LabelTooltip) {
            idc = IDC_LBL_AGE;
            text = "- undef. min";

            TOOLTIP_COL(1);
            TOOLTIP_ROW(1);

            w = 2.5 * TOOLTIP_COL_WIDTH;
        };

        class lblCreator: EGVAR(tracking_main,LabelTooltip) {
            idc = IDC_LBL_CREATOR;
            text = "John Doe";

            TOOLTIP_COL(1);
            TOOLTIP_ROW(2);

            w = 2.5 * TOOLTIP_COL_WIDTH;
        };
    };
};

/*class RscControlsGroupNoScrollbars;
class IGUIBack;
class RscText;
class RscStructuredText;
class RscButton;

class GVAR(Label): RscText {
    idc = -1;
    shadow = 0;
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
    colorText[] = {COLOR_TR};
    colorBackground[] = {COLOR_TR};
    colorBackgroundActive[] = {COLOR_WHITE_TR25};
    colorFocused[] = {COLOR_TR};
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
};*/