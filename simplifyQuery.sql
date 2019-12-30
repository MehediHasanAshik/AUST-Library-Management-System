set serveroutput on;
create or replace procedure withoutSimplify
is
	s_name student.name%TYPE;
	s_subj student.department%TYPE;
	
	cursor curSim is 
	select student.name,student.department from student inner join assign on student.s_id=assign.s_id where assign.ass_date = '8 July';

begin
	open curSim;
	loop
		fetch curSim into s_name,s_subj;
		exit when curSim%notFound;
		dbms_output.put_line('Student_Name: '|| s_name || ', Student_DEPT: '|| s_subj);
	end loop;
	close curSim;
end withoutSimplify;
/

create or replace procedure withSimplify
is
	stu_id student.s_id%TYPE;
	s_name student.name%TYPE;
	s_subj student.department%TYPE;
	
	cursor curWithSim is 
	WITH ABC as (SELECT s_id, name, department FROM student)
	SELECT name, department FROM ABC 
	INNER JOIN 
    (SELECT s_id FROM assign WHERE ass_date='8 July') DEFG 
	ON ABC.s_id=DEFG.s_id;
begin
	open curWithSim;
	loop
		fetch curWithSim into s_name,s_subj;
		exit when curWithSim%notFound;
		dbms_output.put_line('Student_Name: '|| s_name || ', Student_DEPT: '|| s_subj);
	end loop;
	close curWithSim;
end withSimplify;
/


begin
	dbms_output.put_line('BEFORE SIMPLIFY:');
	dbms_output.put_line('-----------------');
	withoutSimplify;
	dbms_output.put_line('-------------------------------------------');
	dbms_output.put_line('AFTER SIMPLIFY:');
	dbms_output.put_line('------------------');
	withSimplify;
	
end;
/