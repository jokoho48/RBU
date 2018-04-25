#include "macros.hpp"
/*
    RBU

    Author: joko // Jonas

    Description:
    Fired EH that Do stuff


    Remarks:
    Only Execute On the Server

    Parameter(s):
    0: Argument <Type>

    Returns:
    0: Return <Type>
*/

params ["_group", "_position", "_targetedUnits"];

// Send now the AI!
[{
    [QGVAR(sendAI), _this] call CFUNC(globalEvent);
}, 1, [_group, _position]] call CFUNC(wait);

GVAR(areRunning) = GVAR(areRunning) + 1;

// Add perFrame EH
[_group, _targetedUnits] call FUNC(waitForTime);
_group setVariable [QGVAR(areRunning), true, true];
[{
    params ["_grp"];
    _grp setSpeedMode "FULL";
}, _group] call CFUNC(execNextFrame);
