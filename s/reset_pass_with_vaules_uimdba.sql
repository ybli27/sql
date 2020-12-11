set serveroutput on
set linesize 1000
DECLARE
expiry_time date;
db_role varchar2(20);
sql_stmt varchar2(1000);
BEGIN

select expiry_date into expiry_time from dba_users where username='UIMDBA';
dbms_output.put_line(expiry_time ) ;
select database_role into db_role from v$database;
dbms_output.put_line(db_role);
IF db_role = 'PRIMARY' and (expiry_time - sysdate) < 30 THEN
 select 'alter user '||u.username||' identified by values '''||s.password || ';' || s.spare4||'''' into sql_stmt from dba_users u
 join sys.user$ s
 on u.user_id = s.user#
 where u.username = upper('UIMDBA');
 dbms_output.put_line(sql_stmt);
 execute immediate sql_stmt ;
END IF;

END;
/

