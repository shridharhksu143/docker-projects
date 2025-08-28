# building a multi stage fontend projec 
# -------------------------step 1: build -----------------------------
FROM node:16-bullseye AS build

# set working directory
WORKDIR /app 
