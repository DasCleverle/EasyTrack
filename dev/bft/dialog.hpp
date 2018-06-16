class RscControlsGroupNoHScrollbars;
class RscControlsGroupNoScrollbars;
class RscListbox;
class EGVAR(main,Background);
class EGVAR(main,LabelTooltip);
class EGVAR(main,Label);
class EGVAR(main,Button);
class EGVAR(main,TextBox);

class GVAR(TextBoxNoMapClose): EGVAR(main,TextBox) {
};

class GVAR(TextBoxNoMapCloseReadOnly): GVAR(TextBoxNoMapClose) {
    canModify = 0;
};

class GVAR(grpBft): RscControlsGroupNoHScrollbars {
    idc = IDC_GRP_BFT;

    x = QUOTE(safeZoneX + safeZoneW - GUIMIN_3_2(1.2, 2));
    y = QUOTE(safeZoneY + 1.5 * GUIMIN_3_2(1.2, 25));
    w = QUOTE(GRP_WIDTH);
    h = QUOTE(GRP_HEIGHT);
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

        class lblTextUnit: EGVAR(main,LabelTooltip) {
            text = "$STR_BFT_LBL_TEXTUNIT";

            TOOLTIP_COL(0);
            TOOLTIP_ROW(0);
        };

        class lblTextCallsign: EGVAR(main,LabelTooltip) {
            text = "$STR_BFT_LBL_TEXTCALLSIGN";

            TOOLTIP_COL(0);
            TOOLTIP_ROW(1);
        };

        class lblTextFrequency: EGVAR(main,LabelTooltip) {
            text = "$STR_BFT_LBL_TEXTFREQUENCY";

            TOOLTIP_COL(0);
            TOOLTIP_ROW(2);
        };

        class lblUnit: EGVAR(main,LabelTooltip) {
            idc = IDC_LBL_UNIT;
            text = "John Doe";

            TOOLTIP_COL(1);
            TOOLTIP_ROW(0);

            w = QUOTE(2.5 * TOOLTIP_COL_WIDTH);
        };

        class lblCallsign: EGVAR(main,LabelTooltip) {
            idc = IDC_LBL_CALLSIGN;
            text = "John Doe's Squad";

            TOOLTIP_COL(1);
            TOOLTIP_ROW(1);

            w = QUOTE(2.5 * TOOLTIP_COL_WIDTH);
        };

        class lblFrequency: EGVAR(main,LabelTooltip) {
            idc = IDC_LBL_FREQUENCY;
            text = "John Doe's Frequency";

            TOOLTIP_COL(1);
            TOOLTIP_ROW(2);

            w = QUOTE(2.5 * TOOLTIP_COL_WIDTH);
        };
    };
};

class GVAR(grpConfigureContainer): RscControlsGroupNoScrollbars {
    idc = IDC_LST_CONFIGURE;

    x = QUOTE(safeZoneX + (safeZoneW - CONFIG_WIDTH) / 2);
    y = QUOTE(safeZoneY + (safeZoneH - (2 * GUIMIN_3_2(1.2,2))) / 2);
    w = QUOTE(CONFIG_WIDTH);
    h = QUOTE((2 * GUIMIN_3_2(1.2,2)));// + BASE_Y + BASE_H;

    class controls {
        class background: EGVAR(main,Background) {
            idc = -1;

            colorBackground[] = {COLOR_BLACK_TR50};

            x = 0;
            y = 0;
            w = QUOTE(CONFIG_WIDTH);
            h = QUOTE(2 * GUIMIN_3_2(1.2,2));
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

            onLbSelChanged = QUOTE(_this call FUNC(lst_configureChanged));

            x = 0;
            y = 0;
            w = QUOTE(CONFIG_WIDTH);
            h = QUOTE((2 * GUIMIN_3_2(1.2,2)) - BASE_Y - 4 * (BASE_Y + BASE_H));
        };

        class btnShowLeaders: EGVAR(main,Button) {
            idc = -1;

