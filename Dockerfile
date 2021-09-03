FROM ubuntu:impish-20210827
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y cmake git g++ gfortran doxygen graphviz bash rsync curl

