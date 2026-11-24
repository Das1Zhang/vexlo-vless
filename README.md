# vexlo-vless

A minimal private VLESS-over-WebSocket server (sing-box) for deployment on a PaaS container host.

Configure with environment variables (never commit secrets here):

- `UUID` — the VLESS user UUID (required)
- `PORT` — the port to listen on (default: 8080)

The platform terminates TLS in front of the container and forwards to `$PORT`. Clients connect with VLESS over WebSocket (path `/`) to the platform-assigned HTTPS domain.
