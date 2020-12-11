--reset_pass_with_values.sql
set linesize 1000
set page off
spool reset_pass.sql
select 'alter user '||u.username||' identified by values '''||s.password || ';' || s.spare4||''';' cmd
 from dba_users u
 join sys.user$ s
 on u.user_id = s.user#
 where u.username = upper('&username');
 spool off
 @reset_pass.sql
