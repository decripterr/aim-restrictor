Enhanced Control Handling and Aiming Script


Description:

This update improves control handling when the player is aiming while armed. It prevents certain actions like jumping, rolling, and sprinting when the player is aiming or in a combat situation. Additionally, the script ensures that these actions are blocked even when barely aiming or when performing roll-like animations. This helps maintain a smoother roleplay experience and prevents unwanted glitches.

Features:
Aiming and Armed Control Blocking: Disables unnecessary actions such as jumping, rolling, sprinting, and melee attacks when aiming with a weapon.

Animation-based Blocking: Blocks roll-like animations and ensures that the player cannot perform roll or jump actions during aiming or combat.

Wait Time Optimization: Adjusts wait time based on player status (armed, aiming, in vehicle, etc.), improving overall script performance and responsiveness.

In-air Action Prevention: Immediately cancels any jump, fall, or roll attempts if the player is in mid-air, ensuring smoother animations and avoiding glitches.

Combat State Control: When in combat or aiming, actions like jumping and rolling are properly blocked, ensuring that the player remains in an appropriate stance.

Changes:
Added checks for jumping and falling: The script now detects if the player is jumping, falling, or ragdolling, and immediately cancels these actions if they’re aiming or armed.

Roll and Sprint Blocking: Players cannot roll or sprint while aiming, as these actions conflict with the aiming and combat states.

Improved Animation Dictionary Checking: The utility function for checking animations has been updated to detect roll-related animations and ensure they are cleared immediately during combat or aiming.

Optimized Wait Times: The script adjusts wait times dynamically depending on whether the player is armed or aiming, improving performance.
