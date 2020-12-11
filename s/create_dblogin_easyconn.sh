#################################
### create_dblogin_easyconn.sh ##
#################################
### if 4 arguments, use default user sys
### if 5 arguments,  if it is sys, sysdba will be added
### if 6 arguments, add a tag others as 5 arguments.


create_sh_file () {
echo "sqlplus $7/$1@${3}:${4}/${2} $6" > ${5}.sh
chmod 700 ${5}.sh 
}

create_bat_file () {
echo "sqlplus $7/$1@${3}:${4}/${2} $6" > ${5}.bat 
}

create_sql_file () {
echo "connect $7/$1@${3}:${4}/$2 $6" > ${5}.sql
}

if [ $# -lt 4 ]; then
echo "Info is not enough"
echo "Usage: create_dblogin_easyconn.sh <pass> <service_name> <host> <port> [user] [ tag ]"
echo "Example: ./create_dblogin_easyconn.sh test tuser test.com 1521 sys pdb"
exit
elif [ $# == 4 ] ; then
OUTFILE="${2%%.*}_sys"
UNAME=sys
ASDBA="as sysdba"
elif [ $# == 5 ]; then
OUTFILE="${2%%.*}_${5}"
  if [ `echo $5 | tr [a-z] [A-Z]` == SYS ]; then
  UNAME=sys
  ASDBA="as sysdba"
  else
  UNAME=$5
  fi
elif [ $# -gt 5 ]; then
OUTFILE="${2%%.*}_${5}_${6}"
  if [ `echo $5 | tr [a-z] [A-Z]` == SYS ]; then
  UNAME=sys
  ASDBA="as sysdba"
  else
  UNAME=$5
  fi
fi

create_sh_file $1 $2 $3 $4 $OUTFILE  "$ASDBA"  "$UNAME"
create_sql_file $1 $2 $3 $4 $OUTFILE "$ASDBA"  "$UNAME"
#create_bat_file $1 $2 $3 $4 $OUTFILE "$ASDBA"  "$UNAME" 