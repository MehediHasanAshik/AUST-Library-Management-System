CREATE OR REPLACE procedure proc3(p_name IN OUT varchar2 ) 
	IS

	b_bid book.b_id%type;
	b_name book.name%type;
	b_pid book.p_id%type;
	b_availability book.availability%type;
	
	CURSOR bookinfo_cursor IS 
		SELECT b_id,name,p_id,availability FROM book@site_link2
		WHERE p_id=(SELECT p_id FROM publisher WHERE name=p_name);	
	
		
BEGIN
	OPEN bookinfo_cursor;

	LOOP
		FETCH bookinfo_cursor INTO b_bid, b_name, b_pid, b_availability;
			EXIT WHEN bookinfo_cursor%NOTFOUND;
		dbms_output.put_line(b_bid || ' ' || b_name || ' ' ||b_pid || ' ' || b_availability);


	END LOOP;

	CLOSE bookinfo_cursor;

END;
/
