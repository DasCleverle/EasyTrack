#include "script_component.hpp"

disableSerialization;
private ["_mapDisplay", "_grpMain", "_pos", "_icon", "_size", "_marker"];




if(!_ctrlState || {_mouseButton != 0} || {!HAS_TRACKER}) exitWith {};

// wait until the vanialla create marker display opens
// and close it right away




[{
    if (isNull(findDisplay 54)) exitWith {};
    params ["_args", "_idPFH"];
    params ["_mapControl", "_mouseButton", "_mouseX", "_mouseY", "_shiftState", "_ctrlState"];
    (findDisplay 54) closeDisplay 2;

    // Show the main control if it it was invisble
    [_mapControl, "show"] call FUNC(toggleMainControl);

    //remove PFH
    [_idPFH] call CBA_fnc_removePerFrameHandler;
    // create a new marker
    _marker = [_mapControl, "new"] call FUNC(createMarker);
    [_marker] call FUNC(ellipse_setText);

}, 0.5, _this] call CBA_fnc_addPerFrameHandler;
