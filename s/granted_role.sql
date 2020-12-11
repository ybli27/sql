-- granted_role --
set linesize 140
col grantee for a15
select grantee, granted_role,default_role  from dba_role_privs where grantee like upper('&usernmae.%'); 
