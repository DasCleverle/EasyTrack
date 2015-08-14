class RscControlsGroupNoHScrollbars;
class RscControlsGroupNoScrollbars;
class RscListbox;
class EGVAR(tracking_main,Background);
class EGVAR(tracking_main,LabelTooltip);
class EGVAR(tracking_main,Label);
class EGVAR(tracking_main,Button);
class EGVAR(tracking_main,TextBox);

class GVAR(TextBoxNoMapClose): EGVAR(tracking_main,TextBox) {
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
            text = $STR_BFT_LBL_TEXTUNIT;

            TOOLTIP_COL(0);
            TOOLTIP_ROW(0);
        };

        class lblTextCallsign: EGVAR(tracking_main,LabelTooltip) {
            text = $STR_BFT_LBL_TEXTCALLSIGN;

            TOOLTIP_COL(0);
            TOOLTIP_ROW(1);
        };

        class lblTextFrequency: EGVAR(tracking_main,LabelTooltip) {
            text = $STR_BFT_LBL_TEXTFREQUENCY;

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
    idc = IDC_LST_CONFIGURE;

    x = safeZoneX + (safeZoneW - CONFIG_WIDTH) / 2;
    y = safeZoneY + (safeZoneH - CONFIG_HEIGHT) / 2;
    w = CONFIG_WIDTH;
    h = CONFIG_HEIGHT;// + BASE_Y + BASE_H;

    class controls {
        class background: EGVAR(tracking_main,Background) {
            idc = -1;

            colorBackground[] = {COLOR_BLACK_TR50};

            x = 0;
            y = 0;
            w = CONFIG_WIDTH;
            h = CONFIG_HEIGHT;
        };

        class lstConfigure : RscListbox {
            idc = IDC_LST_CONFIGURE;

            colorBackground[] = {COLOR_TR};
            colorSelect2[] = {COLOR_WHITE};
            colorSelect[] = {COLOR_WHITE};
            colorText[] = {COLOR_WHITE};
            colorSelectBackground2[] = {COLOR_TR};
            colorSelectBackground[] = {COLOR_TR};
            period = 0;

            onLbSelChanged = _this call FUNC(lst_configureChanged);

            x = 0;
            y = 0;
            w = CONFIG_WIDTH;
            h = CONFIG_HEIGHT - BASE_Y - 4 * (BASE_Y + BASE_H);
        };

        class btnShowLeaders: EGVAR(tracking_main,Button) {
            idc = -1;

            text = $STR_BFT_BTN_SHOWLEADERS;
            onButtonClick = [_this,"leaders"] call FUNC(btn_changePlayers);

            x = BASE_X;
            y = CONFIG_HEIGHT - 4 * (BASE_Y + BASE_H);
            w = CONFIG_WIDTH - 2 * BASE_X;
            h = BASE_H;
        };

        class btnShowAll: EGVAR(tracking_main,Button) {
            idc = -1;

            text = $STR_BFT_BTN_SHOWALL;
            onButtonClick = [_this,"all"] call FUNC(btn_changePlayers);

            x = BASE_X;
            y = CONFIG_HEIGHT - 3 * (BASE_Y + BASE_H);
            w = CONFIG_WIDTH - 2 * BASE_X;
            h = BASE_H;
        };

        class btnAllSymbols: EGVAR(tracking_main,Button) {
            idc = -1;

            text = $STR_BFT_BTN_ALLSYMBOLS;
            onButtonClick = [_this,"all"] call FUNC(btn_changeSymbols);

            x = BASE_X;
            y = CONFIG_HEIGHT - 2 * (BASE_Y + BASE_H);
            w = 0.15 * (CONFIG_WIDTH - 2 * BASE_X);
            h = BASE_H;
        };

        class btnNoSymbols: EGVAR(tracking_main,Button) {
            idc = -1;

            text = $STR_BFT_BTN_NOSYMBOLS;
            onButtonClick = [_this,"none"] call FUNC(btn_changeSymbols);

            x = BASE_X + (0.5 * BASE_X + 0.15 * (CONFIG_WIDTH - 2 * BASE_X));
            y = CONFIG_HEIGHT - 2 * (BASE_Y + BASE_H);
            w = 0.15 * (CONFIG_WIDTH - 2 * BASE_X);
            h = BASE_H;
        };

        class btnToggleSymbols: EGVAR(tracking_main,Button) {
            idc = -1;

            text = $STR_BFT_BTN_TOGGLESYMBOLS;
            onButtonClick = [_this,"toggle"] call FUNC(btn_changeSymbols);

            x = BASE_X + 2 * (0.5 * BASE_X + 0.15 * (CONFIG_WIDTH - 2 * BASE_X));
            y = CONFIG_HEIGHT - 2 * (BASE_Y + BASE_H);
            w = 0.25 * (CONFIG_WIDTH - 2 * BASE_X);
            h = BASE_H;
        };

        class lblSymbols: EGVAR(tracking_main,Label) {
             idc = -1;

            text = $STR_BFT_LBL_SYMBOLS;

            x = BASE_X + 2 * (0.5 * BASE_X + 0.15 * (CONFIG_WIDTH - 2 * BASE_X)) + (0.5 * BASE_X + 0.25 * (CONFIG_WIDTH - 2 * BASE_X));
            y = CONFIG_HEIGHT - 2 * (BASE_Y + BASE_H);
            w = 0.5 * (CONFIG_WIDTH - 2 * BASE_X);
            h = BASE_H;
        };

        class btnHide: EGVAR(tracking_main,Button) {
            idc = -1;

            text = $STR_BFT_BTN_HIDE;
            onButtonClick = _this call FUNC(btn_configureHide);

            x = BASE_X;
            y = CONFIG_HEIGHT - 1 * (BASE_Y + BASE_H);
            w = CONFIG_WIDTH - 2 * BASE_X;
            h = BASE_H;
        };
    };
};