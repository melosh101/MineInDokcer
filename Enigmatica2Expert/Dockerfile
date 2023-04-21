FROM eclipse-temurin:8-jre-alpine

RUN apk add --no-cache wget tmux zip

# set the environment variables
ENV JAVA_ARGS="-XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -Dfml.readTimeout=180 -Dfml.queryResult=confirm"
ENV MAX_RAM=8G
ENV MCVER=1.12.2
ENV FORGEVER=14.23.5.2860

WORKDIR /modpack

# Download and extract the modpack
RUN wget https://mediafilez.forgecdn.net/files/4056/838/Enigmatica2ExpertServer-1.86.zip
RUN unzip Enigmatica2ExpertServer-1.86.zip -d ./
RUN rm Enigmatica2ExpertServer-1.86.zip
RUN echo "EULA=true" > eula.txt
RUN mkdir ./scriptLogs


# get the start script and install forge
COPY ./start.sh ./
RUN ./start.sh



# expose the default minecraft port
EXPOSE 25565

# start the server
CMD [ "./start.sh", "-StartServer" ]