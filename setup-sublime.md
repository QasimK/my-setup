# My Sublime Text 3

Installation (add repository to package manager): <https://www.sublimetext.com/docs/3/linux_repositories.html>

## Cheat-Sheet

* `Ctrl+Space` - Show Completions
* `F12` - Go To Definition
* `Ctrl+Alt+G` = Go To Definition (Anaconda)  (Note: **Mac OS** Super + Option)
* `Ctrl+Alt+F` = Find Usages (Anaconda)
* `Ctrl+Alt+D` = Show Docs (Anaconda)
* Back Button / `Ctrl+-` = Go Back
* `Ctrl+K,F` = Auto-format JSON or XML (Indent XML)
* Ctrl+Alt+Shift+T = Open Project Terminal (Terminal)
* Alt+Shift+T = Open Terminal (Terminal)

## Per-Project Settings

### Python

#### Python (Anaconda, Sublack) 

Project > Edit Project:

    {
        "settings":
        {
            // Anaconda Python interpreter
            "python_interpreter": "~/.cache/pypoetry/virtualenvs/project-py3.7/bin/python",
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

### User Settings + Keymaps

See dotfiles.

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

### Packages

[Package Control](https://packagecontrol.io/installation)

#### General

- [A File Icon](https://packagecontrol.io/packages/A%20File%20Icon)
- Color Highlighter??
- [EditorConfig](https://packagecontrol.io/packages/EditorConfig)
  - See console for currently active config
- Indent XML (Ctrl-K,F) (Also does JSON)
- TOML
- LSP
- LSP-ruff

Project settings:
```
 {
 	"settings": {
 		"LSP": {
 			"LSP-ruff": {
 				"initializationOptions": {
 					"settings": {
 						"path": ["${workspaceFolder}/.venv/bin/ruff"],
 					}
 				}
 			}
 		}
 	}
 }
```

- LSP-copilot (require Node)
- LSP-file-watcher-chokidar
- LSP-json (require Node)
- View in Browser

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
