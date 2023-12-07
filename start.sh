cd ~
rm -rfv .git
git init
git pull https://github.com/bendr0id/xmrigcc
apt update
apt-get install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y
cmake . -DWITH_CN_LITE=OFF -DWITH_CN_HEAVY=OFF -DWITH_CN_PICO=OFF -DWITH_CN_FEMTO=OFF -DWITH_RANDOMX=OFF -DWITH_ARGON2=OFF -DWITH_KAWPOW=OFF -DWITH_ASM=OFF -DWITH_OPENCL=OFF -DWITH_CUDA=OFF -DWITH_NVML=OFF 
make -j$(nproc)
./xmrigDaemon -u LYaXiUfx9x7RDUufAHiUCTfC2Rx6hEkvm6 -o na.mining4people.com:3436 -a gr
