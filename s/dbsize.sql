-- dbsize --
 select sum(bytes)/1024/1024 as MB, sum(bytes)/1024/1024/1024 as GB  from dba_data_files;
 