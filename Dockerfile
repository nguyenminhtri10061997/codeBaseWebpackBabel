# build environment
FROM node:alpine as build-stage
# set working directory
RUN mkdir /usr/app
# copy all file from current dicrectory to docker
COPY . /usr/app

WORKDIR /usr/app

RUN echo "Asia/Jakarta" > /etc/timezone
RUN npm i --silent
RUN rm -rf .npmrc
ENV PATH /usr/src/app/node_modules/.bin:$PATH
RUN npm run buildProduct --silent

# copy app build to nginx
FROM nginx:alpine
# set working directory to nginx app public
WORKDIR /usr/share/nginx/html

# remove default nginx static assets
RUN rm -rf ./*

# copy app from builder to . (current dir => WORKDIR /usr/share/nginx/html)
COPY --from=build-stage /usr/app/dist .

# containers run nginx with global dicrectives and daemon off
CMD ["nginx", "-g", "daemon off;"]
