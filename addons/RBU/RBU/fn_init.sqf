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
[QGVAR(sendAI), {
    (_this select 0) params ["_group", "_position"];
    [_group, [_position, GVAR(searchRad), GVAR(searchRad), 0, false], GVAR(aiMode), "AWARE", "FULL"] call CBA_fnc_taskSearchArea;
    [{
        _group setSpeedMode "FULL";
    }, 5] call CFUNC(wait);
}] call CFUNC(addEventhandler);

[QGVAR(resetAI), {
    (_this select 0) params ["_group", "_position"];
    [_group, _position, GVAR(searchRad), GVAR(waypointCount), "MOVE", "AWARE", "", GVAR(aiMode)] call CBA_fnc_taskPatrol;
}] call CFUNC(addEventhandler);

["missionStarted", {
    GVAR(hearing) = [CFGRBU(hearingDistance), 1000] call CFUNC(getSetting);
    GVAR(numberOfAi) = [CFGRBU(numberOfAi), 3] call CFUNC(getSetting);
    GVAR(waypointCount) = [CFGRBU(waypointsCount), 3] call CFUNC(getSetting);
    GVAR(searchRad) = [CFGRBU(searchRadius), 100] call CFUNC(getSetting);
    GVAR(aiMode) =  [CFGRBU(aiMode), "YELLOW"] call CFUNC(getSetting);
    if (GVAR(aiMode) == "" || !(GVAR(aiMode) in ["MOVE","DESTROY","GETIN","SAD","JOIN","LEADER","GETOUT","CYCLE","LOAD","UNLOAD","TR UNLOAD","HOLD","SENTRY","GUARD","TALK","SCRIPTED","SUPPORT","GETIN NEAREST","DISMISS","LOITER","AND","OR"])) then {
        GVAR(aiMode) = "YELLOW";
    };
    GVAR(walkCycles) = [CFGRBU(walkCycles), 300] call CFUNC(getSetting);
    GVAR(areRunningMax) = [CFGRBU(maxRunning), 3] call CFUNC(getSetting);
}] call CFUNC(addEventhandler);
