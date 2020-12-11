-- consize.sql --
select sum(bytes)/1024/1024 as MB, sum(bytes)/1024/1024/1024 as GB, con_id from cdb_data_files group by con_id;
