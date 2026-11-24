FROM alpine:latest
RUN apk add --no-cache ca-certificates curl
RUN curl -fsSL -o /tmp/sing-box.tar.gz https://github.com/SagerNet/sing-box/releases/download/v1.14.4/sing-box-1.14.4-linux-amd64-musl.tar.gz \
    && tar -xzf /tmp/sing-box.tar.gz -C /tmp \
    && mv /tmp/sing-box-*/sing-box /usr/local/bin/sing-box \
    && chmod +x /usr/local/bin/sing-box \
    && rm -rf /tmp/sing-box*
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
