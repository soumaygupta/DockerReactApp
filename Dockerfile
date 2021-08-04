FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
#Used to expose port for Docker interaction in elastic beanstalk
COPY --from=0 /app/build /usr/share/nginx/html
