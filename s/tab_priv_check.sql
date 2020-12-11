-- tab_priv_check.sql
accept TNAME prompt 'Please input tab name: '
select grantee, table_name, privilege from dba_tab_privs where table_name like upper('&TNAME') ;