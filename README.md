# REALISTIC IPL AUCTION SIMULATOR – MULTIPLAYER ARENA

Professional, realistic IPL mega auction web platform inspired by the real IPL broadcast auction. Supports up to 10 IPL franchises, live online multiplayer over mobile data (4G/5G) across cities, Solo Mode with AI franchises, 12 official sets, authoritative server-side mechanics, and Playing XI with Impact Player management.

---

## 🏏 Key Features

### 1. Authentic IPL Franchise & Auction System
- **All 10 Official Franchises**: CSK, MI, RCB, KKR, SRH, RR, DC, PBKS, GT, LSG with authentic brand colors and logos.
- **₹120 Crore Initial Purse**: Full purse for every team. No retentions or RTM cards (pure mega auction).
- **12 Official Auction Sets**:
  - `Set 1: Marquee Set 1 (M1)` (Kohli, Rohit, Bumrah, Pant, Starc, Buttler, Iyer, Rabada)
  - `Set 2: Marquee Set 2 (M2)` (KL Rahul, Arshdeep, Chahal, Shami, Siraj, Miller, Livingstone)
  - `Set 3: Capped Batters 1 (BA1)` (Gill, Surya, Jaiswal, Gaikwad, Head, Conway, Warner, Faf)
  - `Set 4: Capped All-Rounders 1 (AL1)` (Hardik, Jadeja, Narine, Russell, Axar, Maxwell, Stoinis, Curran)
  - `Set 5: Capped Wicketkeepers 1 (WK1)` (Dhoni, Klaasen, Pooran, Samson, Kishan, Salt, De Kock, Jitesh)
  - `Set 6: Capped Fast Bowlers 1 (FA1)` (Cummins, Boult, Bhuvi, Harshal, Pathirana, Natarajan, Avesh, Nortje)
  - `Set 7: Capped Spin Bowlers 1 (SP1)` (Rashid, Kuldeep, Varun, Bishnoi, Hasaranga, Theekshana, Noor, Chahar)
  - `Set 8: Capped Batters 2 (BA2)` (Rinku, Tilak, Sudharsan, Patidar, David, Rana, Tripathi, Hetmyer)
  - `Set 9: Capped All-Rounders 2 (AL2)` (Dube, Venkatesh, Nitish Reddy, Sundar, Marsh, Jacks, Moeen, Shepherd)
  - `Set 10: Capped Bowlers 2 (BO2)` (Mayank Yadav, Chahar, Ferguson, Coetzee, Sandeep, Khaleel, Mukesh, Farooqi)
  - `Set 11: Uncapped Batters & All-rounders (UB1)` (Ashutosh, Shashank, Wadhera, Ramandeep, Badoni, Porel, Angkrish, Tewatia)
  - `Set 12: Uncapped Bowlers (UBO1)` (Harshit Rana, Vaibhav, Yash Dayal, Mohsin, Suyash, Rasikh, Vyshak, Tyagi)
- **Rule 2 Strictly Enforced**: Players are shuffled randomly **strictly WITHIN their respective sets**. Sets are never mixed!
- **Dynamic Bidding Slabs**:
  - Below ₹1 Cr: +₹10 Lakhs (or +₹5L below 50L)
  - ₹1 Cr – ₹2 Cr: +₹20 Lakhs
  - ₹2 Cr – ₹5 Cr: +₹25 Lakhs
  - Above ₹5 Cr: +₹50 Lakhs
- **Squad Limits**: Squad cap 25 players, overseas quota 8 players maximum.

### 2. Live Authoritative Multiplayer
- **Host Room System**: Unique 6-character room codes and 1-click shareable invitation links (`/join/CODE`).
- **Zero Local Client Trust**: Official countdown, bid acceptance, purse deductions, overseas limits, and lot advancement are validated authoritatively by the Node.js/Socket.IO backend.
- **Mobile Data Optimized (4G/5G)**:
  - Works when host is on Jio, friends on Airtel/Vi/BSNL in different cities.
  - Zero Wi-Fi or LAN requirement.
  - Lightweight socket events with client-side 60fps interpolation to conserve mobile bandwidth.
  - Auto-reconnect handling so temporary cellular network handovers do not corrupt or reset the auction.

