#!/bin/bash
. path.sh
dest_path=$root_dir
#dest_path="/home/banbans/bbnet-scripts"
echo "----------------------------------"
echo "ChillerDragon's banbans update script"
echo "DDNet-Server (BanBansNetwork)"
echo "fecthes fresh stuff from github and builds"
echo "----------------------------------"
echo "This script fetches the $src_path/build/DDNet-Server and replaces the $dest_path/BanBans_srv"
echo "Server keeps running"
read -p "Do you really want to run it? Write 'n' to abort" inp
if [ "$inp" == "n" ]; then
exit
elif [ "$inp" == "N" ]; then
exit
elif [ "$inp" == "No" ]; then
exit
elif [ "$inp" == "no" ]; then
exit
elif [ "$inp" == "NO" ]; then
exit
fi

cd "$src_path"
mkdir -p build
cd build
git pull;
cmake -DMYSQL=ON ..
make

cd $dest_path
echo "[BACKUP] Server";
if [ ! -f BanBans_srv ]
then
    echo "skipping backup because there is no old binary"
else
    mv BanBans_srv BanBans_srv_old;
fi
echo "[UPDATE] binary";
cp $src_path/build/DDNet-Server BanBans_srv;

