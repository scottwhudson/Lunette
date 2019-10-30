# Lunette

> Spectacle Window Manager Keybindings For Hammerspoon

Lunette is an easily configurable and extendible Hammerspoon package that implements all of the Spectacle keybindings.

## Default Keybindings

Lunette comes with a set of default keybindings. See installation for more on altering and disabling default keybindings.

| CommandName  | (Chord) Activator |
| -------------|:-------------------:|
| `center`     | (⌥ ⌘) C          |
| `fullScreen` | (⌥ ⌘) F          |
| `leftHalf`   | (⌥ ⌘) ←          |
| `rightHalf`  | (⌥ ⌘) →          |
| `topHalf`    | (⌥ ⌘) ↑          |
| `bottomHalf` | (⌥ ⌘) ↓          |
| `topLeft`    | (⌃ ⌘) ←          |
| `bottomLeft` | (⌃ ⌘ ⇧) ←       |
| `topRight`   | (⌃ ⌘) →          |
| `bottomRight`| (⌃ ⌘ ⇧) →       |
| `nextDisplay`| (⌃ ⌥ ⌘) →       |
| `prevDisplay`| (⌃ ⌥ ⌘) ←       |
| `nextThird`  | (⌃ ⌥) →       |
| `prevThird`  | (⌃ ⌥) ←       |
| `enlarge`    | (⌃ ⌥ ⇧) →       |
| `shrink`     | (⌃ ⌥ ⇧) ←       |
| `undo`       | (⌥ ⌘) Z          |
| `redo`       | (⌥ ⌘ ⇧) Z       |

## Installation

1. Download and Install [Hammerspoon](https://github.com/Hammerspoon/hammerspoon/releases)
1. Download and unzip `Lunette.spoon.zip` to `~/.hammerspoon/Spoons/` or clone this repository and symlink `Lunette.spoon` to `~/.hammerspoon/Spoons`
1. Make sure you've enabled Hammerspoon with MacOS via System Preferences > Security & Privacy
1. Load Lunette in `~/.hammerspoon/init.lua`

    ```lua
    -- ~/.hammerspoon/init.lua
    hs.loadSpoon("Lunette")
    ```

1. Bind the Lunette Hotkeys

    For the default Spectacle configuration, simply call `bindHotkeys()` without any arguments in `init.lua`:

    ```lua
    -- ~/.hammerspoon/init.lua
    spoon.Lunette:bindHotkeys()
    ```

    To customize or disable specific keybindings, simply create a custom mapping table and pass it as an arg to `bindHotkeys()`.

    To customize keybindings, the mapping table keys must correspond to Lunette command names (see keybindings above) and their values must either be a two-element map containing either a chord map or single key in the first position, and an activation key in the second position.

    To disable a specific keybinding, set the value of the given command's key to `false`.

    ```lua
    -- example custom map with `leftHalf` and `rightHalf` reconfigured and the history commands disabled
    -- you can have multiple bindings to run a command, as shown in leftHalf

    customBindings = {
      leftHalf = {
        {{"Q", "W"}, "E"},
        {{"cmd", "alt"}, "left"},
      },
      rightHalf = {
        {{"A", "S"}, "D"},
      },
      undo = false,
      redo = false
    }

    spoon.Lunette:bindHotkeys(customBindings)
    ```

## Contribution

Feel free to submit an issue/feature request/pull request.

## Changelog

## v0.3.1
Bugfix:
* fix installation error introduced in v0.3 (@jasperzs)

### v0.3
New features:
* exposing the window resizer API outside of Lunette (@jokajak)
* adding SpoonInstaller/Make config (@jokajak)

### v0.2
Minor bugfixes and improvements:
* use integer division instead of `math.floor` (@shayneholmes)
* fix issue with stuck bottom corner calculations (@shayneholmes)
* permit multiple mappings per keybinding (@davidosomething)
* add gitignore
* add release checklist

### v0.1-beta
Initial Release
