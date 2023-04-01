FROM eclipse-temurin:17-jre-alpine

RUN apk add --no-cache unzip

WORKDIR /modpack

COPY . .
RUN java -jar forge.jar --installServer
RUN unzip vh-base.zip -d ./
RUN rm -r ./config ./defaultconfigs ./mods ./patchouli_books ./scripts ./vh-base.zip
RUN unzip vh3_patch_8-0-3.zip -d ./
RUN rm ./vh3_patch_8-0-3.zip

VOLUME [ "./world", "./server.properties", "./backups", "./banned-ips.json", "./banned-players.json", "./logs", "ops.json", "./playerSnapshots", "whitelist.json"   ]

EXPOSE 25565

ENTRYPOINT [ "./run.sh" ]