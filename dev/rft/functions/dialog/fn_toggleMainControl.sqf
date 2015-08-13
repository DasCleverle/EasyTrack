#include "script_component.hpp"

disableSerialization;

PARAMS_2(_control,_type);

private ["_mapDisplay", "_grpMain"];
_mapDisplay = DISPLAY(IDD_MAINMAP);
if(ctrlIDC _control == IDC_GRP_RFTREPORT) then {
    _grpMain = _control;
}
else {
    _grpMain = _mapDisplay displayCtrl IDC_GRP_RFTREPORT;
};

switch (toLower _type) do {
    case "show": {
        GVAR(selectedMarker) = GVAR(hoveredMarker);

        // set the selected direction button in main control
        private ["_dir", "_angle", "_dirString"];
        _dir = MARKER_GET_DIR(GVAR(selectedMarker));
        _angle = ICON_ANGLE(_dir);
        _pos = ICON_POS(_dir);
        _dirString = [_angle, _pos] call MFUNC(dirToString);
        [_dirString] call FUNC(dir_setSelected);

        // determine ellipse ctrl text
        [GVAR(selectedMarker)] call FUNC(ellipse_setText);

        _grpMain ctrlShow true;
        GVAR(mainControlsVisible) = true;

        if(EGVAR(bft,active) && {EGVAR(bft,mainControlsVisible)}) then {
            [_grpMain, "hide"] call EFUNC(bft,toggleMainControl);
        };
    };
    case "hide": {
        _grpMain ctrlShow false;
        GVAR(mainControlsVisible) = false;

        GVAR(selectedMarker) = nil;
    };
};
