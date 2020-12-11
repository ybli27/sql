-- profile_limit_check.sql

accept LNAME prompt 'input limit name: '
select profile, resource_name, limit from dba_profiles where resource_name like upper('&LNAME');