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
params["_group", "_targetedUnits"];

//DUMP("Walktime is over, group will be destroyed!");


private _units = units _group;


private _oldGroup = _group getVariable [QGVAR(oldGroup), grpNull];
_oldGroup setVariable [QGVAR(haveRunner), false, true];
//Create a new group
if (isNull _oldGroup || {{alive _x} count (units _oldGroup) == 0}) then {
    // Send AI back
    // Later task send them back on there original track
    private _position = _group getVariable [QGVAR(oldPosition), getPos (leader _group)];

    [{
        [QGVAR(resetAI), _this] call CFUNC(globalEvent);
    }, 1, [_group, _position]] call CFUNC(wait);

} else {
    _units joinSilent _oldGroup; // reattach Group to Original Group
};

GVAR(areRunning) = GVAR(areRunning) - 1;

{
    _x setVariable [QGVAR(isTargeted), false, true];
    nil
} count _targetedUnits;
