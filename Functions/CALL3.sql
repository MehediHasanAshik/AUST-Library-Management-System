set serveroutput on;

DECLARE
v_msg VARCHAR2(100);
x VARCHAR2(30) :='Asaduzzaman';


begin

dbms_output.put_line('All books of' || x || ':');
proc3(x);

end;
/