-- schema_space_usage.sql
set line 140
col owner for a40
select owner, tablespace_name, sum(bytes)/1024/1024/1024 as Gb from dba_segments group by owner, tablespace_name  order by GB;
