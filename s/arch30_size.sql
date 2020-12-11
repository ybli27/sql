--  arch30_size
select sum(blocks*block_size)/2014/1024/1024 GB_size from  (select  distinct THREAD# , SEQUENCE#,  blocks, block_size from v$archived_log where first_time > sysdate - 30) ; 
