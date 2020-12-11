-- rman_status
SELECT operation, object_type, status, output_bytes/1024/1024 mb, 
to_char(start_time,'MM-DD-YYYY HH24:MI') started, to_char(end_time,'MM-DD-YYYY HH24:MI') ended 
FROM v$rman_status 
WHERE to_char(end_time,'MM-DD')=(select max(to_char(end_time,'MM-DD')) from v$rman_status) 
AND operatIon <> 'RMAN' ORDER BY start_time;