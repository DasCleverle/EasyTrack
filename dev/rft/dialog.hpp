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
            text = $STR_RFT_LBL_TEXTID;

            TOOLTIP_COL(0);
            TOOLTIP_ROW(0);
        };

        class lblTextAge: EGVAR(tracking_main,LabelTooltip) {
            text = $STR_RFT_LBL_TEXTAGE;

            TOOLTIP_COL(0);
            TOOLTIP_ROW(1);
        };

        class lblTextCreator: EGVAR(tracking_main,LabelTooltip) {
            text = $STR_RFT_LBL_TEXTCREATOR;

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
