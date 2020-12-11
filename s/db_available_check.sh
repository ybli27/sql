DATE_T=`date +%Y%m%d%H%M%S`
LOGFILE=db_available_check_${DATE_T}.log
./run_sql_easy_alldb.sh dbinfo > $LOGFILE
grep "ORA-" -B 5 $LOGFILE

