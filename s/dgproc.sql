--dgproc.sql
select process, status, THREAD# ,  SEQUENCE# from gv$managed_standby;