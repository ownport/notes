Title: powerline-status
Date: 2015-09-07 08:25
Tags: powerline, terminal, customization

Powerline is a statusline plugin for vim, and provides statuslines and prompts for several other applications, including zsh, bash, tmux, IPython, Awesome and Qtile. Documentation [https://powerline.readthedocs.org/en/latest/](https://powerline.readthedocs.org/en/latest/)

### Bash prompt

Add the following line to your `~/.bashrc` or `/etc/bash.bashrc`:

```sh
if [ -f `which powerline-daemon` ]; then
	powerline-daemon -q
	
	export POWERLINE_BASH_CONTINUATION=1
	export POWERLINE_BASH_SELECT=1
	export POWERLINE_PATH=$(python -c 'import pkgutil; print pkgutil.get_loader("powerline").filename' 2>/dev/null)
	
	if [[ "$POWERLINE_PATH" != "" ]]; then
		source ${POWERLINE_PATH}/bindings/bash/powerline.sh
	fi
fi
```

### Configuration

- Copy the set of default configuration into a local config dir: 

```sh
mkdir ~/.config/powerline
cp -R ${POWERLINE_PATH}/config_files/* ~/.config/powerline
```

#### Configuration examples

- config.json

```json
{
	"common": {
		"term_truecolor": false
	},
	"ext": {
		"shell": {
			"colorscheme": "default",
			"theme": "myshell",
			"local_themes": {
				"continuation": "continuation",
				"select": "select"
			}
		}
	}
}
```

- myshell.json

```json
{
    "segments": {
        "left": [
                    {
                            "function": "powerline.segments.shell.mode"
                    },
                    {
                            "function": "powerline.segments.common.net.hostname",
                            "priority": 10
                    },
                    {
                            "function": "powerline.segments.common.env.user",
                            "priority": 30
                    },
                    {
                            "function": "powerline.segments.common.env.virtualenv",
                            "priority": 50
                    },
                    {
                            "function": "powerline.segments.shell.cwd",
                            "priority": 10
                    },
                    {
                            "function": "powerline.segments.shell.jobnum",
                            "priority": 20
                    }
                    {
                            "function": "powerline.segments.shell.last_pipe_status",
                            "priority": 10
                    },
                    {
                            "function": "powerline.segments.common.vcs.branch",
                            "priority": 40
                    }
                ]
    }
}
```

For detailed information on configuring [Powerline:Configuration](https://powerline.readthedocs.org/en/latest/configuration.html#)


### Uninstall

To uninstall Powerline run the following commands in terminal:

```sh
$ sudo pip uninstall powerline
```
 and remore references to powerline from config files

### Links

- [How can I install and use powerline plugin?](http://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin)
- [powerline/fonts](https://github.com/powerline/fonts)
- [Using Powerline for awesome statuslines](http://agperson.com/entry/4081)
- [Getting Spiffy With Powerline](http://computers.tutsplus.com/tutorials/getting-spiffy-with-powerline--cms-20740)
- [erikw/tmux-powerline](https://github.com/erikw/tmux-powerline) Statusbar configuration for tmux that looks like vim-powerline and consist of dynamic segments.

