#include "script_component.hpp"

PARAMS_1(_control);

_control ctrlAddEventHandler ["SetFocus", { GVAR(txtFocused) = _this; }];

_this call MFUNC(initTextBox);