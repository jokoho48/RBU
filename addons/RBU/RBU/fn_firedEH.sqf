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

if (GVAR(areRunning) == GVAR(areRunningMax)) exitWith {};

//Get all needed vars
params ["_unit", "_weapon", "_muzzle", "", "", "", "", ""];

if !(isPlayer _unit) exitWith {};
if (toLower(_weapon) in ["put", "take"]) exitWith {};
if (_unit getVariable [QGVAR(isTargeted), false]) exitWith {};

private _hearingCoef = [_unit, _weapon, _muzzle] call FUNC(checkWeapon);
private _hearing = (GVAR(hearing) * _hearingCoef);

private _posUnit = getPos _unit;

//DUMP("RBU will check now if we hear something");
//DUMP("Used player is " + (name _unit));
//DUMP("Hearing is " + str _hearing);


private _groups = [];

//DUMP("Now we sending troops!");

//Loop to allGroups and select the nearest one
{
    if (
        !isNull _x &&
        {{alive _x} count (units _x) != 0} &&
        {!(_x getVariable [QGVAR(areRunning), false])} &&
        {!(_x getVariable [QGVAR(haveRunner), false])} &&
        {_x getVariable [QGVAR(allowed), true]} &&
        {isNull ((leader _x) findNearestEnemy (leader _x))}
    ) then {
        if ({isPlayer _x} count (units _x) != 0) exitWith {};
        private _leader = leader _x;

        //Check now if they can hear the shoot
        private _result = _posUnit distance (getPos _leader);
        //DUMP("Distance Result: " + str _result);
        if (_result < _hearing) then {

            //Check if we can use this group
            if ([side _unit, side _leader] call BIS_fnc_sideIsEnemy) then {
                _groups pushBack [_result, _x];
            };
        };
    };
    nil
} count allGroups;

_groups sort true;

//DUMP("Group count: " + str _groups);

if !(_groups isEqualTo []) then {
    private _playerClose = [_unit];
    {
        if ((_x distance _posUnit) < 100) then {
            _playerClose pushback _x;
            _x setVariable [QGVAR(isTargeted), true, true];
        };
        nil
    } count allPlayers;
    private _group = _groups call FUNC(checkGroup);
    [_group, (getPos _unit), _playerClose] call FUNC(sendAI);
    //DUMP("We found a group of heros! Lets do this!");
};
