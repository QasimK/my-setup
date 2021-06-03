# My Sublime Text 3

Installation (add repository to package manager): <https://www.sublimetext.com/docs/3/linux_repositories.html>

## Cheat-Sheet

* `F12` - Go To Definition
* `Ctrl+Alt+G` = Go To Definition (Anaconda)  (Note: **Mac OS** Super + Option)
* `Ctrl+Alt+F` = Find Usages (Anaconda)
* `Ctrl+Alt+D` = Show Docs (Anaconda)
* Back Button / `Ctrl+-` = Go Back
* `Ctrl+K,F` = Auto-format JSON or XML

## Per-Project Settings

### Python

#### Python (Anaconda, Sublack) 

Project > Edit Project:

    {
        "settings":
        {
            // Anaconda Python interpreter
            "python_interpreter": "~/.cache/pypoetry/virtualenvs/project-py3.7/bin/python",
            "sublack.black_blackd_autostart": true,
            "sublack.black_on_save": true,

            // If Sublack is not used
	    // "pep8": true,
            // "pep8_max_line_length": 88,
            // "pep8_ignore": [],
        }
    }

#### VM / Containers

- VM/Container Bash Function:

        function minserver {
            pkill -e -f /anaconda/anaconda_server/minserver.py;
            (nohup /PROJECT/venv/bin/python -B /anaconda/anaconda_server/minserver.py -p PROJECT -e /PROJECT/prix-core 19361 > /dev/null &);
        }

- Vangrant - Mount Anaconda Folder:

        config.vm.synced_folder '~/.config/sublime-text-3/Packages/Anaconda', '/anaconda', type: 'nfs'

- Sublime Project Settings

        {
            "settings":
            {
                // Vagrant
                // "python_interpreter": "tcp://localhost:19360?network=forwarded&interpreter=~/.virtualenvs/<venv>/bin/python&shared=/anaconda&pathmap=/home/test/code/<project>,/vagrant/<project>"

                // Vagrant (Generic)
                // "python_interpreter": "tcp://172.16.3.2:19361?pathmap=/home/qasim/Projects/<project>,/project"
            }
        }


## One-Time Settings

### User Settings

```
{
	"added_words":
	[
		"virtualenv",
		"fallback",
		"datetime",
		"blockchain"
	],
	"always_show_minimap_viewport": true,
	"auto_complete_commit_on_tab": true,
	"auto_complete_cycle": true,
	"auto_find_in_selection": true,
	"binary_file_patterns":
	[
		".codeintel/*",
		"htmlcov/*",
		"node_modules/*",
		".tox/*",
		"venv/*",
		".virtualenv/*",
	],
	"color_scheme": "Packages/Color Scheme - Default/Mariana.sublime-color-scheme",
	"control_character_style": "name",
	"dictionary": "Packages/Language - English/en_GB.dic",
	"folder_exclude_patterns":
	[
		".allure",
		".cache",
		".git",
		".idea",
		".mypy_cache",
		".pytest_cache",
		"__pycache__",
		".sass-cache",
	],
	"font_face": "Fira Code",
	"font_tab_style": "square",
	"font_options":
	[
		"ss03",
		"ss05",
		"ss20"
	],
	"font_size": 13,
	"git_diff_target": "head",
	"hide_tab_scrolling_buttons": true,
	"hide_new_tab_button": true,
	"ignored_packages":
	[
		"Vintage",
		"Rust",
	],
	"indent_guide_options":
	[
		"draw_normal",
		"draw_active_single",
	],
	"rulers":
	[
		79,
		88,
		99,
	],
	"shift_tab_unindent": true,
	"show_encoding": true,
	"show_line_endings": true,
	"show_project_first": true,
	"show_rel_path": true,
	"show_sidebar_button": false,
	"scroll_past_end": true,
	"scroll_context_lines": 3,
	"spell_check": true,
	"tab_completion": false,
	"theme": "Default.sublime-theme",
	
	// Mac only
	"native_tabs": "disabled",
}
```

### Keymaps

Preferences > Key Bindings.

