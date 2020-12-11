-- grant_schema_tables_to_grantee.sql 

Begin
	for rec in (select owner, table_name from dba_tables  where OWNER in ('&Schema'))
	Loop
		execute immediate 'grant select on '||Rec.Owner ||'.'|| rec.table_name ||' to &grantee';
	End Loop;
End;
/