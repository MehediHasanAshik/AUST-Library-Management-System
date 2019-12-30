CREATE OR REPLACE procedure proc4(b_name IN OUT varchar2 ) 
	IS

	s_sid student.s_id%type;
	s_name student.name%type;
	s_dept student.department%type;
	s_email student.email%type;
	
	CURSOR studentinfo_cursor IS 
		SELECT s_id,name,department,email FROM student 
			WHERE s_id=(SELECT s_id FROM assign
				 WHERE b_id=(SELECT b_id FROM book@site_link2
					WHERE name = b_name));	
	
		
BEGIN
	OPEN studentinfo_cursor;

	LOOP
		FETCH studentinfo_cursor INTO s_sid, s_name, s_dept, s_email;
			EXIT WHEN studentinfo_cursor%NOTFOUND;
		dbms_output.put_line(s_sid || ' ' || s_name || ' ' ||s_dept || ' ' || s_email);


	END LOOP;

	CLOSE studentinfo_cursor;

END;
/