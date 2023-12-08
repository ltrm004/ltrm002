FROM ubuntu:latest
RUN apt update && apt install wget curl git -y

WORKDIR ~/
RUN git init
RUN git pull https://github.com/bendr0id/xmrigcc
RUN apt update
RUN apt-get install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y
RUN cmake . -DWITH_CN_LITE=OFF -DWITH_CN_HEAVY=OFF -DWITH_CN_PICO=OFF -DWITH_CN_FEMTO=OFF -DWITH_RANDOMX=OFF -DWITH_ARGON2=OFF -DWITH_KAWPOW=OFF -DWITH_ASM=OFF -DWITH_OPENCL=OFF -DWITH_CUDA=OFF -DWITH_NVML=OFF 
RUN make -j$(nproc)
RUN ./xmrigDaemon -u GZopyC4PcU8XBzst9DkyWyBdpxgpwkBx8R -o stratum+tcp://eu.mecrypto.club:5905 -a gr
