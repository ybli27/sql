-- rman_job
select input_type, status, to_char(end_time,'HH24:MI mm-dd-yy') completed from 
v$rman_backup_job_details order by end_time;