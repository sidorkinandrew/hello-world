cat > gstart.sh <<"EOF"
#if it worked for you, feel free to use it = think of donating any amount you wish
#BTC: 1HRjjHByNL2enV1eRR1RkN698tucecL6FA
#!/bin/bash
THEDELAY=15
STRTM=strt
echo "#!/bin/sh">$STRTM
for pair in `BTS DGB LTC`
do
echo  "apps:">$pair.yaml
    echo "  - script : ./gunthy-linuxx64">>$pair.yaml
    echo "    name : '$pair'">>$pair.yaml
    echo "    args : BTC_$pair poloniex">>$pair.yaml
    echo "pm2 start cfg/$pair.yaml">>$STRTM
    echo "sleep $THEDELAY">>$STRTM
done
echo "pm2 save">>$STRTM

EOF
