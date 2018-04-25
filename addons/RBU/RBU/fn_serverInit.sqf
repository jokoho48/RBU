#include "macros.hpp"
/*
    RBU

    Author: joko // Jonas

    Description:
    Description

    Parameter(s):
    0: Argument <Type>

    Returns:
    0: Return <Type>
*/
GVAR(areRunning) = 0;

private _fnc_addFiredEH = {
    (_this select 0) params ["_unit"];
    if (isPlayer _unit && _unit isKindOf "CAManBase") then {
        _unit addEventhandler ["FiredMan", {_this call FUNC(firedEH)}];
    };
};
["entityCreated", _fnc_addFiredEH] call CFUNC(addEventhandler);
