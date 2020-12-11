
## generate all  db easy login script in one server
if [ -e dblist.txt ] ; then
cat dblist.txt | awk '{print $2, $4, $5, $6, "sys", $10"_"$5"_"$12 }' | xargs -n 6 ./create_dblogin_easyconn.sh
else
echo " dblist.txt doesn't exist"
fi 

### deal with $ sign in pass.
sed -i 's/\$/\\\$/g' sapexprd*sys*.sh
sed -i 's/\$/\\\$/g' apexprd*sys*.sh 

cd ../..
mkdir ec_sh
mv scripts/shellscript/*sys*.sh ./ec_sh # move .sh scirpt to sub directory
mkdir ec_sql
mv scripts/shellscript/*sys*.sql ./ec_sql # move sql script to sub directory
#mkdir ec_bat
#mv scripts/shellscript/*sys*.bat ./ec_bat # move bat script to sub directory

#for hname in `cat scripts/shellscript/dblist.txt | awk '{print $5}' | sort | uniq`
#do mkdir -p rslist/$hname 
#cp ec_sql/*${hname}*.sql rslist/$hname 
#done

#mkdir -p rslist/prod
#cp ec_sql/*_?P???.sql rslist/prod
#mkdir -p rslist/stg
#cp ec_sql/*_?S???.sql rslist/stg
#mkdir -p rslist/dev
#cp ec_sql/*_?D???.sql rslist/dev

 
cp scripts/shellscript/runsql*.sh . 
cp scripts/shellscript/*check.sh .
cp scripts/sqlscript/*.sql .      # move general sql script to main directory
sed -i 's/sqlplus /rlwrap sqlplus /g' ./ec_sh/*.sh
