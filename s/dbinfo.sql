--dbinfo.sql
set linesize 160
col host for a32
col instance_name for a13
col db_role for a8
col instance for a13
col service for a30
col name for a20  
col db_unique_name fro a20
set pagesize 100
select d.name as name , d.db_unique_name, i.host_name as host, i.instance_name as instance, p.value as service, d.database_role as db_role, i.version ,d.cdb  
from v$database d, v$instance i, v$parameter p 
where p.name='service_names'
union
select vp.name as name, d.db_unique_name, i.host_name as host, i.instance_name as instance, cs.name as service, d.database_role as db_role, i.version , 'pdb' as cdb  
from v$database d, v$instance i, v$pdbs vp, cdb_services cs
where cs.con_id = vp.con_id and cs.name not like '%$%'
order by name ;

