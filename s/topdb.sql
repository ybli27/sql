-- topdb
select pdb_name from cdb_pdbs;
accept PDB prompt 'input pdb name: '
alter session set container=&&PDB;