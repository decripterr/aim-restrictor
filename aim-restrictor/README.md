Advanced Combat Control System for FiveM
This script is an advanced combat control system for FiveM, designed to prevent unintended roll or jump actions while aiming, while allowing smooth and unrestricted running. It provides a better combat experience by reducing glitches and ensuring more immersive roleplay mechanics in combat situations.

Key Features
Block Jump and Roll: Disables the ability to jump or roll while the player is aiming with a weapon.

Running While Aiming: Allows the player to run (SHIFT) while aiming, ensuring movement is not interrupted.

Optimized Performance: Reduces server load by dynamically adjusting the wait time based on the player's state (idle, aiming, running, etc.).

Customizable: Easily modify the script to add more features, change control bindings, or adjust control restrictions.

Installation
Download or Clone this repository into your server’s resources folder.

Dependencies
QBCore Framework (Ensure QBCore is installed and functional for this script to work properly).

Controls
Jump (SPACE) and Roll (Q): Disabled while the player is aiming with a weapon.

Running (SHIFT): Remains functional and unaffected while aiming.

The script will automatically cancel any roll or jump animations when the player is in an aiming state.

Customization
You can easily modify the script to add or remove controls. For example:

To disable additional controls (e.g., crouch, melee), you can add them to the DisableControlAction function calls in the script.

Adjust wait times based on how fast you want the script to react, or to optimize performance on your server.

In your server.cfg, add the following: ensure combat-control-system
