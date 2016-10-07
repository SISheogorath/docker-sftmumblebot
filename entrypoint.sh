#!/bin/sh

# set IRC settings
sed -i -e "s/ircchannel/$BOT_IRC_CHANNEL/" /opt/mumblebot/sftbot.conf
sed -i -e "s/ircserver/$BOT_IRC_SERVER/" /opt/mumblebot/sftbot.conf

# Set mumble settings
sed -i -e "s/mumblechannel/$BOT_MUMBLE_CHANNEL/" /opt/mumblebot/sftbot.conf
sed -i -e "s/mumbleserver/$BOT_MUMBLE_SERVER/" /opt/mumblebot/sftbot.conf

# Set bot name
sed -i -e "s/botname/$BOT_BOTNAME/" /opt/mumblebot/sftbot.conf

/opt/mumblebot/run
