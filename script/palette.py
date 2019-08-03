#!/usr/bin/env python3
"""
Module Docstring
"""
import os
import re
import cv2
import imghdr
from wand.image import Image
from pathlib import Path
from rofi import Rofi
import gi.repository
gi.require_version('Notify', '0.7')
from gi.repository import Notify

ROFI = Rofi()
Notify.init("Palette")
app_icon = "applications-graphics"

__author__ = "Njiall"
__version__ = "0.1.0"
__license__ = "MIT"

def ask_user(options, names, prompt):
    index, key = ROFI.select(prompt, names)
    if index >= 0:
        return options[index], names[index]
    return '', ''

def sort_names_options(names, options):
    return zip(*sorted(zip(names, options)))

def get_bars(path):
    file = open(path, "rt")
    config = file.read()
    file.close()
    options = re.findall(r'\[bar/(.*)\]', config)
    names = []
    for option in options:
        names += [str(option).replace('_', ' ').capitalize()]
    names, options = sort_names_options(names, options)
    return options, names

def get_wallpapers(paths):
    options = []
    names = []
    for path in paths:
        files = list(Path(path).rglob("*.[pj][np][g]"))
        for file in files:
            file_type = imghdr.what(file)
            if file_type in {'png', 'jpeg'}:
                options += [file]
                names += [
                    "[" + file_type.capitalize() + "] "
                    + re.sub(r'(.*/|\..*)', '', str(file)).replace('_', ' ').capitalize()
                ]
    names, options = sort_names_options(names, options)
    return options, names

def blur_wallpaper(path, new_file_path, rect = None):
    width, height = rect
    os.system('convert -resize "${{resolution:-{0}x{1}}}^" -gravity center -extent "${{resolution:-{0}x{1}}}" "{2}" "{3}"'.format(
        width,
        height,
        str(path),
        new_file_path.format('_cropped')
    ))
    img = cv2.imread(new_file_path.format('_cropped'))
    img = cv2.resize(img, None, fx=0.1, fy=0.1)
    img = cv2.blur(img,(40,40))
    img = cv2.resize(img, None, fx=10, fy=10)

    cv2.imwrite(new_file_path.format('_blurred'), img)

# Async set wallpaper
def apply_wallpaper(path):
    os.system('feh --bg-center {} &'.format(path))

# Async set bar
def apply_bar(bar_name):
    os.system('launch_bar.sh -rqf {} &>/dev/null &'.format(bar_name))
    os.system('echo "~/.config/script/launch_bar.sh -rqf $1" > ~/.polybar &')

def main():
    """ Main entry point of the app """
    options, names = get_bars("/home/njiall/.config/polybar/config")
    bar_choice, bar_name = ask_user(options, names, "Bar")

    options, names = get_wallpapers(["/home/njiall/.config/wallpapers", "/home/njiall/Pictures"])
    wallpaper_choice, wallpaper_name = ask_user(options, names, "Wallpaper")

    # Apply bar if one has been selected, then sends a notification
    if bar_choice and bar_name:
        apply_bar(bar_choice)
        Notify.Notification.new("Changing bar to", bar_name, app_icon).show()
    # Apply wallpaper if one has been selected
    if wallpaper_choice and wallpaper_name:
        apply_wallpaper(wallpaper_choice)
        # Sends a notif
        Notify.Notification.new("Changing wallpaper to", wallpaper_name, app_icon).show()
        # Blurs the wallpaper
        blur_wallpaper(wallpaper_choice, "/home/njiall/.bg{}.png", rect = (1920, 1080))
        # Sends a notif
        Notify.Notification.new("Blurred wallpaper for lockscreen", wallpaper_name, app_icon).show()


if __name__ == "__main__":
    """ This is executed when run from the command line """
    main()
