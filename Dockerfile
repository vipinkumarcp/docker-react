#tagging this phase a builder --for static content
FROM node:18-alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


#starting sechond phase

FROM nginx

#coy builf folder from previous phase .no need nginx start command nginx take caew

COPY --from=builder /app/build /usr/share/nginx/html