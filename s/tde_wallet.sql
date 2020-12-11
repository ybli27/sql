-- tde_wallet --  
set linesize 140
col inst_id for 99
col wrl_type for a10
col wrl_parameter for a30
col status for a10
col wallet_type for a10
col wallet_order for a9
col fully_backed_up for a9
col con_id for 99
select * from gv$encryption_wallet;