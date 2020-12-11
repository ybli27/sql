
## generate db local login script in one server
 
ps -ef | grep pmon | grep -v "\-MGMT" | grep -v "+ASM" | awk '{print $8}'| cut -d '_' -f 3 | grep -v grep | sort | while read line 
do
./create_dblocal_login.sh $line 
done 
 


## generate db loca login script in one server with pass
#if [ -e dblist.txt ] ; then
#cat dblist.txt | grep -i ${HOSTNAME%%\.*} |  awk '{print $3, $2}' | xargs -n 2 ./create_dblocal_login.sh 
#else
#echo " dblist.txt doesn't exist"

#fi

## generate db easy login script in one server
if [ -e dblist.txt ] ; then
cat dblist.txt | grep -i ${HOSTNAME%%.*}  | awk '{print $2, $4, $5, $6, "sys",  $10"_"$5"_"$12 }' | xargs -n 6 ./create_dblogin_easyconn.sh
else
echo " dblist.txt doesn't exist"
fi 

### deal with $ sign in pass.
sed -i 's/\$/\\\$/g' sapexprd*_sys*.sh
sed -i 's/\$/\\\$/g' apexprd*_sys*.sh 

cd ../..
mv scripts/shellscript/*local.sh .
mv scripts/shellscript/*sys*.sh .
mv scripts/shellscript/*sys*.sql .
cp scripts/shellscript/runsql*.sh .
cp scripts/sqlscript/*.sql .

