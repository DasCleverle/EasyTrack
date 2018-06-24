#include "script_component.hpp"

// For backwards compatibility, run init by module, but only if it hasn't run before in preInit.
if (!GVAR(active)) then call FUNC(init);
