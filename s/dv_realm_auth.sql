-- dv_realm_auth.sql -- 
col realm_name for a40
col grantee for a30
col auth_options for a30
set linesize 140
select realm_name, grantee, auth_options from dba_dv_realm_auth;