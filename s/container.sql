-- container.sql --
col con_id for 99
col name for a20
select name, open_mode, to_char(open_time,'YYYY-MM-DD HH24:mi') as open_time, con_id from v$containers;
