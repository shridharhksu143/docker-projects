#Initializing the docker file from golang
FROM golang:1.21-slim

#setting working directory
WORKDIR /app

#copy files into container
 COPY . /app/

 #build project
 RUN `go build` .

 # test project
 RUN `go test ./... .

 #execute the project
 RUN `./server ` .

 