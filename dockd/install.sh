#!/bin/bash
sudo rm /etc/dockd/dock.hook
sudo rm /etc/dockd/undock.hook
sudo ln -sfT ~/.dotfiles/dockd/dock.hook /etc/dockd/dock.hook
sudo ln -sfT ~/.dotfiles/dockd/undock.hook /etc/dockd/undock.hook
