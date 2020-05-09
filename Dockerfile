FROM ubuntu:20.04

RUN apt-get update -y && apt-get install -y software-properties-common


RUN apt-get install -y wget
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key 2>/dev/null | apt-key add -
RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | apt-key add -

RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-add-repository 'deb https://apt.kitware.com/ubuntu/ focal main'

RUN echo "deb http://apt.llvm.org/focal/ llvm-toolchain-focal-9 main" >> /etc/apt/sources.list.d/llvm.list
RUN echo "deb http://apt.llvm.org/focal/ llvm-toolchain-focal-10 main" >> /etc/apt/sources.list.d/llvm.list

RUN apt-get update -y
RUN apt-get install -y kitware-archive-keyring
RUN rm -f /etc/apt/trusted.gpg.d/kitware.gpg

RUN apt-get upgrade -y && apt-get install -y cmake ninja-build valgrind git pkg-config doxygen qemu-user curl unzip gcc-9 g++-9 gcc-10 g++-10 clang-10 clang-tidy-10 clang-tools-10 gcc-powerpc-linux-gnu gcc-powerpc64-linux-gnu gcc-arm-linux-gnueabihf gcc-9-aarch64-linux-gnu gcc-9-riscv64-linux-gnu

