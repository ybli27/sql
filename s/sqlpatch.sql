-- check_sqlpatch.sql --
set linesize 140
SELECT patch_id, version, status, bundle_id, bundle_series FROM dba_registry_sqlpatch;  