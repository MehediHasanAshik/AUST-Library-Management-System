set serveroutput on;
set verify off;

ACCEPT xx NUMBER PROMPT 'Press 1 for Gulshan , Press 2 for Dhanmondi, Press 3 to See All: ';

declare
	x NUMBER := &xx;
	s_sid student.s_id%type;
	s_name student.name%type;
	s_dept student.department%type;
	s_email student.email%type;
	s_password student.password%type;
	s_city student.city%type;
	
	CURSOR studentinfo_cursor1 IS 
			select s_id, name, department, email, password, city from student1@site_link1;
	CURSOR studentinfo_cursor2 IS
			select s_id, name, department, email, password, city from student2@site_link2;
	CURSOR studentinfo_cursor3 IS
			(select s_id, name, department, email, password, city from student1@site_link1)
			UNION
			(select s_id, name, department, email, password, city from student2@site_link2);
begin
	
	IF x = 1 THEN
		OPEN studentinfo_cursor1;
		LOOP
			FETCH studentinfo_cursor1 INTO s_sid, s_name, s_dept, s_email, s_password, s_city;
			EXIT WHEN studentinfo_cursor1%NOTFOUND;
			dbms_output.put_line(s_sid || ' ' || s_name || ' ' ||s_dept || ' ' || s_email || ' ' || s_password || ' ' || s_city);


		END LOOP;
		CLOSE studentinfo_cursor1;
	ELSIF x = 2 THEN
		OPEN studentinfo_cursor2;
		LOOP
			FETCH studentinfo_cursor2 INTO s_sid, s_name, s_dept, s_email, s_password, s_city;
			EXIT WHEN studentinfo_cursor2%NOTFOUND;
			dbms_output.put_line(s_sid || ' ' || s_name || ' ' ||s_dept || ' ' || s_email || ' ' || s_password || ' ' || s_city);


		END LOOP;	
		CLOSE studentinfo_cursor2;
	ELSE
		OPEN studentinfo_cursor3;
		LOOP
			FETCH studentinfo_cursor3 INTO s_sid, s_name, s_dept, s_email, s_password, s_city;
			EXIT WHEN studentinfo_cursor3%NOTFOUND;
			dbms_output.put_line(s_sid || ' ' || s_name || ' ' ||s_dept || ' ' || s_email || ' ' || s_password || ' ' || s_city);


		END LOOP;
		CLOSE studentinfo_cursor3;
	END IF;
	
	
	
end;
/
commit;



