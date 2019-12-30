set serveroutput on;
create or replace procedure proof_left_side
is
	s_name student.name%TYPE;
	s_subj student.department%TYPE;
	
	cursor curStudent is 
	select name,department from student1 where department='CSE'
	UNION 
	select name,department from student2 where department='CSE';

begin
	open curStudent;
	loop
		fetch curStudent into s_name,s_subj;
		exit when curStudent%notFound;
		dbms_output.put_line('Student_Name: '|| s_name || ', Student_DEPT: '|| s_subj);
	end loop;
	close curStudent;
end proof_left_side;
/
set serveroutput on;
create or replace procedure proof_right_side
is
	s_name student.name%TYPE;
	s_subj student.department%TYPE;
	
	cursor curStudent is
	select name,department from(
	select name,department from student1
	UNION 
	select name,department from student2)
	where department='CSE';

begin
	open curStudent;
	loop
		fetch curStudent into s_name,s_subj;
		exit when curStudent%notFound;
		dbms_output.put_line('Student_Name: '|| s_name || ', Student_DEPT: '|| s_subj);
	end loop;
	close curStudent;
end proof_right_side;
/



begin
	dbms_output.put_line('[R:qR] UN [S:sQ]:');
	dbms_output.put_line('-----------------');
	proof_left_side;
	dbms_output.put_line('-------------------------------------------');
	dbms_output.put_line('[R UN S: qR or qS]:');
	dbms_output.put_line('------------------');
	proof_right_side;
	
end;
/