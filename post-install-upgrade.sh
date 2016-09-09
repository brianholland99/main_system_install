#!/bin/bash

# This should be run after a fresh install to upgrade all the packages on the system.

apt-get update
apt-get -y dist-upgrade

# TODO: Video locks up at times in Window Manager.  Look at replacing
# open source video driver (nouveau) and install one of the
# nvidia drivers.
# Reboot in case some of the upgrades need it
reboot
