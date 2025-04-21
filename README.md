# aim-restrictor
Key Features Added:
Enhanced Control Blocking: The system now prevents the player from jumping or rolling while aiming, even in states where they are barely aiming. This is crucial to prevent unintended movements during combat.

Idle Aiming Control: If the player is in idle aiming (even if they're barely aiming), the script will clear any jumping or rolling attempts to avoid breaking immersion.

Running and Rolling Conflict: When the player is running, rolling actions are now blocked. This prevents a player from accidentally rolling while running, providing more controlled and deliberate movement in combat.

Optimized Performance: Wait times are dynamically adjusted based on the player’s actions, reducing unnecessary CPU load when idle or non-combat states.

What Was Changed?
The following changes were made to better manage player actions during combat:

Improved Block on Roll and Jump Animations: Even during barely aiming or when running, jump and roll animations are now properly blocked and cleared.

Enhanced Control Disabling: Added additional DisableControlAction calls to block unwanted actions like sprint, stealth, melee, and dodge when the player is armed.

Task Clearing During Aiming: If the player is jumping, falling, or in ragdoll state while aiming, those tasks are immediately cleared to prevent undesired behavior.

Improved Wait Timing: Adjusted the waitTime dynamically for more efficient performance, allowing faster reactions during combat while maintaining lower CPU usage when idle.