```
[
    // Fix terminal key binding conflict
    { "keys": ["ctrl+shift+t"], "command": "reopen_last_file" },
    { "keys": ["alt+shift+t"], "command": "open_terminal" },
    { "keys": ["ctrl+alt+shift+t"], "command": "open_terminal_project_folder" },

    // Show tab completion pop-up with ctrl + space
    { "keys": ["ctrl+space"], "command": "auto_complete" },
]
```

**Mac OS** override:

```
[
    // Fix terminal key binding conflict
    { "keys": ["super+shift+t"], "command": "reopen_last_file" },
    { "keys": ["ctrl+shift+t"], "command": "open_terminal" },
    { "keys": ["ctrl+alt+shift+t"], "command": "open_terminal_project_folder" },
]
```

### Mouse Maps

**Mac OS**

Preferences > Browse Packages > User > `Default (OSX).sublime-mousemap`:

```
[
    { "button": "button4", "command": "jump_back" },
    { "button": "button5", "command": "jump_forward" },
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

Preferences > Browse Packages > EditorConfigSnippets > editor-python-qasimk.sublime-snippet

```
<snippet>
  <content><![CDATA[
# .editorconfig project file
# https://EditorConfig.org
root = true

[*]
charset = utf-8
trim_trailing_whitespace = true
end_of_line = lf
insert_final_newline = true

[*.py]
indent_style = space
indent_size = 4
max_line_length = 88

[Makefile]
indent_style = tab
]]></content>
  <tabTrigger>editor-python</tabTrigger>
  <scope>source.ini.editorconfig</scope>
</snippet>
```

### Packages

[Package Control](https://packagecontrol.io/installation)

#### General

- [A File Icon](https://packagecontrol.io/packages/A%20File%20Icon)
- Color Highlighter
- [EditorConfig](https://packagecontrol.io/packages/EditorConfig)
  - See console for currently active config
- Indent XML (Ctrl-K,F) (Also does JSON)
- Terminal (Alt-Shift-T, or Ctrl-Shift-Alt-T)
    - **Package settings**
        ```
        {
            "terminal": "/usr/bin/termite"
        }
        ```
- TOML

##### Company

- Git
- GitLink

#### Vintage

1. Enable the package
2. In Sublime package settings `~/.config/sublime-text-3/Vintage/Preferences.sublime-settings`:

        {
            "vintage_use_clipboard": true
        }

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

            {
                "auto_python_builder_enabled": false,  // Not used by me; can cause problems
                "pep8": false,  // Disable pycodestyle in favour of Sublack
                "suppress_word_completions": true,  // Ignore Sublime's auto-complete
                "suppress_explicit_completions": true,  // Ignore Sublime's auto-complete    
                "validate_imports": true,
            }

    - **Key Maps** - `Preferences > Browse Packages > User (Folder) > Python.sublime-settings`

            {
                "auto_complete_triggers": [{"selector": "source.python - string - comment - constant.numeric", "characters": "."}]
            }

- [sublack](https://packagecontrol.io/packages/sublack)
    - Install user-local Black package: `pipx install black[d]`
    - **Package settings**
        ```
        {
            "black_command": "/home/test/.local/bin/black",
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
    - More up-to-date version of Sublime's `Rust` package
    - Build features (ctrl+b), test features, *inline syntax highlight*
    - Be sure to disable the `Rust` package and to have `rustc` and `cargo` available on cmd

            {
                "rust_env": {"PATH": "$PATH:$HOME/.cargo/bin"},
	            "rust_gutter_style": "circle",
                "rust_phantom_style": "popup",
            }

- TODO: rust-analyser
- [RustFmt](https://packagecontrol.io/packages/RustFmt)
    - Auto-format on save
    - `cargo install rustfmt`
    - Preferences > Package Settings > RustFmt > Settings:

            {
                // Must be an absolute path, i.e. `type rustfmt`
                "executable": "/home/qasim/.cargo/bin/rustfmt",
                "error_messages": false,
            }

**Maybe**

- SublimeLinter - Used for other linters
