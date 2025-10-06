FROM debian:bullseye-slim

RUN apt update && apt install -y curl unzip && \
    curl -L -o xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip xray.zip -d /xray && \
    chmod +x /xray/xray

COPY config.json /xray/config.json

CMD ["/xray/xray", "run", "-c", "/xray/config.json"]
