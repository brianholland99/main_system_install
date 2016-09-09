# main_system_install
Initial minimal installation steps for my main development system + salt.

## Overview

This repo contains the steps for the initial install for a minimal Ubuntu
16.04 server install with an initial salt master/minion. Additional software
and configuration will controlled via salt.

## Phases

The install is currently separated into three phases.

### Initial install from Ubuntu 16.04 server ISO

The installation from the server installation ISO is straightforward for my
setup. Most defaults were correct. At some point, I would like to use one
of the two automated install methods to remove most of the human interaction.

[Follow these installation steps](./initial.markdown)

### Post installation upgrade

The second phase is to upgrade and reboot the system. This will also include
swapping out the open source video driver for an Nvidia one when I find one
that doesn't periodically lock up in KDE.

As root, run the following script:

`post-install-upgrade.sh`

### Salt master and minion setup

The last installation phase is to install the salt master and minion.
Fortunately, the bootstrap_salt.sh script supplied on saltstack.com sets up
the "latest" PPA for saltstack. That hosts the 2016.3.3 version of the Ubuntu
package. The 2015.8.8 version supplied by the default repos has an issue of
printing a warning when executing certain commands.

The script preseeds the key to the master rather than use salt-key to accept
one sent by a minion. The direct copy avoids a small window for another system
to connect with the same minion_id before the local minion does.

As root, run the following script substituting for MINION_ID:

`setup-salt.sh MINION_ID`

## Summary

At this point, the system will have an initial install with a salt master and
minion setup. All that is needed is to add salt states and apply them. For my
main development system, I will be pulling those salt states from a separate
repo.
