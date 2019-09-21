# Section 1 for Build phase
FROM node:alpine as builder 

WORKDIR /app
COPY ./package.json ./
RUN npm install
COPY . .

RUN npm run build

#  Section2 for Nginx deployment.
FROM nginx
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build /usr/share/nginx/html