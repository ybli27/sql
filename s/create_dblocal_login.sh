### create_dblocal_login.sh

FNAME=$1_local.sh 
echo "export ORAENV_ASK=NO" > $FNAME
echo "export ORACLE_SID=$1" >> $FNAME
echo ". oraenv " >> $FNAME
echo "export ORAENV_ASK=YES" >> $FNAME

## add run script feature
echo 'if [ ! -z $1 ] ' >> $FNAME
echo 'then SCRIPT="@$1"' >> $FNAME
echo 'fi' >> $FNAME 

if [ $# -lt 1 ]; then
echo "Info is not enough"
echo "Usage: create_dblocal_login.sh  <service_name> [pass] "
echo "Example: ./create_dblocal_login.sh test syspass"
exit
fi

if [ ! -z $2 ] 
then
echo "sqlplus sys/$2 as sysdba \$SCRIPT" >> $FNAME
else
echo "sqlplus / as sysdba \$SCRIPT"  >> $FNAME
fi
chmod 700 $FNAME 