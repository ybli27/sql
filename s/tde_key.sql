-- tde_key.sql --
set linesize 140
col key_id for a55
col creator_dbname  for a15
col creator_pdbname for a15
select CON_ID,KEY_ID,KEYSTORE_TYPE,CREATOR_DBNAME,CREATOR_PDBNAME from v$encryption_keys;
