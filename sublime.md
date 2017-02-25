# My Sublime Text 3

Install:

	sudo add-apt-repository ppa:webupd8team/sublime-text-3 && sudo apt update && sudo apt install sublime-text-installer


## Settings

```
{
    "atomic_save": true,
    "auto_complete_commit_on_tab": true,
    "auto_complete_cycle": true,
    "auto_find_in_selection": true,
    "binary_file_patterns":
    [
        "node_modules/*",
        ".codeintel/*",
        ".tox/*",
        "htmlcov/*"
    ],
    "draw_centered": true,  // Maybe not...
    "folder_exclude_patterns":
    [
        ".git",
        ".cache",
        "__pycache__"
    ],
    "font_size": 11,
    "ignored_packages":
    [
        "Rust",
        "Vintage"
    ],
	"indent_guide_options":
	[
		"draw_normal",
		"draw_active"
	],
    "rulers":
    [
        80,
        100
    ],
    "shift_tab_unindent": true,
    "spell_check": true,
    // Disable auto-completion on pressing tab if there is no pop-up
    "tab_completion": false,
}
```

## Keymaps

Auto-complete using `\` to go down, and `Shift-\` to go up (and tab to select).

```
[
    // Navigation with tab in auto-complete pop-up
    { "keys": ["\\"], "command": "move", "args": {"by": "lines", "forward": true}, "context": [{ "key": "auto_complete_visible" }] },
    { "keys": ["|"], "command": "move", "args": {"by": "lines", "forward": false}, "context": [{ "key": "auto_complete_visible" }] },

    // Navigation with tab in overlay
    { "keys": ["\\"], "command": "move", "args": {"by": "lines", "forward": true}, "context": [{ "key": "overlay_visible", "operator": "equal", "operand": true } ] },
    { "keys": ["|"], "command": "move", "args": {"by": "lines", "forward": false}, "context": [{ "key": "overlay_visible", "operator": "equal", "operand": true } ] },

    // ctrl+space shows tab completion pop-up
    { "keys": ["ctrl+space"], "command": "auto_complete" },
]
```

## Packages

[Package Control](https://packagecontrol.io/installation):

**General**

- EditorConfig
  - See console for currently active config
- EditorConfigSnippets
- SideBarEnhancements
- Git
- BracketHighlighter

**Python**

- Anaconda
- Djaneiro

**Web**

- `Babel` - Modern JS (& .jsx) syntax highlighting
- SublimeLinter-jshint?
- JsFormat?
- DocBlockr?
- jQuery?
- Sass (Requires Ruby)
- SassBeautify (Requires Sass)

**Rust**

- RustEnhanced
  - Build features (ctrl+b), test features, *inline syntax highlight*
  - Be sure to disable the `Rust` package and to have `rustc` and `cargo` available on cmd
- RustAutoComplete
  - What it says on the tin.
  - Install and test [Racer](https://github.com/phildawes/racer)
  - *Goto Definition: F2*
- BeautifyRust
  - Autoformat on save
  - Install [Rustfmt](https://github.com/rust-lang-nursery/rustfmt) `cargo install rustfmt`
  - Set the package settings:
```
{
  "run_on_save": true,
  "show_errors": false,  // Annoying warning with e.g. syntax errors
}
```
- TOML
  - Syntax highlight `Cargo.toml` files

**Maybe**

- SublimeLinter - Used for other linters

### Sublime Anaconda setup

- Install. Note keyboard shortcuts:
    - `ctrl-alt-g` goto definition
    - `ctrl-alt-f` find usages
    - `ctrl-alt-d` show docs
    - Rename object under cursor (command search/right-click)
    - McCabe code complexity (command search/right-click)

- Set Up Anaconda settings `Preferences > Package Settings > Anaconda > Settings - User`

```
{
    "validate_imports": true,
    "pep8_ignore": ["E501"]
}
```

- Set Up `Preferences > Browse Packages > User (Folder) > Python.sublime-settings` with

```
{
    "auto_complete_triggers": [{"selector": "source.python - string - comment - constant.numeric", "characters": "."}]
}
```

- Set Up your virtualenv per project - `Project > Edit Project` with

```
{
	"settings":
	{
		"python_interpreter": "~/.virtualenvs/<venv>/bin/python"
	}
}
```

- Fix imports in some circumstances. Add a `.pth` file

```
    echo "~/projects/<name>" >> ~/.virtualenvs/<venv>/lib/python/site-packages/<name>.pth
```
