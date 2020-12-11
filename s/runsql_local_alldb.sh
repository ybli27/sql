### runsql_lc.sh ##

if [ $# -lt 1 ]; then
echo "Info is not enough"
echo "Usage: runsql_local_alldb.sh <sql name> "
echo "Example: runsql_local_alldb.sh db_check.sql"
exit
fi

OUTPUTFILE=runsql_lc_detail.sh
SCRIPTFILE=$1
rm  $OUTPUTFILE
for f in *_local.sh ; do
echo 'echo "--------------------------------------------------------------------------"' >> $OUTPUTFILE
 echo "echo \"-- database work start: $f --\" " >> $OUTPUTFILE
 echo 'echo "-------------------------------------------------------------------------"' >> $OUTPUTFILE
 echo "./$f $SCRIPTFILE" >> $OUTPUTFILE
 done
 chmod 755 $OUTPUTFILE  
 ./$OUTPUTFILE
