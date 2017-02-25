# My Sublime Text 3

Install:

	sudo add-apt-repository ppa:webupd8team/sublime-text-3 && sudo apt update && sudo apt install sublime-text-installer


## Settings

```
{
    "atomic_save": true,
    "auto_complete_commit_on_tab": true,
    "auto_complete_cycle": true,
    "binary_file_patterns":
    [
        "node_modules/*",
        ".codeintel/*",
        ".tox/*",
        "htmlcov/*"
    ],
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
    "rulers":
    [
        80,
        100
    ],
    "shift_tab_unindent": true
}
```

## Keymaps

Auto-complete using `\` to go down, and `Shift-\` to go up (and tab to select).

```
[
	// navigation with tab in autocomplete popup
	{ "keys": ["\\"], "command": "move", "args": {"by": "lines", "forward": true}, "context": [{ "key": "auto_complete_visible" }] },
	{ "keys": ["|"], "command": "move", "args": {"by": "lines", "forward": false}, "context": [{ "key": "auto_complete_visible" }] },

	// navigation with tab in overlay
	{ "keys": ["\\"], "command": "move", "args": {"by": "lines", "forward": true}, "context": [{ "key": "overlay_visible", "operator": "equal", "operand": true } ] },
	{ "keys": ["|"], "command": "move", "args": {"by": "lines", "forward": false}, "context": [{ "key": "overlay_visible", "operator": "equal", "operand": true } ] }
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

- RustEnhance
  - Be sure to disable the `Rust` package and to have `rustc` and `cargo` available on cmd
- TOML

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
