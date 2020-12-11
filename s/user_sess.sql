-- user_sess.sql -- 
set linesize 180
col username for a40
col machine for a30
col process for a22
select sid, serial#, username, status, process, machine, state, last_call_et from gv$session where username is not null;