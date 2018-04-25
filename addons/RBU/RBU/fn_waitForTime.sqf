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
params["_group", "_targetedUnits", ["_count", 0]];

[{
    params ["_group", "_count", "_targetedUnits"];

    private _alivecount = {alive _x} count (units _group);

    if (_alivecount == 0) exitWith {
        GVAR(areRunning) = GVAR(areRunning) - 1;
        (_group getVariable [QGVAR(oldGroup), grpNull]) setVariable [QGVAR(haveRunner), false, true];
        {
            _x setVariable [QGVAR(isTargeted), false, true];
            nil
        } count _targetedUnits;
    };

    if (_count >= GVAR(walkTime)) exitWith {
        [_group, _targetedUnits] call FUNC(resetAI);
    };

    _count = _count + 1;

    [_group, _targetedUnits, _count] call FUNC(waitForTime);
}, 10, [_group, _count, _targetedUnits]] call CFUNC(wait);
