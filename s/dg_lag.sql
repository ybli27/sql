
set serveroutput on
declare
MAX_NUM_APPLIED_LOG number(10) ;
MAX_NUM_ARCHIVED_LOG number(10) ;
LAG number;

begin
     select max(sequence#) into MAX_NUM_APPLIED_LOG from v$archived_log 
     where  thread#=1 and applied='YES'  ;
     select max(sequence#) into MAX_NUM_ARCHIVED_LOG from v$archived_log 
     where thread#=1 and applied <> 'YES' ;
     LAG := MAX_NUM_ARCHIVED_LOG -  MAX_NUM_APPLIED_LOG;
     
     if LAG > 1 Then
     dbms_output.put_line('LAG_ATTENSION ' || LAG );  
     end if;
       
     select max(sequence#) into MAX_NUM_APPLIED_LOG from v$archived_log 
     where  thread#=2 and applied='YES'  ;
     select max(sequence#) into MAX_NUM_ARCHIVED_LOG from v$archived_log 
     where thread#=2 and applied <> 'YES' ;
     LAG := MAX_NUM_ARCHIVED_LOG -  MAX_NUM_APPLIED_LOG;
     
     if LAG > 1 Then
     dbms_output.put_line('LAG_ATTENSION ' || LAG );  
     end if;   
     --dbms_output.put_line( MAX_NUM_ARCHIVED_LOG || ' , ' || MAX_NUM_APPLIED_LOG  )  ;
end ;
/