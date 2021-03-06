#!/bin/bash
# ChillerDraon's map release script

function get_date {
  date "+%F %H:%M:%S"
}

if (( $# != 1 )); then
    echo "Usage: $0 <SQLPassword>"
    exit
fi

echo "Map will be released now: $(get_date)"
read -p "MapName: " MapName
read -p "ServerType: " SrvType
read -p "Points: " Points
read -p "Stars: " Stars
read -p "Mapper: " Mapper


echo "Is the input correct and do you really want to add that map? [y/n]"
read -n 1 -p "" inp
echo ""
if [ "$inp" == "Y" ]; then
    test
elif [ "$inp" == "y" ]; then
    test
else
    echo "Cancelled map release."
    exit
fi

echo "INSERT INTO \`record_maps\` VALUES ('$MapName','$SrvType',$((Points)),$((Stars)),'$Mapper', '$(get_date)');" | mysql -u teeworlds -p$1 teeworlds

echo "SELECT * FROM record_maps;" | mysql -u teeworlds -p$1 teeworlds
