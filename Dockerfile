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
FROM node:16-bullseye AS test

# set working dir
WORKDIR /app
	
# Remove default nginx content (optional/clean)
RUN npn install -g serve


# Copy built static files from build stage
COPY --from=build /app/build /app/build

# (Optional) Provide a custom nginx config — if you need SPA routing.
# COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

# Expose nginx port
EXPOSE 5000

# Start nginx in foreground
CMD ["serve", "-s", "build", "-l", "5000"]
