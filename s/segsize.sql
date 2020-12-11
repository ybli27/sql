col global_name for a30
select global_name, sum(bytes)/1024/1024/1024 as seg_size_GB from dba_segments, global_name where segment_type not in ('TYPE2 UNDO','ROLLBACK') group by global_name ;



