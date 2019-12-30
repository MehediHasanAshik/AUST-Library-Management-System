set serveroutput on;

DECLARE
v_msg VARCHAR2(100);
x VARCHAR2(30) :='Compiler';
begin
proc4(x);
dbms_output.put_line(x);

end;
/