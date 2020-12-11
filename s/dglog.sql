--dglog.sql
set linesize 140
-- the only check sequence# greater than max applied # to remove appearance of old entry due to switchover or failover 
select max(sequence#), thread#,  applied 
from v$archived_log val1
where sequence# >=  ( select max(sequence# ) from v$archived_log val2 where applied = 'YES' and val2.thread#=val1.thread#)
group by  thread#, applied order by thread#;