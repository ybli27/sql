--reset_pass_with_values.sql
set linesize 1000
select u.username
 ,'alter user '||u.username||' identified by values '''||s.password || ';' || s.spare4||''';' cmd
 from dba_users u
 join sys.user$ s
 on u.user_id = s.user#
 where u.username = upper('&username');
