#Initializing the docker file from golang
FROM golang:1.16

#setting working directory
WORKDIR /app

#copy files into container
 COPY . /app/

 #build project
 RUN go build -o server .

 # test project
 RUN go test ./...

 #execute the project
 ENTRYPOINT ["./server"]

