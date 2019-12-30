set serveroutput on;

ACCEPT xx NUMBER PROMPT 'Press 1 to See Education, Press 2 to See General Knowledge Book, Press 3 to See All Typos Books: ';

declare
	x NUMBER := &xx;
	b_bid book.b_id%type;
	b_name book.name%type;
	b_pid book.p_id%type;
	b_availability book.availability%type;
	
	CURSOR bookinfo_cursor1 IS 
		SELECT b_id,name,p_id,availability FROM book1@site_link1;
	CURSOR bookinfo_cursor2 IS 
		SELECT b_id,name,p_id,availability FROM book2@site_link2;
	CURSOR bookinfo_cursor3 IS 
		(SELECT b_id,name,p_id,availability FROM book1@site_link1)
		UNION
		(SELECT b_id,name,p_id,availability FROM book2@site_link2);
	
begin
	IF x = 1 THEN
		OPEN bookinfo_cursor1;

		LOOP
			FETCH bookinfo_cursor1 INTO b_bid, b_name, b_pid, b_availability;
			EXIT WHEN bookinfo_cursor1%NOTFOUND;
			dbms_output.put_line(b_bid || ' ' || b_name || ' ' ||b_pid || ' ' || b_availability);


		END LOOP;
		CLOSE bookinfo_cursor1;
	ELSIF x = 2 THEN
		OPEN bookinfo_cursor2;

		LOOP
			FETCH bookinfo_cursor2 INTO b_bid, b_name, b_pid, b_availability;
			EXIT WHEN bookinfo_cursor2%NOTFOUND;
			dbms_output.put_line(b_bid || ' ' || b_name || ' ' ||b_pid || ' ' || b_availability);


		END LOOP;
		CLOSE bookinfo_cursor2;	
	ELSE
		OPEN bookinfo_cursor3;

		LOOP
			FETCH bookinfo_cursor3 INTO b_bid, b_name, b_pid, b_availability;
			EXIT WHEN bookinfo_cursor3%NOTFOUND;
			dbms_output.put_line(b_bid || ' ' || b_name || ' ' ||b_pid || ' ' || b_availability);


		END LOOP;
		CLOSE bookinfo_cursor3;
	
	END IF;
end;
/
commit;