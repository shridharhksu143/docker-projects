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
ARG REACT_APP_BACKEND_URL

ENV REACT_APP_BACKEND_URL=${REACT_APP_BACKEND_URL}


# build the production specific files
RUN npm run build
# ---------- Stage 2: serve with nginx ----------
FROM nginx:alpine

# Remove default nginx content (optional/clean)
RUN rm -rf /usr/share/nginx/html/*

# Copy built static files from build stage
COPY --from=build /app/build /usr/share/nginx/html

# (Optional) Provide a custom nginx config — if you need SPA routing.
# COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

# Expose nginx port
EXPOSE 80

# Start nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
