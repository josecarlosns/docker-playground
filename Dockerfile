# First phase: build
FROM node:alpine as builder
WORKDIR /app
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build

# Second phase: deployment
FROM nginx
COPY --from=builder /app/build /ush/share/nginx/html/webproj
