--shutdown_db.sql
select name from v$database;
shutdown immediate
exit