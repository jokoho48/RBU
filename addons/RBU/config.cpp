#include "macros.hpp"
class CfgPatches {
    class RBU {
        units[] = {};
        weapons[] = {};
        requiredVersion = 1.82;
        author = "joko // Jonas";
        authors[] = {"joko // Jonas"};
        authorUrl = "https://twitter.com/joko48Ger";
        version = VERSION;
        versionStr = QUOTE(VERSION);
        versionAr[] = {VERSION_AR};
        requiredAddons[] = {"CLib"};
    };
};

#include "CfgCLibModules.hpp"

class CfgCLibSettings {
    rbu_cfg[] = {"CfgRBU"};
};

class CfgRBU {
    hearingDistance = 1000;
    numberOfAi = 3;
    waypointsCount = 3;
    searchRadius = 100;
    aiMode = "RED";
    walkCycles = 10;
    maxRunning = 3;
};