### 3. Comprehensive Host Controls
Verified on backend with strict host authentication:
1. **Start Auction**
2. **Pause Auction** (freezes official countdown across all clients)
3. **Resume Auction** (continues with saved remaining time)
4. **Skip Current Player** (passes player as unsold, opens next lot immediately)
5. **Skip Entire Player Set** (skips remainder of current set directly to next set)
6. **Select Auction Timer** (5-second, 10-second, or 15-second countdowns)
7. **Kick Participant**
8. **End Auction**

### 4. Solo Mode with 9 Realistic AI Teams
- Manage any IPL franchise (e.g., RCB, CSK, MI).
- The remaining 9 franchises are operated by realistic AI team bots.
- Bots calculate valuations based on player rating, squad role needs (keeper, pacer, spinner), overseas quotas, and purse preservation.
- Natural human-like reaction delays (1.2s – 2.4s).

### 5. Playing XI & Impact Player Builder
- Select starting Playing XI (11 players, max 4 overseas, mandatory wicketkeeper).
- Designate **Captain (C)** and **Vice-Captain (VC)**.
- Select official **Impact Player**.
- Select **4 Substitutes**.
- Real-time Team Strength & Balance Analyzer (Batting depth, bowling attack, pace/spin ratio, overall team rating / 100).

---

## 🛠 Project Structure

```
├── Dockerfile                  # Production multi-stage Docker build
├── render.yaml                 # Root Render service definition
├── package.json                # Root package & concurrent scripts
├── backend/
│   ├── package.json
│   ├── tsconfig.json
│   ├── data/
│   │   └── rooms.json          # Persistent JSON fallback database
│   └── src/
│       ├── index.ts            # Express server, CORS, static serving & healthcheck
│       ├── sockets.ts          # Socket.IO handlers, room lock, rate-limit, tick loop
│       ├── engine.ts           # Authoritative auction engine, sets, order, rules
│       ├── ai.ts               # Solo mode AI bidding logic & franchise personas
│       ├── players.ts          # Authentic IPL player database (12 sets, stats, photos)
│       ├── franchises.ts       # 10 official IPL franchises & brand identities
│       ├── format.ts           # Dynamic IPL bid increments & INR currency format
│       ├── analysis.ts         # Post-auction squad balance and ratings
│       ├── store.ts            # Supabase Postgres & JSON file persistence
│       ├── types.ts            # RoomState, Player, SetInfo, PlayingXi types
│       └── engine.test.ts      # Automated unit & integration tests
└── frontend/
    ├── index.html
    ├── vite.config.ts
    ├── tailwind.config.js
    └── src/
        ├── App.tsx             # Routes
        ├── main.tsx
        ├── context/
        │   └── GameContext.tsx # Socket.IO client, auto-reconnect, smooth countdown
        ├── components/
        │   ├── FranchiseMark.tsx # Team badge/logo
        │   ├── Logo.tsx          # Broadcast logo
        │   └── PlayerCard.tsx    # High-res player card with career stats & fallback
        ├── lib/
        │   ├── format.ts
        │   ├── session.ts
        │   ├── socket.ts
        │   └── types.ts
        └── pages/
            ├── HomePage.tsx      # Multiplayer vs Solo Mode picker & room join
            ├── LobbyPage.tsx     # Team selection, sets preview, host timer
            ├── AuctionPage.tsx   # Live stage, set banner, sticky mobile bid bar
            ├── XiPage.tsx        # Playing XI, Impact Player & substitutes builder
            ├── DashboardPage.tsx # Squad analysis & breakdown
            ├── JoinPage.tsx      # Direct link onboarding
            └── ResultsPage.tsx   # Auction summary, spent vs purse, team rankings
```

---

## 🐛 Errors Investigated & Fixed

1. **Render Build Cache Error (`failed to solve: failed to compute cache key: "/client": not found`)**:
   - **Root Cause**: A previous Dockerfile or Render setting had references copying `/client`, whereas the actual frontend folder is named `frontend`. Also, a duplicate `backend/render.yaml` was confusing Render's build root.
   - **Fix**: Removed the conflicting `backend/render.yaml`. Updated the root `Dockerfile` to strictly copy `frontend` and `backend`, execute `npm install` for both, and build the Vite production bundle into `frontend/dist`. Added multi-location fallback in `backend/src/index.ts` so Express finds `frontend/dist` anywhere.

