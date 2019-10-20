# My Sublime Text 3

Installation (add repository to package manager): <https://www.sublimetext.com/docs/3/linux_repositories.html>

## Per-Project Settings

### Python

- **Anaconda**:
    - **Project settings** Project > Edit Project:
        ```
        {
            "settings":
            {
	    	// Disable pycodestyle when using sublack (Black)
		"pep8": false
                // "pep8_max_line_length": 88
                // "pep8_ignore": []
                // Vagrant
                // "python_interpreter": "~/.cache/pypoetry/virtualenvs/project-py3.7/bin/python",
                // "python_interpreter": "tcp://localhost:19360?network=forwarded&interpreter=~/.virtualenvs/<venv>/bin/python&shared=/anaconda&pathmap=/home/test/code/<project>,/vagrant/<project>"
                // Generic
                // "python_interpreter": "tcp://172.16.3.2:19361?pathmap=/home/qasim/Projects/<project>,/project"
            }
        }
        ```
    - Alternatively specify interpreter with a `.anaconda` file in the project root:
        ```
        {
            "python_interpreter": "~/.virtualenvs/<venv>/bin/python"
        }
        ```

    - VM/Container Bash Function:
        ```
        function minserver {
            pkill -e -f /anaconda/anaconda_server/minserver.py;
            (nohup /PROJECT/venv/bin/python -B /anaconda/anaconda_server/minserver.py -p PROJECT -e /PROJECT/prix-core 19361 > /dev/null &);
        }

    - Mount Anaconda Folder:
        ```
        config.vm.synced_folder '~/.config/sublime-text-3/Packages/Anaconda', '/anaconda', type: 'nfs'
        ```

- **sublack**:
    - **Project settings** Project > Edit Project:
        ```
        {
            "settings":
            {
                "sublack.black_on_save": true
            }
        }
        ```


## One-Time Settings

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
        "venv/*",
        "node_modules/*",
        ".tox/*",
        "htmlcov/*",
        ".codeintel/*"
    ],
    "dictionary": "Packages/User/English (British).dic",
    // "dpi_scale": 2,
    "folder_exclude_patterns":
    [
        ".git",
        ".cache",
        "__pycache__",
        ".pytest_cache",
        ".sass-cache",
        ".idea",
        ".allure"
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
    // Replaced by BracketHighlighter extension
    "match_brackets": false,
    "match_brackets_angle": false,
    "match_brackets_braces": false,
    "match_brackets_content": false,
    "match_brackets_square": false,
    "match_tags": false,
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

Download the three dictionary files from <https://github.com/titoBouzout/Dictionaries/> and save it into Preferences > Browse Packages.

### Keymaps

Auto-complete using `\` to go down, and `Shift-\` to go up (and tab to select).

Preferences > Key Bindings.

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

### Snippets

Tools > Developer > New Snippet > "ipdb.sublime-snippet"

```
<snippet>
  <description>ipdb.set_trace()</description>
  <content><![CDATA[
__import__("ipdb").set_trace()  # FIXME
]]></content>
  <!-- Optional: Set a tabTrigger to define how to trigger the snippet -->
  <tabTrigger>ipdb</tabTrigger>
  <!-- Optional: Set a scope to limit where the snippet will trigger -->
  <scope>source.python, keyword.control.import.python</scope>
</snippet>
```

### Packages

[Package Control](https://packagecontrol.io/installation):

**General**

- [Theme - Monokai Pro](https://monokai.pro/)
- [EditorConfig](https://packagecontrol.io/packages/EditorConfig)
  - See console for currently active config
- [EditorConfigSnippets](https://packagecontrol.io/packages/EditorConfigSnippets)
- [BracketHighlighter](https://packagecontrol.io/packages/BracketHighlighter)
- Indent XML (Ctrl-K,F) (Also does JSON)
- Color Highlighter
- Terminal (Ctrl-Shift-T, or Ctrl-Shift-Alt-T)
    - **Package settings**
        ```
        {
            "terminal": "/usr/bin/termite"
        }
        ```
- TOML

**Vintage**

- Enable in the config above
- In Sublime package settings `~/.config/sublime-text-3/Vintage/Preferences.sublime-settings`:

```
{
    "vintage_use_clipboard": true
}
```

**Python**

- (Djaneiro)
- Anaconda - Like flake8 (pycodestyle PEP8; PEP257 (TODO: Enable?); PyFlakes; McCabe)
    - `ctrl-alt-g` goto definition
    - `ctrl-alt-f` find usages
    - `ctrl-alt-d` show docs
    - `ctrl-alt-r` auto-pep8
    - Rename object under cursor (command search/right-click)
    - McCabe code complexity (command search/right-click)
    - **Cross-Project setup** `Preferences > Package Settings > Anaconda > Settings - User`
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
    - **Key Maps** - `Preferences > Browse Packages > User (Folder) > Python.sublime-settings`
        ```
        {
            "auto_complete_triggers": [{"selector": "source.python - string - comment - constant.numeric", "characters": "."}]
        }
        ```

- [sublack](https://packagecontrol.io/packages/sublack)
    - Install user-local Black package: `pipx install black[d]`
    - **Package settings**
        ```
        {
            "black_command": "/home/test/.local/bin/black",
            "black_blackd_autostart": true,
            "black_use_blackd": true
        }
        ```

**Vintage**

- Enable in the config above
- In Sublime package settings `~/.config/sublime-text-3/Vintage/Preferences.sublime-settings`:
    ```
    {
        "vintage_use_clipboard": true
    }
    ```

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
