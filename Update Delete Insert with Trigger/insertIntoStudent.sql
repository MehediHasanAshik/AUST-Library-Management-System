set verify off;
declare
	id student.s_id%TYPE;
	s_name student.name%TYPE ;
	s_dept student.department%TYPE ;
	s_email student.email%TYPE ;
	s_pass student.password%TYPE ;
	s_city student.city%TYPE;	
begin
	id := &id;
	s_name := '&s_name';
	s_dept := '&s_dept';
	s_email := '&s_email';
	s_pass := '&s_pass';
	s_city := '&s_city';

	insert into student values(id,s_name,s_dept,s_email,s_pass,s_city);
end;
/
commit;