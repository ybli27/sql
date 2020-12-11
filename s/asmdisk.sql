--asmdisk
col path for a30
set linesize 140
select name, GROUP_NUMBER,TOTAL_MB, free_mb, STATE, Path from v$asm_disk order by group_number, name;