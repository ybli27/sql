-- tbs_segment.sql --
set linesize 140
col segment_name for a30
accept TBS prompt 'input tablespace name: '
select segment_name, segment_type, segment_subtype, tablespace_name from dba_segments where tablespace_name=upper('&&TBS');
