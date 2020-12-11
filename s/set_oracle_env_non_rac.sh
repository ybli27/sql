## setup oracle environment non rac
echo "alias trace='cd \$ORACLE_BASE/diag/rdbms/\$ORACLE_SID/\$ORACLE_SID/trace'" >> /home/oracle/.bash_profile
echo "alias tnstrace='cd \$ORACLE_BASE/diag/tnslsnr/\${HOSTNAME%%\.*}/listener/trace'" >> /home/oracle/.bash_profile


 