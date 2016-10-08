# My Sublime Text 3

## Settings

```
{
    "atomic_save": true,
    "font_size": 12,
    "rulers": [80, 100],
    "shift_tab_unindent": true,
    "show_encoding": true,
    "folder_exclude_patterns": [
        ".git",
        ".cache",
        "__pycache__",
    ],
    "binary_file_patterns":
    [
        "node_modules/*",
        ".codeintel/*",
        ".tox/*",
        "htmlcov/*",
    ]
}
```

## Packages

[Package Control](https://packagecontrol.io/installation):

**General**

- EditorConfig - See console for currently active config
- SideBarEnhancements
- SublimeLinter - Used for other linters
- Git
- BracketHighlighter
- LineEndings

**Python**

- Anaconda
- Djaneiro

**Web**

- SublimeLinter-jshint?
- JsFormat?
- DocBlockr?
- jQuery?
- Sass (Requires Ruby)
- SassBeautify (Requires Sass)
- babel-sublime


## Sublime Anaconda setup

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
