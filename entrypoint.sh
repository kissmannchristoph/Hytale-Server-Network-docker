#!/bin/sh
# EULA automatisch akzeptieren
echo "eula=true" > eula.txt

# Falls die JAR noch nicht im lokalen Ordner ist, kopiere sie aus dem Jars-Mount
if [ ! -f "/data/${JAR_FILE}" ]; then
    cp /jars/${JAR_FILE} /data/${JAR_FILE}
fi

mkdir /data/plugins

rm /data/plugins/*.jar

cp /plugins/common/* /data/plugins
cp /plugins/${PLUGIN_FOLDER}/* /data/plugins

if [ $JAR_FILE = "velocity.jar" ]; then
echo "velocity"
cp /secrets/forwarding.secret /data/forwarding.secret
cp /configs/proxy/velocity.toml /data/velocity.toml
# Starte den Server

exec java -Xms${MEMORY} -Xmx${MEMORY} -jar ${JAR_FILE}
else
echo "server"
mkdir /data/config
cp /configs/backend/paper-global.yml /data/config/paper-global.yml

cp /configs/${PLUGIN_FOLDER}/server.properties /data/server.properties


# Starte den Server
exec java -Xms${MEMORY} -Xmx${MEMORY} -jar ${JAR_FILE} --nogui
fi

