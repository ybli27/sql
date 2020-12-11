---- find user to access a schema data
-- schema_access.sql
select username from dba_users;
accept UNAME prompt 'input schema name: '
select distinct grantee from dba_tab_privs 
where owner=upper('&&UNAME') and exists (select * from dba_users where username=grantee);

select distinct drp.grantee from dba_role_privs  drp
where  granted_role in 
( select distinct dtp.grantee from dba_tab_privs  dtp
  where owner=upper('&&UNAME') and exists (select * from dba_roles where role=dtp.grantee) )
;