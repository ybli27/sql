####################################
## script name: runsql_dblist.sh   
## purpose: run sql script against a dblist file
## dblist file: need have patten to locat individual dblogin script max 3 pattern.
## ##############

## check if dblist file provided
if [ $# -lt 1 ]; then
echo " no input db list file"
echo "Usage: runsql_dblist.sh  "
echo "Example: runsql_dblist.sh <dblist file> [sql script]"
exit
fi

DATE_T=`date +%Y%m%d%H%M%S`

## check if sql script file provided and if did, put it into temp sql file
if [ $# -lt 2 ]; then
 echo "exit" > runsql_dblist_tempsql_${DATE_T}.sql
else
 echo @$2 > runsql_dblist_tempsql_${DATE_T}.sql
 echo "exit" >> runsql_dblist_tempsql_${DATE_T}.sql
 #cat runsql_dblist_tempsql_${DATE_T}.sql
fi

#echo $1 $2

# check if provided dblist file exist
if [ ! -e $1 ] ; then
echo " db list file $1 doesn't exist"
exit
fi

## go through the list
cat $1 | grep -v "^#" | while read -a line
do
 echo "#####################################"	
 echo ${line[0]} ${line[1]} ${line[2]}
 echo "#####################################"
 if [ ! -z ${line[2]} ];
 then
   ls -1 ../ins/ec_sh/*.sh | grep ${line[0]} | grep  ${line[1]} | grep ${line[2]}
   if [ `ls -1 ../ins/ec_sh/*.sh | grep ${line[0]} | grep  ${line[1]} | grep ${line[2]} | wc -l` = 1 ] ;
        then
	DBLOGIN=`ls -1 ../ins/ec_sh/*.sh | grep ${line[0]} | grep  ${line[1]} | grep ${line[2]}`
	#echo $DBLOGIN
	CMD=`cat $DBLOGIN`
	#echo $CMD 
	$CMD @runsql_dblist_tempsql_${DATE_T}.sql
   fi
 elif [ ! -z ${line[1]} ];
 then
	ls -1 ../ins/ec_sh/*.sh | grep ${line[0]} | grep  ${line[1]}
   if [ `ls -1 ../ins/ec_sh/*.sh | grep ${line[0]} | grep  ${line[1]} | wc -l` = 1 ] ;
        then
        DBLOGIN=`ls -1 ../ins/ec_sh/*.sh | grep ${line[0]} | grep  ${line[1]}`
	#echo $DBLOGIN
        CMD=`cat $DBLOGIN`
        #echo $CMD
	$CMD @runsql_dblist_tempsql_${DATE_T}.sql
   fi

 elif [ ! -z ${line[0]} ];
 then
	ls -1 ../ins/ec_sh/*.sh | grep ${line[0]} 
   if [ `ls -1 ../ins/ec_sh/*.sh | grep ${line[0]} | wc -l` = 1 ] ;
        then
        DBLOGIN=`ls -1 ../ins/ec_sh/*.sh | grep ${line[0]} `
	#echo $DBLOGIN
        CMD=`cat $DBLOGIN`
        #echo $CMD
	$CMD @runsql_dblist_tempsql_${DATE_T}.sql
   fi

 fi
done

rm runsql_dblist_tempsql_${DATE_T}.sql
