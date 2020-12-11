-- asmdg.sql
col name for a10
set linesize 140
select name, group_number, total_mb, total_mb - free_mb as used_mb, free_mb, state from v$asm_diskgroup;