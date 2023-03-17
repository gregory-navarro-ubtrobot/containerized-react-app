FROM node:19.03.12-alpine3.12

# Set the working directory
WORKDIR /app

EXPOSE 3000

CMD [ "npm", "start"]
