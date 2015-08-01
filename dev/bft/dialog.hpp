class RscControlsGroupNoHScrollbars;
class RscControlsGroupNoScrollbars;
class EGVAR(tracking_main,Background);
class EGVAR(tracking_main,LabelTooltip);
class EGVAR(tracking_main,Button);
class RscShortcutButton;

class RscButtonMenu : RscShortcutButton {
    class Attributes;
    class AttributesImage;
    class HitZone;
    class ShortcutPos;
    class TextPos;
};

class GVAR(ButtonCheck): RscButtonMenu {
    idc = -1;

    colorBackground[] = {COLOR_RED_TR};
    colorBackgroundActive[] = {COLOR_RED_TR};
    colorFocused[] = {COLOR_BLACK_TR25};

    period = 0;
    periodFocus = 0;
    periodOver = 0;

    style = 2;

    class Attributes : Attributes {
        font = "PuristaMedium";
    };
};

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
        class GVAR(grpConfigure): RscControlsGroupNoHScrollbars {
            idc = IDC_GRP_CONFIGURE;

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