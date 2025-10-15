FROM debian:trixie-slim
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends openjdk-21-jre-headless nano curl wget && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY run.sh server.properties server-icon.png paper*.jar plugins /app
RUN chmod +x /app/run.sh
EXPOSE 25565/tcp
ENTRYPOINT ["./run.sh"]
