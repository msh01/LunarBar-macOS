# LunarBar Weather Worker

Cloudflare Worker backend for LunarBar weather data.

## Endpoints

```text
GET /health
GET /weather?location=101010100&cityName=北京
GET /weather?lat=39.9042&lon=116.4074&cityName=北京
```

The Worker prefers QWeather when credentials are configured. Coordinate queries can fall back to Open-Meteo.

## Secrets

See `env.example` for all external variables and their meanings.

```bash
wrangler secret put QWEATHER_CREDENTIAL_ID
wrangler secret put QWEATHER_PROJECT_ID
wrangler secret put QWEATHER_PRIVATE_KEY
```

Do not commit QWeather private keys to GitHub.

## GitHub Actions Deployment

Pushes to `main` that change files under `workers/weather/**` trigger `.github/workflows/deploy-weather-worker.yml`.

The repository must define this GitHub Actions secret:

```text
CLOUDFLARE_API_TOKEN
```

The token needs permission to deploy Workers for the Cloudflare account that owns this Worker.
The Cloudflare account ID is configured in `wrangler.jsonc`.
