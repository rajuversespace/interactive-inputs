# Self-hosted reverse proxy example

This example shows how to run the Interactive Inputs server locally and place it behind Nginx under a prefix (e.g., `/inputs`).

What it does
- Runs the app listening on `:8080` (local mode, using fake defaults).
- Runs Nginx on `:8081`, forwarding `/inputs/*` to the app and setting `X-Forwarded-Prefix` to `/inputs`.
- The app namespaces routes by a key; in local skip-config mode, the key defaults to `local`, so UI is at `/inputs/local/`.

Quick start

1. From the repo root, run:

   docker compose -f examples/self-hosted/docker-compose.yml up --build

2. Open the portal at:

   http://localhost:8081/inputs/local/

Notes
- The app needs `GITHUB_WORKSPACE` set; the compose file sets it to the repo root.
- In local mode, the app does not send outputs back to Actions (it logs them).
- To use your own key in real runs, set `with: runner-endpoint-key: ${{ github.run_id }}-${{ github.job }}` in your workflow.

