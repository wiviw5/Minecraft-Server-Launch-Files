#!/bin/sh
set -eu

# Following this, is a list of values that will need to be set/decided on in order for the minecraft server to start.
# Examples are included above each value which will give you a good example of what is expected out of each value.

# This value below should be set to the path of java the server needs.
# As a good rule of thumb. Minecraft versions 1.17 and above should use Java 17. Minecraft Versions 1.16.5 and below should use java 8.
# An couple examples below, showcasing an extracted java JDK zip from https://adoptium.net/temurin/releases/:
# JAVA="/home/user/jdk8u372-b07/bin/java" # THESE ARE EXAMPLES, UNCOMMENTING IT WILL NOT WORK!
# JAVA="/home/user/jdk-17.0.7+7/bin/java" # THESE ARE EXAMPLES, UNCOMMENTING IT WILL NOT WORK!
JAVA="REPLACEME"

# This value is whether or not the server should auto restart. If true, it will auto restart every 10 seconds.
# Examples:
# AUTO_RESTART="true" # Will attempt to auto restart the server every 10 seconds.
# AUTO_RESTART="false" # Will exit out out the application.
AUTO_RESTART="false"

# This value should contain the name of the server's jar.
# A couple of examples are shown below, only for running vanilla servers, modded servers may reqire more complex setups.
# SERVER_JAR="server.jar"
SERVER_JAR="REPLACEME"

# This value should contain the amount of ram you would like dedicated to the server.
# Invalid ram allocations (such as more ram than the server has, for example) will lead to likely crashes/not even launching.
# The "-Xmx4024M" Is for example how 4GBs of ram can be allocated to the server. 
# Common values include: "4096M" (4GBs) "6144M" (6GBs) "8192M" (8GBs) Depending on the mods/players on your server.
# Examples included with explainations afterwards.
# SERVER_ARGS="-Xmx4024M" # This sets the server to having approximently 4GBs of ram allocated.
SERVER_ARGS="REPLACEME"

while true
do
    # This is where the server is launched. Set mostly from earlier variables.
    "${JAVA}" "${SERVER_ARGS}" -jar "${SERVER_JAR}" nogui

    # This exits out of the loop early if autorestart is set to false.
    if [ "${AUTO_RESTART}" = "false" ]; then
	    echo "Exiting server process."
        exit 0
    fi

    # This warns the user when the server is about to restart.
    echo "Restarting automatically in 10 seconds. (Press Ctrl + C to cancel)"
    sleep 10
done
