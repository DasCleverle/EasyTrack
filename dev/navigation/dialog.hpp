class RscControlsGroupNoHScrollbars;
class RscControlsGroupNoScrollbars;
class RscListbox;
class EGVAR(tracking_main,Background);
class EGVAR(tracking_main,LabelTooltip);
class EGVAR(tracking_main,Label);
class EGVAR(tracking_main,Button);
class EGVAR(tracking_main,TextBox);

class GVAR(grpNavigation): RscControlsGroupNoHScrollbars {
    idc = IDC_GRP_BFT;

    x = safeZoneX;
    y = safeZoneY + 0.7 * safeZoneH;
    w = safeZoneW;
    h = 0.3 * safeZoneH;

    class controls {};
};