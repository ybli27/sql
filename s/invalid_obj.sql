col object_name for a40
col owner for a40
set linesize 140 
select object_name , owner from dba_objects where
owner in (
'SYS',
'SYSTEM')
and status='INVALID'