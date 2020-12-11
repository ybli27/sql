select name, open_mode, to_char(open_time,'YYYY-MM-DD HH24:mi') as open_time, con_id from v$containers;
