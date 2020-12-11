-- user --
set linesize 140
col username for a15
col account_status for a20
col profile for a15
col default_tbs for a10
col temp_tbs for a10
select username, account_status, lock_date, expiry_date, profile, default_tablespace as default_tbs, temporary_tablespace as temp_tbs from dba_users;
