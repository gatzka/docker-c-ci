FROM ubuntu:19.10

RUN apt-get update -y && apt-get install -y software-properties-common


RUN apt-get install -y wget
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key 2>/dev/null | apt-key add -
RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | apt-key add -

#RUN add-apt-repository ppa:ubuntu-toolchain-r/test
#RUN apt-add-repository 'deb https://apt.kitware.com/ubuntu/ eoan main'

RUN echo "deb http://apt.llvm.org/eoan/ llvm-toolchain-eoan-9 main" >> /etc/apt/sources.list.d/llvm.list
RUN echo "deb http://apt.llvm.org/eoan/ llvm-toolchain-eoan-10 main" >> /etc/apt/sources.list.d/llvm.list


RUN apt-get update -y && apt-get upgrade -y && apt-get install -y cmake ninja-build valgrind git pkg-config doxygen qemu-user curl unzip gcc-9 g++-9 clang-10 clang-tidy-10 clang-tools-10 gcc-powerpc-linux-gnu gcc-powerpc64-linux-gnu gcc-arm-linux-gnueabihf gcc-9-aarch64-linux-gnu

