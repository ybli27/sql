-- fra_usage.sql
select 'FRA_PERCENT ' || sum(percent_space_used)  as used_percent from v$recovery_area_usage;