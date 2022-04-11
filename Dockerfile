FROM node:14 as build1
COPY . /app
WORKDIR /app
RUN yarn install
RUN yarn build

FROM httpd 
COPY --from=build1 /app/dist ./htdocs
EXPOSE 80
