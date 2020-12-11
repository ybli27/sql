-- tbs_size.sql --
col Tablespace for a22
col Used_MB for 99,999,999
col Free_MB for 99,999,999
col Total_MB for 99,999,999
select df.tablespace_name Tablespace, totalusedspace Used_MB,
(df.totalspace - tu.totalusedspace) Free_MB,
df.totalspace Total_MB,
round(100 * ( (df.totalspace - tu.totalusedspace)/ df.totalspace))
Pct_Free
from
(select tablespace_name,
round(sum(bytes) / 1048576) TotalSpace from dba_data_files 
group by tablespace_name) df,
(select round(sum(bytes)/(1024*1024)) totalusedspace, tablespace_name
from dba_segments group by tablespace_name) tu
where df.tablespace_name = tu.tablespace_name ;

