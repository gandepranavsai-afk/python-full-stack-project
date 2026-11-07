FROM node:20-alpine
WORKDIR /app

# Copy package manifests
COPY package.json package-lock.json* ./
COPY frontend/package.json frontend/package-lock.json* frontend/
COPY backend/package.json backend/package-lock.json* backend/

# Install dependencies for both frontend and backend
RUN npm --prefix frontend install && npm --prefix backend install

# Copy application sources
COPY frontend frontend
COPY backend backend

# Build frontend production bundle
RUN npm --prefix frontend run build

ENV NODE_ENV=production
WORKDIR /app/backend
EXPOSE 4000
CMD ["npx", "tsx", "src/index.ts"]
