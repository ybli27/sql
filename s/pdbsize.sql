-- pdbsize.sql --
col pdb_name for a20
select sum(bytes)/1024/1024 as MB, sum(bytes)/1024/1024/1024 as GB, pdb_name  from cdb_data_files cdf, cdb_pdbs cp where cdf.con_id=cp.pdb_id group by pdb_name;
