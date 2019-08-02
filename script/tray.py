#!/usr/bin/python
import os
from gi.repository import Gtk as gtk, AppIndicator3 as appindicator
import psutil

def main():
    app = "Media eject"
    indicator = appindicator.Indicator.new(app, "media-eject", appindicator.IndicatorCategory.OTHER)
    indicator.set_status(appindicator.IndicatorStatus.ACTIVE)
    indicator.set_menu(menu())
    indicator.set_label("1 Monkey", app)
    gtk.main()

def menu():
    menu = gtk.Menu()

    partitions = psutil.disk_partitions()
    for p in partitions:
        item_name = str(p.mountpoint) + " " + str(psutil.disk_usage(p.mountpoint).percent) + "%"
        item = gtk.MenuItem(item_name)
        item.connect('activate', print)
        menu.append(item)
    menu.append(gtk.SeparatorMenuItem())

    command_one = gtk.MenuItem('My Notes')
    command_one.connect('activate', note)
    menu.append(command_one)
    exittray = gtk.MenuItem('Exit Tray')
    exittray.connect('activate', quit)
    menu.append(exittray)

    menu.show_all()
    return menu

def note(_):
    os.system("nvim $HOME/Documents/notes.txt")

def quit(_):
    gtk.main_quit()

if __name__ == "__main__":
    main()
