# JAI x Fly.io Deployment Guide

## Prerequisites
- GitHub account
- Telegram bot token (from @BotFather)
- MiniMax API key
- flyctl installed: `curl -L https://fly.io/install.sh | sh`

---

## Step 1 — Prepare Files

Copy semua file dari folder ini ke GitHub repo:
```
deploy/fly.io/
├── Dockerfile
├── fly.toml
└── openclaw.json
```

Pastikan repo kamu **public** atau add secrets untuk API keys.

---

## Step 2 — Create GitHub Repository

```bash
git init
git add .
git commit -m "JAI deployment files"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/jai-assistant.git
git push -u origin main
```

---

## Step 3 — Deploy to Fly.io

```bash
# Login
fly auth login

# Launch (from repo directory)
fly launch

# Set secrets
fly secrets set TELEGRAM_BOT_TOKEN=8256840060:AAEY2R7NUTkAsIQ39MVOsMQd2Q5bi___opI
fly secrets set OPENCLAW_GATEWAY_TOKEN=your_secure_random_token
fly secrets set MINIMAX_API_KEY=your_minimax_api_key

# Deploy
fly deploy
```

---

## Step 4 — Configure Telegram Webhook

Setelah deploy berhasil, Fly.io give kamu URL. Format:
```
https://jai-assistant.fly.dev
```

Set webhook di @BotFather:
```
/setwebhook https://jai-assistant.fly.dev/telegram
```

---

## Step 5 — Test

Kirim `/start` ke bot kamu di Telegram. Pairing code should appear.

---

## Troubleshooting

### Deploy fails
```bash
fly logs
```

### Check app status
```bash
fly status
```

### Open shell
```bash
fly ssh console
```

### Restart
```bash
fly restart
```

---

## Cost

Fly.io free tier: 3 shared VMs, no sleep. Cukup untuk JAI personal use.

---

## Files Location

Semua deployment files ada di:
```
/home/yoseph_y/.openclaw/workspace/deploy/fly.io/
```

Kamu bisa edit openclaw.json sesuai kebutuhan sebelum push ke GitHub.