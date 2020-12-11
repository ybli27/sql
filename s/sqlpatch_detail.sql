-- check_sqlpatch_detail
SET LINESIZE 400

COLUMN action_time FORMAT A20
COLUMN action FORMAT A14
COLUMN status FORMAT A10
COLUMN description FORMAT A45
COLUMN version FORMAT A10
COLUMN bundle_series FORMAT A10

SELECT TO_CHAR(action_time, 'YYYY-MM-DD HH24:MI:SS') AS action_time,
       action,
       status,
       description,
       version,
       patch_id,
       bundle_series
FROM   sys.dba_registry_sqlpatch
ORDER by action_time;