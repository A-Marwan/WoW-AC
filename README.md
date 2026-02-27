# CombatLock Addon

This is a simple World of Warcraft addon that locks the mouse cursor when you enter combat and releases it when you leave.

## Installation

1. **Download or clone** this repository.
2. **Copy** the `WoW-AC` folder (or unzipped contents) into your World of Warcraft `Interface\AddOns` directory.  For example:
   ```sh
   cp -r WoW-AC "~/World of Warcraft/_retail_/Interface/AddOns/"
   ```
   (adjust the path for your WoW installation and the folder name if you renamed it)
3. Ensure the folder contains `CombatLock.toc` and `wac.lua`.
4. Launch WoW or reload the UI (`/reload`) if already running.
5. Enable the addon from the character select `AddOns` screen if necessary.

## Usage

* By default the addon starts **enabled** and will automatically call `MouselookStart()` when you enter combat, and `MouselookStop()` when you exit.
* You can toggle the behaviour at any time using the slash command:
  ```
  /mlock
  ```
  A message will display in chat indicating whether the addon is now Enabled or Disabled.
* The enabled/disabled state **persists between sessions**. Your preference is saved automatically.

## Development

- Source code is in `wac.lua`.
- The `.toc` file declares a saved variable (`CombatLockDB`) used to store the enabled state.
- To modify, edit the Lua file and reload the UI (`/reload` in game) to see changes.

Enjoy! Feel free to fork and extend as needed.