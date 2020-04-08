#              _                          _           
#         __ _| | _____  ____ _ _ __   __| | ___ _ __ 
#        / _` | |/ _ \ \/ / _` | '_ \ / _` |/ _ \ '__|
#       | (_| | |  __/>  < (_| | | | | (_| |  __/ |   
#        \__,_|_|\___/_/\_\__,_|_| |_|\__,_|\___|_|   
# 
# a customised config.py for the qtile wm (http://www.qtile.org)
# modified by alexander bailey (https://github.com/kingston802)

import os 

from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget

from typing import List  # noqa: F401

def init_keys():
    keys = [ 
        # I only use bsp
        Key([mod], "h", lazy.layout.left()),
        Key([mod], "j", lazy.layout.down()),
        Key([mod], "k", lazy.layout.up()),
        Key([mod], "l", lazy.layout.right()),
        Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
        Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
        Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
        Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
        Key([mod, "mod1"], "h", lazy.layout.flip_left()),
        Key([mod, "mod1"], "j", lazy.layout.flip_down()),
        Key([mod, "mod1"], "k", lazy.layout.flip_up()),
        Key([mod, "mod1"], "l", lazy.layout.flip_right()),
        Key([mod, "control"], "h", lazy.layout.grow_left()),
        Key([mod, "control"], "j", lazy.layout.grow_down()),
        Key([mod, "control"], "k", lazy.layout.grow_up()),
        Key([mod, "control"], "l", lazy.layout.grow_right()),
        Key([mod, "shift"], "n", lazy.layout.normalize()),

        # utility commands
        Key([mod], "w", lazy.window.kill()),
        Key([mod, "control"], "r", lazy.restart()),
        Key([mod, "control"], "q", lazy.shutdown()),
        Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -c 0 -q set Master 2dB+")),
        Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -c 0 -q set Master 2dB-")),
        Key([], "XF86AudioMute", lazy.spawn("amixer -c 0 -q set Master toggle")),

        # spawn commands
        Key([mod], "r", lazy.spawncmd()),

        Key([mod], "Return", lazy.spawn("st")),
        Key([mod], "b", lazy.spawn("brave")),
    ]
    return keys

def init_colours():
    return [["#282828", "#282828"],
            ["#ebdbb2", "#ebdbb2"],
            ]

def init_groups():
    groups = [Group(i) for i in "asdfuiop"]
    return groups


def init_widget_defaults():
    widget_defaults = dict(
        font='sans',
        fontsize=12,
        padding=5,
    )
    return widget_defaults 


def init_widgets_list():
    widgets_list = [
        widget.GroupBox(
            active = colors[1],
            inactive = colors[0],
            foreground = colors[1],
            background = colors[0],
        ),
        widget.Prompt(
            padding=10,
            foreground= colors[1],
            background = colors[0],
        ),
        widget.WindowName(
            foreground = colors[1],
            background = colors[0],
        ),
        widget.Volume(
            foreground = colors[1],
            background = colors[0],
        ),
        widget.Wlan(
            foreground = colors[1],
            background = colors[0],
            interface = 'wlp2s0'
        ),
        widget.Battery(
            format='{percent:2.0%}',
            foreground = colors[1],
            background = colors[0],

        ), # simple battery percentage
        widget.Clock(
            format='%a %I:%M %p %Y-%m-%d ',
            foreground = colors[1],
            background = colors[0],
        ),
    ]
    return widgets_list

def init_screens():
    screens = [
        Screen(
            top=bar.Bar(
                init_widgets_list(),
                28, 
            ),
        ),
    ]
    return screens

def init_mouse():
    mouse = [
        Click([mod], "Button2", lazy.window.bring_to_front())
    ]
    return mouse

# call all the init functions
if __name__ in ["config", "__main__"]:
    mod = "mod4" # super
    #mod = "mod1" # alt
    term = "st"

    os.system("nitrogen --restore &") # restore set wallpaper with nitrogen 

    colors = init_colours()
    keys = init_keys()
    mouse  = init_mouse()
    groups = init_groups()
    layouts = [layout.bsp.Bsp()]
    screens = init_screens()
    widget_defaults = init_widget_defaults()
    extension_defaults = widget_defaults.copy()

# group keybindings
for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen()),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
    ])

# required by some java libraries 
wmname = "LG3D"
