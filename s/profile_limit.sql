-- profile_limit.sql
accept &PNAME prompt 'input pofile name: '
select * from dba_profiles where profile=upper('&&PNAME');