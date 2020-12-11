-- sess.sql --
set linesize 140
col username for a15
col machine for a30
col process for a20
select sid, serial#, username, status, process, machine, state from v$session;
