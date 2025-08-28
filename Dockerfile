#create from basic image adding
FROM ubuntu:24.04

#making working directory
WORKDIR /myworkdir

#coping files into myworkdir
COPY . /myworkdir

#installing node.js inside it

