FROM node:latest

# Set the working directory
WORKDIR /app

EXPOSE 3000

CMD [ "npm", "start"]
