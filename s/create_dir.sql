-- create_dir.sql --
accept DNAME prompt 'input directory name: '
accept PNAME prompt 'input patch: '
CREATE OR REPLACE DIRECTORY &&DNAME AS '&&PNAME';