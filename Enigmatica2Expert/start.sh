#!/bin/sh

_handleTerm() {
    echo "Caught SIGTERM signal!"
    waitpid $child
    zip -m scriptLogs/logs-$(date -u +%Y-%m-%d_%H:%M:%S).zip scripLogs/*.log
    exit 0
}

install_forge() {
    echo "installing forge"
    echo ""
    echo ""
    echo "forge installer downloaded at $(date)"
    wget -O forge-installer.jar https://files.minecraftforge.net/maven/net/minecraftforge/forge/$MCVER-$FORGEVER/forge-$MCVER-$FORGEVER-installer.jar
    if [ ! -f forge-installer.jar ]; then
        echo "forge wasnt downloaded, please report this in a issue on github"
        exit 128
    else
        echo "forge installer downloaded at $(date)"
    fi

    echo "installing forge server"
    java -jar ./forge-installer.jar --installServer
    echo "removing forge installer"
    rm forge-installer.jar
} > ./scriptLogs/forgeInstall.log
echo
if [ "$1" = "-StartServer" ]; then
    {
        trap _handleTerm SIGTERM
        echo "starting server"
        echo ""
        echo ""
        echo "server started at $(date)"
        ls -a
        java -Xms$MAX_RAM $JAVA_ARGS -jar forge-$MCVER-$FORGEVER.jar nogui
    } > ./scriptLogs/server.log
else
    install_forge
fi





