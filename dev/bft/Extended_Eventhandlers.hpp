class Extended_Put_Eventhandlers {
    class Man {
        class GVAR(putTracker) {
            put = _this call FUNC(xeh_handlePut);
        };
    };
};

class Extended_Take_Eventhandlers {
    class Man {
        class GVAR(takeTracker) {
            take = _this call FUNC(xeh_handleTake);
        };
    };
};