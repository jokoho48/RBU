# RBU - Runs by Us
RBU is a small AI mod that makes the AI react to Shoots in the distance.
When the AI hears a shoot it sends out a small part group the investigate.

## Settings
```cpp
class CfgRBU {
    hearingDistance = 1000; // Distance base of what the AI reacts
    numberOfAi = 3; // Max number of AI that get split of the main group
    waypointsCount = 3; // Max Number of way Points the Split of Units will take
    searchRadius = 100; // Search Radius around the Estimated Shoot Position
    aiMode = "YELLOW"; // AI Mode that the Split up AI group get sets on
    walkCycles = 10; // Walk Cycles that the AI Takes. Each walk Cycle is 10 secs long.
    maxRunning = 3; // Max Number of AI groups on a Map that split of
};
```

## Credits
Flaver for the Original Idea.
