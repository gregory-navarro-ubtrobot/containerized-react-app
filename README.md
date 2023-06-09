# Containerized React App Development Server + ROS2

This repo outlines the steps to launch two containers with docker compose.

`react-dev-server`
- React app development server running on port 3000 
- sources code from the host machine, the mounted volume is defined in the docker-compose.yaml file

`ros2`
- ROS2 development server running a ros2 web bridge on port 9090
- arbitrary ROS2 commands can be issued this container by running `docker exec` commands to access a bash shell

These should run on both Linux and MacOS.

## Prerequisites
- Docker

## Create a React app
Run the following commands to build and launch the image described in the Dockerfile `Setup.Dockerfile`.

The first command builds the image and the second command launches the image. The third command creates a React app named 'my-app' in the current directory.

1. `docker build --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) -t react-app-setup - < ./Setup.Dockerfile` note: if you are on MacOS, you might find the Group ID is 20 instead of 1000, just comment out the `addgroup` line in the Dockerfile
2. `docker run -it -v $(pwd):/app react-app-setup`
3. `npx create-react-app my-app`
4. `cd my-app` and install any dependencies you need
5. `exit` to exit the container

Note: If more dependencies are needed, they can be added using the `react-app-setup` image.

## Launch a React Development Server in a container
Run the following commands to build and launch the image described in the Dockerfile `Dev.Dockerfile`.

The first command builds the image and the second command launches the image. The third command launches a React development server.

1. `docker build -f ./Dev.Dockerfile -t react-app:dev <app directory name selected earlier>`
2. `docker run -it -v $(pwd)/<app directory name selected earlier>:/app -p 3000:3000 react-app:dev`

## Launch a React Development Server for an existing react app with docker compose
After initializing a react app, run the following commands to build and launch the development environment.

1. `docker-compose up --build`

If everything is working, you should be able to navigate to `localhost:3000` and see the React app.

## Launch a production image for an existing React app [UNFINISHED] [UNTESTED]
Run the following commands to build and launch the image described in the Dockerfile `Prod.Dockerfile`.

The first command builds the image and the second command launches the image.

1. `docker build -f ./Prod.Dockerfile -t react-app:prod <app directory name selected earlier>`
2. `docker run -it -p 80:80 react-app:prod`
