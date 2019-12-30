create or replace procedure booksearchproc1
	(v_name in VARCHAR2)
	IS
	
	v_bid book.b_id%type;
	v_pid book.p_id%type;
	v_availability book.availability%type;

begin
SELECT b_id,p_id,availability into v_bid,v_pid,v_availability FROM book2@site_link2
WHERE name=v_name;

dbms_output.put_line(v_bid || ' ' || v_name || ' ' ||v_pid || ' ' || v_availability);

end;
/