# Containerized React App
This repo outlines the steps to create a containerized React app using Docker.
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

## Launch a React Development Server
Run the following commands to build and launch the image described in the Dockerfile `Dev.Dockerfile`.

The first command builds the image and the second command launches the image. The third command launches a React development server.

1. `docker build -f ./Dev.Dockerfile -t react-app:dev <app directory name selected earlier>`
2. `docker run -it -v $(pwd)/<app directory name selected earlier>:/app -p 3000:3000 react-app:dev`

## To build a production image from an existing React app [UNFINISHED] [UNTESTED]
Run the following commands to build and launch the image described in the Dockerfile `Prod.Dockerfile`.

The first command builds the image and the second command launches the image.

1. `docker build -f ./Prod.Dockerfile -t react-app:prod <app directory name selected earlier>`
2. `docker run -it -p 80:80 react-app:prod`
