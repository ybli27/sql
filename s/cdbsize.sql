-- cdbsize.sql -- 
 select sum(bytes)/1024/1024 as MB, sum(bytes)/1024/1024/1024 as GB  from cdb_data_files;