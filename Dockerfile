#create from basic image adding
FROM ubantu:24.04

#making working directory
WORKDIR /myworkdir

#coping files into myworkdir
COPY . /myworkdir

#installing node.js inside it

