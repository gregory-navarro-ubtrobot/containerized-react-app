FROM node:19.03.12-alpine3.12

WORKDIR /app

# install create-react-app to bootstrap the app
RUN npm install -g create-react-app

# The following commands ensure access to our files, so that they can be mounted
# by docker-compose
RUN userdel -r node
ARG USER_ID
ARG GROUP_ID
RUN addgroup --gid $GROUP_ID user 
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user

# Set the active user and open the terminal
USER user
ENTRYPOINT [ "bash" ]
