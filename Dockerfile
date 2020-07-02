# first block
FROM node:alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# second block
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html