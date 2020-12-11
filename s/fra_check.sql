-- fra_check.sql
select 'FRA_PERCENT ' || sum(percent_space_used)  as used_percent from v$recovery_area_usage;
select 'FRA_PERCENT ' || sum(percent_space_used)  as used_percent from v$recovery_area_usage having sum(percent_space_used) > 85 ;
