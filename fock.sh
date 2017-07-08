
#!/bin/bash
# apt-get install curl -y
# run with 
# curl -sL https://raw.githubusercontent.com/dyvosvit/hello-world/master/fock.sh | bash -
trap '' SIGINT
trap ''  SIGQUIT
trap '' SIGTSTP
TMPLDR="/opt/unzip-tmp"
GB_FDRNAME="Gunbot3.3.2"
GB_FLNAME="GUNBOT_v3.3.2_Poloniex_Bittrex_Patch"
MYPAIRS="currencies.txt"
https://raw.githubusercontent.com/dyvosvit/hello-world/master/mypairs > /opt/gunbot/cfg/$MYPAIRS
