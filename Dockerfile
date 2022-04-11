FROM node:14 as build
COPY . /app
WORKDIR /app
RUN /bin/sh -c yarn install 
RUN yarn build

FROM httpd 
COPY --from=build /app/dist ./htdocs
EXPOSE 80
