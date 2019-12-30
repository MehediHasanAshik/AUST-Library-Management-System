create or replace procedure publishersearchproc2
	(v_name in VARCHAR2)
	is
	
	p_pid publisher.p_id%type;
	p_name publisher.name%type;
	p_phone publisher.phone%type;
	p_email publisher.email%type;

begin
SELECT p_id,name,phone,email into p_pid,p_name,p_phone,p_email FROM publisher 
			WHERE p_id=(SELECT p_id FROM book@site_link1 WHERE name = v_name);

dbms_output.put_line('p_id: ' || p_pid || '; ' || 'p_name: ' || p_name || '; ' || 'p_phone: ' ||p_phone|| '; ' || 'p_email: ' || p_email);

end;
/