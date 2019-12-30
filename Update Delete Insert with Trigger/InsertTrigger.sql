SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER insert_area 
AFTER DELETE OR INSERT OR UPDATE ON student
FOR EACH ROW  

BEGIN 

	IF INSERTING THEN
		IF :NEW.city = 'Gulshan' THEN
			insert into student1@site_link1 values(:NEW.s_id,:NEW.name,:NEW.department,:NEW.email,:NEW.password,:NEW.city);
		ELSE
			insert into student2@site_link2 values(:NEW.s_id,:NEW.name,:NEW.department,:NEW.email,:NEW.password,:NEW.city);
		END IF;
	END IF;
	
END;
/ 