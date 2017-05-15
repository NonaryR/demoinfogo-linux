FROM i386/ubuntu:12.04

RUN apt-get update && \
    apt-get install -y cmake libprotobuf-dev protobuf-compiler libjson-spirit-dev build-essential && \
    apt-get clean

COPY docker.sh docker.sh
COPY . demoinfogo/

WORKDIR demoinfogo/

RUN mkdir build && cd build && cmake .. -DRPATH=ON -DCMAKE_BUILD_TYPE=Release && make && \
mkdir libs && cp /usr/lib/i386-linux-gnu/libstdc++.so.6 /usr/lib/libprotobuf.so.7 /lib/i386-linux-gnu/libz.so.1 /lib/i386-linux-gnu/libgcc_s.so.1 libs