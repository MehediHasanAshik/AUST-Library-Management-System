set serveroutput on;

ACCEPT xx NUMBER PROMPT 'Press 1 to UPDATE , Press 2 to DELETE: ';
ACCEPT idid NUMBER(38) PROMPT 'Enter student id to UPDATE city from Gulshan to Dhanmondi: ';

declare
	x NUMBER := &xx;
	id NUMBER(38) := &idid;	
begin
	IF x = 1 THEN
		UPDATE student1 SET city = 'Dhanmondi' WHERE s_id = id;
		DELETE FROM student1 WHERE s_id = id;
		DELETE FROM student1@site_link1 WHERE s_id = id;
	ELSE
		DELETE FROM student1 WHERE s_id = id;
		DELETE FROM student1@site_link1 WHERE s_id = id;
		DELETE FROM student WHERE s_id = id;
	END IF;
end;
/
commit;