create or replace procedure AccessFunc
	(s_name in VARCHAR2)
	IS
	
	s_sid student2.s_id%type;
	s_dept student2.department%type;
	s_city student2.city%type;

begin
SELECT s_id,department,city into s_sid,s_dept,s_city FROM student2@site_link2 WHERE name=s_name;

dbms_output.put_line(s_sid || ' ' || s_dept || ' ' ||s_city);

end AccessFunc;
/
