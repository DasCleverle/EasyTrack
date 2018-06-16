class RscControlsGroupNoHScrollbars;
class RscControlsGroupNoScrollbars;
class EGVAR(main,Label);
class EGVAR(main,Container);
class EGVAR(main,Background);
class EGVAR(main,LabelTooltip);

class GVAR(FavContainer) : EGVAR(main,Container) {};

class GVAR(grpReport): RscControlsGroupNoHScrollbars {
    idc = IDC_GRP_RFTREPORT;

    x = QUOTE(safeZoneX + safeZoneW - GUIMIN_3_2(1.2, 2));
    y = QUOTE(safeZoneY + 1.5 * GUIMIN_3_2(1.2, 25));
    w = QUOTE(GRP_WIDTH);
    h = QUOTE(GRP_HEIGHT);

    class controls {};
};

class GVAR(grpMarkerTooltip) : RscControlsGroupNoScrollbars {
    idc = IDC_GRP_MARKERTOOLTIP;

    x = 0;
    y = 0;
    w = QUOTE(TOOLTIP_WIDTH);
    h = QUOTE(TOOLTIP_HEIGHT);

    class controls {
        class ctrlBackground : EGVAR(main,Background) {
            w = QUOTE(TOOLTIP_WIDTH);
            h = QUOTE(TOOLTIP_HEIGHT);

            colorBackground[] = {COLOR_BLACK_TR50};
        };

        class lblTextID: EGVAR(main,LabelTooltip) {
            text = "$STR_RFT_LBL_TEXTID";

            TOOLTIP_COL(0);
            TOOLTIP_ROW(0);
        };

        class lblTextAge: EGVAR(main,LabelTooltip) {
            text = "$STR_RFT_LBL_TEXTAGE";

            TOOLTIP_COL(0);
            TOOLTIP_ROW(1);
        };

        class lblTextCreator: EGVAR(main,LabelTooltip) {
            text = "$STR_RFT_LBL_TEXTCREATOR";

            TOOLTIP_COL(0);
            TOOLTIP_ROW(2);
        };

        class lblID: EGVAR(main,LabelTooltip) {
            idc = IDC_LBL_ID;
            text = "-1";

            TOOLTIP_COL(1);
            TOOLTIP_ROW(0);

            w = QUOTE(2.5 * TOOLTIP_COL_WIDTH);
        };

        class lblAge: EGVAR(main,LabelTooltip) {
            idc = IDC_LBL_AGE;
            text = "- undef. min";

            TOOLTIP_COL(1);
            TOOLTIP_ROW(1);

            w = QUOTE(2.5 * TOOLTIP_COL_WIDTH);
        };

        class lblCreator: EGVAR(main,LabelTooltip) {
            idc = IDC_LBL_CREATOR;
            text = "John Doe";

            TOOLTIP_COL(1);
            TOOLTIP_ROW(2);

            w = QUOTE(2.5 * TOOLTIP_COL_WIDTH);
        };
    };
};
