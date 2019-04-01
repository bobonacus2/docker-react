# build block, reference it as builder
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json ./

RUN npm install

COPY ./ ./

RUN npm run build

# production block
FROM nginx

COPY --from=builder  /app/build /usr/share/nginx/html
