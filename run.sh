for file_name in *-config.js ; do
   file_name_array=(${file_name//"-"/ })
   exchange="${file_name_array[0]}"
   currency_pair="${file_name_array[1]}"
   echo "pm2 start --name $currency_pair ./gunthy-linuxx64 -- $currency_pair $exchange"
done
