## configure_dot_setsid.sh ##
echo "echo \"DBs in oratab \""  > .setsid
echo "cat /etc/oratab | grep -v '^#' | grep -v '^\$' | awk -F: '{print \$1 }'  | sort | awk '{printf \" \" \$0}' " >> .setsid
echo "echo \" \" " >> .setsid
echo "echo \"input DB name\" " >> .setsid
echo ". oraenv " >> .setsid
cp .setsid /home/oracle
echo "alias setsid='. /home/oracle/.setsid'" >> /home/oracle/.bash_profile 