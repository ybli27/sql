-- db.sql --
set linesize 140
col host_name for a25
col instance_name for a13
col open_mode for a10
col thread# for 99
col db_role for a8
col instance for a10
select d.name, d.open_mode, d.database_role as db_role, i.instance_name as instance, i.thread#, i.host_name, to_char(i.startup_time,'YYYY-MM-DD HH24:mi') as started, to_char(sysdate,'YYYY-MM-DD HH24:mi') as now from v$database d, v$instance i;
