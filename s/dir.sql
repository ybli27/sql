-- dir.sql  --
set linesize 140
col owner for a20
col directory_name for a25
col directory_path for a60
select * from dba_directories;