2. **Player Sets Shuffling Violation (Rule 2)**:
   - **Root Cause**: The previous shuffle randomly mixed all players across categories.
   - **Fix**: Implemented strict set-based order in `engine.ts`. Players are partitioned by set (`M1`, `M2`, `BA1`, etc.) and shuffled randomly *within* their set. Sets are auctioned chronologically.

3. **Missing Host Controls (Skip Player, Skip Set, Host Timer)**:
   - **Fix**: Added backend authoritative endpoints and host verification for `auction:skip_player`, `auction:skip_set`, and `auction:set_timer`. Added touch-friendly host operation buttons in `AuctionPage.tsx`.

4. **Missing Solo Mode**:
   - **Fix**: Designed and implemented `createSoloRoom` and `evaluateAiBids` in `backend/src/ai.ts`, allowing 1 human player to auction against 9 intelligent franchise bots with natural reaction delays.

5. **Playing XI Deficiencies**:
   - **Fix**: Added Impact Player selection, 4 substitutes, and team balance analysis in `frontend/src/pages/XiPage.tsx`.

6. **Mobile Data Optimization**:
   - **Fix**: Replaced continuous 250ms socket broadcasts with authoritative timestamp synchronization (`timerEndsAt`) and local 100ms client countdowns, reducing data usage by >75% for friends on cellular networks.

---

## ⚙️ Environment Variables

### Backend (`backend/.env` or Render/Railway Dashboard):
| Variable | Required | Description | Example |
|---|---|---|---|
| `PORT` | Optional (default: 4000) | Port for the HTTP/WebSocket server | `4000` or `10000` |
| `NODE_ENV` | Recommended | Environment mode | `production` |
| `FRONTEND_URL` | Optional | Allowed CORS origins for split deploys. Leave empty for combined deploys. | `https://my-app.onrender.com` |
| `DATABASE_URL` | Optional | Supabase PostgreSQL connection string for cloud persistence. When omitted, uses `backend/data/rooms.json`. | `postgresql://postgres:...` |

### Frontend (`frontend/.env`):
| Variable | Required | Description |
|---|---|---|
| `VITE_API_URL` | Optional | Public backend origin. Leave blank on single-server deploy (Express serves Vite bundle). |
| `VITE_SOCKET_URL` | Optional | Public WebSocket origin. Leave blank on single-server deploy. |

---

## 🚀 Deployment Instructions

### Option A: Render (Combined Deployment)
1. Push this repository to GitHub.
2. In [Render Dashboard](https://dashboard.render.com), click **New +** → **Web Service**.
3. Select your GitHub repository.
4. Settings:
   - **Runtime**: `Node`
   - **Build Command**: `npm --prefix frontend install && npm --prefix frontend run build && npm --prefix backend install`
   - **Start Command**: `npm --prefix backend start`
5. Environment Variables:
   - `NODE_ENV`: `production`
   - `PORT`: `10000`
   - (Optional) `DATABASE_URL`: Your Supabase connection string.
6. Click **Deploy Web Service**.

### Option B: Docker Deployment (Render or Railway)
If deploying as a Docker container, Render/Railway uses the root `Dockerfile`:
- Context: `.` (repository root)
- Dockerfile path: `Dockerfile`
- The Dockerfile builds both frontend and backend, serves static files from `frontend/dist`, and binds to `0.0.0.0:$PORT`.

---

## 📱 Instructions for Friends to Join via Mobile Data (No Wi-Fi)

1. The Host opens the website on their mobile phone (or desktop) over their mobile data (Jio, Airtel, Vi, etc.).
2. Host enters a Manager Display Name and taps **Host New Multiplayer Room**.
3. The lobby generates a unique **6-letter Room Code** (e.g., `KT9B2A`) and a shareable invitation link (`https://YOUR-URL/join/KT9B2A`).
4. Host shares the link or code on WhatsApp or SMS with friends.
5. Friends tap the link on their mobile phones (Chrome or Safari on iOS/Android).
6. Friends enter their display names and claim their preferred franchise (CSK, MI, RCB, KKR, etc.).
7. Host selects the timer (5s, 10s, 15s) and taps **Start IPL Auction**.
8. All friends see the live auction synchronously with large touch-friendly bid buttons right at their fingertips!
