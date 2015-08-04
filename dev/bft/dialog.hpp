class RscControlsGroupNoHScrollbars;
class RscControlsGroupNoScrollbars;
class RscListbox;
class EGVAR(tracking_main,Background);
class EGVAR(tracking_main,LabelTooltip);
class EGVAR(tracking_main,Button);

class GVAR(grpBft): RscControlsGroupNoHScrollbars {
    idc = IDC_GRP_BFT;

    x = safeZoneX + safeZoneW - GUIMIN_3_2(1.2, 2);
    y = safeZoneY + 1.5 * GUIMIN_3_2(1.2, 25);
    w = GRP_WIDTH;
    h = GRP_HEIGHT;
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

        class lblTextUnit: EGVAR(tracking_main,LabelTooltip) {
            text = "Unit:";

            TOOLTIP_COL(0);
            TOOLTIP_ROW(0);
        };

        class lblTextCallsign: EGVAR(tracking_main,LabelTooltip) {
            text = "Callsign:";

            TOOLTIP_COL(0);
            TOOLTIP_ROW(1);
        };

        class lblTextFrequency: EGVAR(tracking_main,LabelTooltip) {
            text = "Frequency:";

            TOOLTIP_COL(0);
            TOOLTIP_ROW(2);
        };

        class lblUnit: EGVAR(tracking_main,LabelTooltip) {
            idc = IDC_LBL_UNIT;
            text = "John Doe";

            TOOLTIP_COL(1);
            TOOLTIP_ROW(0);

            w = 2.5 * TOOLTIP_COL_WIDTH;
        };

        class lblCallsign: EGVAR(tracking_main,LabelTooltip) {
            idc = IDC_LBL_CALLSIGN;
            text = "John Doe's Squad";

            TOOLTIP_COL(1);
            TOOLTIP_ROW(1);

            w = 2.5 * TOOLTIP_COL_WIDTH;
        };

        class lblFrequency: EGVAR(tracking_main,LabelTooltip) {
            idc = IDC_LBL_FREQUENCY;
            text = "John Doe's Frequency";

            TOOLTIP_COL(1);
            TOOLTIP_ROW(2);

            w = 2.5 * TOOLTIP_COL_WIDTH;
        };
    };
};

class GVAR(grpConfigureContainer): RscControlsGroupNoScrollbars {
    idc = IDC_GRP_CONFIGURE;

    x = safeZoneX + (safeZoneW - CONFIG_WIDTH) / 2;
    y = safeZoneY + (safeZoneH - CONFIG_HEIGHT) / 2;
    w = CONFIG_WIDTH;
    h = CONFIG_HEIGHT + BASE_Y + BASE_H;

    class controls {
        class lstConfigure : RscListbox {
            idc = IDC_LST_CONFIGURE;

            colorBackground[] = {COLOR_BLACK_TR25};
            colorSelect2[] = {COLOR_WHITE};
            colorSelect[] = {COLOR_WHITE};
            colorText[] = {COLOR_WHITE};
            colorSelectBackground2[] = {COLOR_TR};
            colorSelectBackground[] = {COLOR_TR};
            period = 0;

            onLbSelChanged = _this spawn FUNC(lst_configureChanged);

            x = 0;
            y = 0;
            w = CONFIG_WIDTH;
            h = CONFIG_HEIGHT;
        };

        class btnHide: EGVAR(tracking_main,Button) {
            idc = IDC_BTN_CONFIGURE_HIDE;

            text = "Close";
            onButtonClick = _this spawn FUNC(btn_configureHide);

            x = 0.25 * CONFIG_WIDTH;
            y = 0.5 * BASE_Y + CONFIG_HEIGHT;
            w = 0.5 * CONFIG_WIDTH;
            h = BASE_H;
        };
    };
};