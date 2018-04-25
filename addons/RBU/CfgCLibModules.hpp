#include "\tc\CLib\addons\CLib\ModuleMacros.hpp"

class CfgCLibModules {
    class BSO {
        path = "\tc\RBU\addons\RBU";
        dependency[] = {"CLib"};
        MODULE(RBU) {
            FNC(checkGroup);
            FNC(checkWeapon);
            FNC(firedEH);
            FNC(init);
            FNC(resetAI);
            FNC(sendAI);
            FNC(serverInit);
            FNC(waitForTime);
        };
    };
};
