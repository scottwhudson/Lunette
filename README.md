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
1. Load Lunette in `~/.hammerspoon/init.lua` and bind the Lunette hotkeys:

    ```lua
    -- ~/.hammerspoon/init.lua
    hs.spoons.use("Lunette", { hotkeys = "default" })
    ```

    OPTIONAL:

    Override default hotkey definitions by passing a custom mapping table to `bindHotkeys()`

    ```lua
    -- ~/.hammerspoon/init.lua
    hs.loadSpoon("Lunette")

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
