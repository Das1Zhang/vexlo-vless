#!/bin/sh
set -e
PORT="${PORT:-8080}"
if [ -z "$UUID" ]; then echo "UUID env var is required" >&2; exit 1; fi
cat > /etc/sing-box-config.json <<EOF
{
  "log": {"level": "info"},
  "inbounds": [
    {
      "type": "vless",
      "tag": "vless-in",
      "listen": "0.0.0.0",
      "listen_port": $PORT,
      "users": [{"uuid": "$UUID"}],
      "transport": {"type": "ws", "path": "/"}
    }
  ],
  "outbounds": [
    {"type": "direct", "tag": "direct"},
    {"type": "block", "tag": "block"}
  ]
}
EOF
exec /usr/local/bin/sing-box run -c /etc/sing-box-config.json
