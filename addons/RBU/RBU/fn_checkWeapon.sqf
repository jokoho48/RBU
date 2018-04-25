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

params [
    "_unit",
    "_weapon",
    "_muzzle"
];

if ((vehicle _unit) != _unit) exitWith { 1 };
if (_weapon == "") exitWith { 1 };
if (_weapon != _muzzle) exitWith { 1 };


private _supp = switch (_weapon) do {
    case (handgunWeapon _unit): {
        (handgunItems _unit) select 0;
    };
    case (primaryWeapon _unit): {
        (primaryWeaponItems _unit) select 0;
    };
    case (secondaryWeapon _unit): {
        (secondaryWeaponItems _unit) select 0;
    };
    default { 1 breakOut SCRIPTSCOPENAME; };
};

private _cfg = (configFile >> "CfgWeapons" >> _supp >> "ItemInfo" >> "AmmoCoef");
private _audibleFire = [(_cfg >> "audibleFire"), 1, true] call CFUNC(getConfigDataCached);
private _audibleFireTime = [(_cfg >> "audibleFireTime"), 1, true] call CFUNC(getConfigDataCached);

private _audibleData = _audibleFire / _audibleFireTime;

//DUMP("AF: " + str _audibleFire + " AFT: " + str _audibleFireTime + "AD: " + str _audibleData);

_audibleData