            text = "$STR_BFT_BTN_SHOWLEADERS";
            onButtonClick = QUOTE([ARR_2(_this, #leaders)] call FUNC(btn_changePlayers));

            x = QUOTE(BASE_X);
            y = QUOTE((2 * GUIMIN_3_2(1.2,2)) - 4 * (BASE_Y + BASE_H));
            w = QUOTE(CONFIG_WIDTH - 2 * BASE_X);
            h = QUOTE(BASE_H);
        };

        class btnShowAll: EGVAR(main,Button) {
            idc = -1;

            text = "$STR_BFT_BTN_SHOWALL";
            onButtonClick = QUOTE([ARR_2(_this, #all)] call FUNC(btn_changePlayers));

            x = QUOTE(BASE_X);
            y = QUOTE((2 * GUIMIN_3_2(1.2,2)) - 3 * (BASE_Y + BASE_H));
            w = QUOTE(CONFIG_WIDTH - 2 * BASE_X);
            h = QUOTE(BASE_H);
        };

        class btnAllSymbols: EGVAR(main,Button) {
            idc = -1;

            text = "$STR_BFT_BTN_ALLSYMBOLS";
            onButtonClick = QUOTE([ARR_2(_this, #all)] call FUNC(btn_changeSymbols));

            x = QUOTE(BASE_X);
            y = QUOTE((2 * GUIMIN_3_2(1.2,2)) - 2 * (BASE_Y + BASE_H));
            w = QUOTE(0.15 * (CONFIG_WIDTH - 2 * BASE_X));
            h = QUOTE(BASE_H);
        };

        class btnNoSymbols: EGVAR(main,Button) {
            idc = -1;

            text = "$STR_BFT_BTN_NOSYMBOLS";
            onButtonClick = QUOTE([ARR_2(_this, #none)] call FUNC(btn_changeSymbols));

            x = QUOTE(BASE_X + (0.5 * BASE_X + 0.15 * (CONFIG_WIDTH - 2 * BASE_X)));
            y = QUOTE((2 * GUIMIN_3_2(1.2,2)) - 2 * (BASE_Y + BASE_H));
            w = QUOTE(0.15 * (CONFIG_WIDTH - 2 * BASE_X));
            h = QUOTE(BASE_H);
        };

        class btnToggleSymbols: EGVAR(main,Button) {
            idc = -1;

            text = "$STR_BFT_BTN_TOGGLESYMBOLS";
            onButtonClick = QUOTE([ARR_2(_this, #toggle)] call FUNC(btn_changeSymbols));

            x = QUOTE(BASE_X + 2 * (0.5 * BASE_X + 0.15 * (CONFIG_WIDTH - 2 * BASE_X)));
            y = QUOTE((2 * GUIMIN_3_2(1.2,2)) - 2 * (BASE_Y + BASE_H));
            w = QUOTE(0.25 * (CONFIG_WIDTH - 2 * BASE_X));
            h = QUOTE(BASE_H);
        };

        class lblSymbols: EGVAR(main,Label) {
             idc = -1;

            text = "$STR_BFT_LBL_SYMBOLS";

            x = QUOTE(BASE_X + 2 * (0.5 * BASE_X + 0.15 * (CONFIG_WIDTH - 2 * BASE_X)) + (0.5 * BASE_X + 0.25 * (CONFIG_WIDTH - 2 * BASE_X)));
            y = QUOTE((2 * GUIMIN_3_2(1.2,2)) - 2 * (BASE_Y + BASE_H));
            w = QUOTE(0.5 * (CONFIG_WIDTH - 2 * BASE_X));
            h = QUOTE(BASE_H);
        };

        class btnHide: EGVAR(main,Button) {
            idc = -1;

            text = "$STR_BFT_BTN_HIDE";
            onButtonClick = QUOTE(_this call FUNC(btn_configureHide));

            x = QUOTE(BASE_X);
            y = QUOTE((2 * GUIMIN_3_2(1.2,2)) - 1 * (BASE_Y + BASE_H));
            w = QUOTE(CONFIG_WIDTH - 2 * BASE_X);
            h = QUOTE(BASE_H);
        };
    };
};
