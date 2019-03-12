# My Sublime Text 3

Install:

	sudo add-apt-repository ppa:webupd8team/sublime-text-3 && sudo apt update && sudo apt install sublime-text-installer


## Settings

```
{
    "added_words":
    [
        "virtualenv",
        "fallback",
        "datetime"
    ],
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
    "dictionary": "Packages/Language - English/en_GB.dic",
    // "dpi_scale": 2,
    "folder_exclude_patterns":
    [
        ".git",
        ".cache",
        "__pycache__",
	".idea",
	".sass-cache"20px
    ],
    "font_face": "Fira Code",
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
- Git
- BracketHighlighter
- Indent XML (Ctrl-K,F) (Also does JSON)
- ColorPicker (Ctrl-Shift-C)
- Color Highlighter
- A File Icon
- Terminal (Ctrl-Shift-T, or Ctrl-Shift-Alt-T)
- TOML reddit

**Vintage**

- Enable in the config above
- In Sublime package settings `~/.config/sublime-text-3/Vintage/Preferences.sublime-settings`:

```
{
    "vintage_use_clipboard": true
}
```

**Python**

- Anaconda - Like flake8 (pycodestyle PEP8; PEP257 (TODO: Enable?); PyFlakes; McCabe)
    - `ctrl-alt-g` goto definition
    - `ctrl-alt-f` find usages
    - `ctrl-alt-d` show docs
    - `ctrl-alt-r` auto-pep8
    - Rename object under cursor (command search/right-click)
    - McCabe code complexity (command search/right-click)
    - **Per project setup** - create a `.anaconda file` in project root
```
{
    "python_interpreter": "~/.virtualenvs/<venv>/bin/python"
}
```
    - **Per project setup** - Edit Project:
```
    "settings":
    {
        "pep8_max_line_length": 100
        // "pep8_ignore": []
        // Set up Vagrantfile: shared port, shared folder:
	// -> config.vm.synced_folder '~/.config/sublime-text-3/Packages/Anaconda', '/anaconda'
        // "python_interpreter": "tcp://localhost:19360?network=forwarded&interpreter=~/.virtualenvs/<venv>/bin/python&shared=/anaconda&pathmap=/home/test/code/<project>,/vagrant/<project>"
	}
    }
```
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

**Maybe**

- SublimeLinter - Used for other linters

### Sublime Anaconda setup

- Set Up Anaconda settings `Preferences > Package Settings > Anaconda > Settings - User`

```
{
    "anaconda_linter_phantoms": true,
    "anaconda_linter_persistent": true,
    "anaconda_linting_behaviour": "load-save",  // TODO: Check out atomic save above problems??
    "auto_python_builder_enabled": false,  // Not used by me; can cause problems
    "validate_imports": true,
    "suppress_word_completions": true,  // Ignore Sublime's auto-complete
    "suppress_explicit_completions": true,  // Ignore Sublime's auto-complete
    "pep8_ignore": ["E241", "E242", "W503"],
}
```

- Set up keymaps `Preferences > Browse Packages > User (Folder) > Python.sublime-settings`

```
{
    "auto_complete_triggers": [{"selector": "source.python - string - comment - constant.numeric", "characters": "."}]
}
```
