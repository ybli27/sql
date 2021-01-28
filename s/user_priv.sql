--user_priv


col GRANTED_ROLE for a30
col grantee for a40
col owner for a30
col table_name for a30
set linesize 140
select granted_role, grantee from dba_role_privs where grantee= upper('&&username');
select privilege, owner,table_name grantee from dba_tab_privs where grantee=upper('&username');
select privilege, grantee from dba_sys_privs where grantee=upper('&username');