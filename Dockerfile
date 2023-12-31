FROM node:alpine as build
WORKDIR /app/my-portfolio
COPY . .
RUN npm i; npm install react-icons;npm install axios; npm run build; 


# # Stage 2: serve app with nginx
FROM nginx:alpine
COPY --from=build /app/my-portfolio/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
EXPOSE 3000
CMD ["nginx", "-g", "daemon off;"]
