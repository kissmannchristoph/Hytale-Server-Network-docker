FROM eclipse-temurin:21-jre-alpine

# --- FIXED: Correct Source Path ---
# The binary is located at the root of the source image (/rcon-cli)
COPY --from=itzg/rcon-cli:latest /rcon-cli /usr/local/bin/rcon-cli

# Installiere benötigte Tools (sh ist in alpine dabei)
WORKDIR /data

# Script kopieren
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]