### runsql_ez.sh ##

if [ $# -lt 1 ]; then
echo "Info is not enough"
echo "Usage: runsql_ez.sh  <sql name> [pattern] "
echo "Example: runsql_ez.sh db_check.sql \*sys\*pdb\*.sql"
echo " patterns: \*sys\*.sql -- all db; \*sys\*pdb5\*.sql -- all pdb"
echo " \*sys\*cdb5\*.sql -- all cdb ; \*sys\*12c5\*.sql -- all standalong"
echo " rslist/prod/\*sys\* -- runsql list"
exit
fi

if [ $# -eq 2 ]; then
PATTERN=$2
else 
PATTERN="*sys*.sql"
fi


OUTPUTFILE=runsql_ez_detail.sql
SCRIPTFILE=$1
rm  $OUTPUTFILE
for f in ${PATTERN}; do
 echo " prompt ##################################################################" >> $OUTPUTFILE
 echo " prompt ### database work start: $f ###" >> $OUTPUTFILE
 echo " prompt ##################################################################" >> $OUTPUTFILE
 echo "@$f" >> $OUTPUTFILE
 echo "@$SCRIPTFILE" >>  $OUTPUTFILE
 done
 echo "exit" >> $OUTPUTFILE
 sqlplus -S /nolog @$OUTPUTFILE  
 
