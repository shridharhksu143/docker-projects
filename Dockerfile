# building a multi stage fontend projec 
# -------------------------step 1: build -----------------------------
FROM node:16-bullseye AS build

# set working directory
WORKDIR /app 

#copy package menifest and instll cash layer
COPY package*.json ./
RUN npm ci --no-audit --no-fund

#copy source
COPY . .

# Acept a build-arg for cra env var,and expose it for the build step
ARB REACT_APP_BACKEND_URL
ENV REACT_APP_BACKEND_URL=${REACT_APP_BACKEND_URL}
