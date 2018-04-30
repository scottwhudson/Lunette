# Lunette
### Spectacle Window Manager Keybindings For Hammerspoon
Lunette is an easily configurable and extendible Hammerspoon package that implements all of the Spectacle keybindings.

## Installation
1. Install Hammerspoon
2. Download the Lunette.zip file or clone this repository to your `/Spoons` directory
2. Load Lunette in your Hammerspoon `init.lua` file (usually `~/.hammerspoon/init.lua`):
    ```lua
    -- init.lua
    hs.loadSpoon("Lunette")
    ```
3. Bind the Lunette Hotkeys

    For the default Spectacle configuration, simply call `bindHotkeys()` without any arguments in `init.lua`:

    ```lua
    spoon.Lunette:bindHotkeys()
    ```

    To customize or disable specific keybindings, simply create a custom mapping table and pass it as an arg to `bindHotkeys()`.

    To customize keybindings, the mapping table keys must correspond to Lunette command names and their values must either be a two-element map containing either a chord map or single key in the first position, and an activation key in the second position.

    To disable a specific keybinding, set the value of the given command's key to `false`.
    ```lua
    -- example custom map with `leftHalf` and `rightHalf` reconfigured and the history commands disabled

    customBindings = {
      leftHalf = {{"Q", "W"}, "E"},
      rightHalf = {{"A", "S"}, "D"},
      undo = false,
      redo = false
    }

    spoon.Lunette:bindHotkeys(customBindings)
    ```

    Lunette Command Names:
    - `leftHalf`
    - `rightHalf`
    - `topHalf`
    - `bottomHalf`
    - `topLeft`
    - `topRight`
    - `bottomLeft`
    - `bottomRight`
    - `nextThird`
    - `prevThird`
    - `enlarge`
    - `shrink`
    - `fullScreen`
    - `center`
    - `nextScreen`
    - `prevScreen`
    - `undo`
    - `redo`
