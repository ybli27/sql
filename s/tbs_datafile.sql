--tbs_datafile.sql --
select tablespace_name from dba_tablespaces;
accept TNAME prompt 'input tablespace name: '
select file_name, tablespace_name, bytes/1024/1024/1024, AUTOEXTENSIBLE from dba_data_files where tablespace_name=upper('&&TNAME');
